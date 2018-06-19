//
//  BCTaskViewController.m
//  BlockChain
//
//  Created by 蔡路飞 on 2018/5/23.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCTaskViewController.h"
#import "BCTaskTopView.h"
#import "BCTaskTableViewCell.h"
#import "BCTaskDetailViewController.h"
#import "BCHomeModel.h"
#import "BCMeInvitingFriendsController.h"
#import "BCMeNoDataFooterView.h"

@interface BCTaskViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,UISearchBarDelegate>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)BCTaskTopView * taskTopView;
@property(nonatomic,strong)NSMutableArray * platTaskLogModels;
@property(nonatomic,strong)NSMutableArray * imgs;
@property(nonatomic,strong)NSMutableArray * taskInfoModels;
@property(nonatomic,assign)BOOL isRresh;//是否有数据
@property(nonatomic,strong)BCMeNoDataFooterView *noView;//无数据底部展示图片
@end
static NSString * const cellidenfder = @"BCTaskTableViewCell";
@implementation BCTaskViewController
#define cellNoShuJuHeight  (300)  //无网络数据的view高度


-(NSMutableArray *)imgs{
    
    if (!_imgs) {
        _imgs = [NSMutableArray array];
    }
    return _imgs;
}

/**无数据view**/
-(BCMeNoDataFooterView *)noView{
    if (!_noView) {
        _noView = [[BCMeNoDataFooterView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, cellNoShuJuHeight)];
        _noView.centerIcon.image =[UIImage imageNamed:@"无消息"];
        _noView.message.text = @"这里是空的喲~";
        _noView.backgroundColor =[UIColor whiteColor];
    }
    return _noView;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadNewData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"任务板";
    [self setTable];
    [self createTopView];
    [self createRefresh];
    //提前请求下载地址
    [self loadDownURl];
}

-(void)loadDownURl{
    NSMutableDictionary * candyDict = diction;
    candyDict[@"token"] = loginToken;
    [BCRequestData get_DownUrl_Dict:candyDict success:^(id responseObject) {
        NSString *downLoadUrl  = responseObject[@"data"][@"downloadUrl"];
        [USER_DEFAULT setObject:downLoadUrl forKey:@"downUrlPath"];
    } erorr:^(id error) {
    }];
    
}
- (void)createRefresh
{
    SARefreshGifHeader *header = [SARefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    BCRefreshAutoGifFooter *footer = [BCRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    self.tableView.mj_footer = footer;
    self.tableView.mj_header = header;
    [self.tableView.mj_header beginRefreshing];
}
-(void)loadMoreData{
    
    TaskInfoModel *  taskInfoModel =   [self.taskInfoModels lastObject];
    NSMutableDictionary * computePowerDict = diction;
    computePowerDict[@"token"] =loginToken;
    computePowerDict[@"lastId"] =taskInfoModel.ID;
    computePowerDict[@"size"] =@"10";
    
    [YWRequestData taskListDict:computePowerDict success:^(id responseObj) {
        NSMutableArray * arr =  [TaskInfoModel mj_objectArrayWithKeyValuesArray:responseObj[@"data"]];
        self.taskInfoModels = [TaskInfoModel mj_objectArrayWithKeyValuesArray:responseObj[@"data"]];
        
        [self.taskInfoModels addObjectsFromArray:arr];
        [self.tableView reloadData];
        [self.tableView.mj_footer endRefreshing];
        if (arr.count<=0) {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }
        
    }];
    
}
-(void)loadNewData{
    NSMutableDictionary * computePowerDict = diction;
    computePowerDict[@"token"] =loginToken;
    [self.imgs removeAllObjects];
    [YWRequestData userTaskListDict:computePowerDict success:^(id responseObj) {
        self.isRresh =YES;//证明有数据
        self.platTaskLogModels = [PlatTaskLogModel mj_objectArrayWithKeyValuesArray:responseObj[@"data"][@"platTaskLogs"]];
        [self.imgs addObject:responseObj[@"data"][@"bannerPic"]];
        self.taskTopView.platTaskLogModels =  self.platTaskLogModels;
        self.taskTopView.imgs =  self.imgs;
        [self.tableView.mj_header endRefreshing];
        
        [self computePower];
    }];
    
}
-(void)computePower{
    NSMutableDictionary * computePowerDict = diction;
    computePowerDict[@"token"] =loginToken;
    //    computePowerDict[@"lastId"] =loginToken;
    computePowerDict[@"size"] =@"10";
    
    [YWRequestData taskListDict:computePowerDict success:^(id responseObj) {
        self.taskInfoModels = [TaskInfoModel mj_objectArrayWithKeyValuesArray:responseObj[@"data"]];
        
        [self.tableView reloadData];
        if (  self.taskInfoModels.count<10) {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }
        [self.tableView.mj_header endRefreshing];
    }];
}
-(void)createTopView{
    WeakSelf(weakSelf)
    self.taskTopView = [BCTaskTopView loadNameBCTaskTopViewViewXib];
    self.taskTopView .skipPage = ^(PlatTaskLogModel *platTaskLogModel) {
        if ([platTaskLogModel.skipType isEqualToString:@"0"]) {
            
        }else{
            BCMeInvitingFriendsController * meInvitingFriendsvc = [[BCMeInvitingFriendsController alloc] init];
            [weakSelf.navigationController pushViewController:meInvitingFriendsvc animated:YES];
        }
    };
    self.tableView.tableHeaderView =  self.taskTopView;
    
}
-(void)setTable{
    
    self.tableView= [[UITableView alloc]initWithFrame:CGRectMake(0, 0, LFscreenW, LFscreenH-kTopHeight) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor  =bagColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //       self.tableView.contentInset = UIEdgeInsetsMake(-kTopHeight, 0, 0, 0);
    [self.tableView registerNib:[UINib nibWithNibName:cellidenfder bundle:nil] forCellReuseIdentifier:cellidenfder];
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        self.tableView.estimatedRowHeight = 0;
        self.tableView.estimatedSectionHeaderHeight = 0;
        self.tableView.estimatedSectionFooterHeight = 0;
    }
    
}

//返回高度
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
        return (self.taskInfoModels.count<1 && self.isRresh==YES) ? self.noView : nil;
}

-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
{
        return (self.taskInfoModels.count<1 && self.isRresh==YES) ? cellNoShuJuHeight : 0.01;
}


//-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
//{
//    if (section==0) {
//        return  0 ;
//    }else{
//        return 0.01f;
//    }
//
//}

//-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 0.01f;
//
//
//}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return       self.taskInfoModels.count;
    
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    {
        return 70;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TaskInfoModel *taskInfoModel = self.taskInfoModels[indexPath.row];
    BCTaskTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellidenfder];
    cell. taskInfoModel = taskInfoModel;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     TaskInfoModel *taskInfoModel = self.taskInfoModels[indexPath.row];
    BCTaskDetailViewController  * taskVc = [[BCTaskDetailViewController  alloc] init];
    taskVc.taskId = taskInfoModel.ID;
    [self.navigationController pushViewController:taskVc animated:YES];
}
@end
