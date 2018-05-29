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
@interface BCTaskViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,UISearchBarDelegate>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)BCTaskTopView * taskTopView;

@property(nonatomic,strong)SARefreshGifHeader *header;
@property(nonatomic,strong)BCRefreshAutoGifFooter *footer;
@property(nonatomic,assign)NSInteger page;
@property(nonatomic,assign)NSMutableArray *listArray;
@property(nonatomic,assign)NSMutableArray *allListArray;


@end
static NSString * const cellidenfder = @"BCTaskTableViewCell";
@implementation BCTaskViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"任务版";
    [self setTable];
    [self createTopView];
    [self createRefresh];
}
- (void)createRefresh
{
    SARefreshGifHeader *header = [SARefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    BCRefreshAutoGifFooter *footer = [BCRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    [header beginRefreshing];
    self.tableView.mj_header = header;
    self.tableView.mj_footer = footer;
    self.header =header;
    self.footer =footer;
    
}
//下拉加载
-(void)loadNewData{
    self.page=1;
    [self.allListArray removeAllObjects];
    [self loadData];
    
}
//上拉加载
-(void)loadMoreData{
    self.page+=1;
    [self loadData];
}
-(void)loadData{
    NSMutableDictionary * candyDict = diction;
    candyDict[@"token"] = loginToken;
    //candyDict[@"code"] = self.code;//糖果id
    candyDict[@"size"] = @100;//糖果id
    candyDict[@"page"] = [NSString stringWithFormat:@"%ld",self.page];//糖果id
    
    
    
//    [BCRequestData get_token_Detail_Dict:candyDict success:^(id responseObject) {
//        self.PDCmodel = [BCMePDCMode mj_objectWithKeyValues:responseObject[@"data"]];
//        self.listArray = [BCMePDCListMode mj_objectArrayWithKeyValuesArray:self.PDCmodel.ucl];
//        //[self.zonglistArray addObjectsFromArray:self.listArray];
//        [self.tableView reloadData];
//        [self.header endRefreshing];
//    } erorr:^(id error) {
//        [self.header endRefreshing];
//
//    }];
}
-(void)createTopView{
    self.taskTopView = [BCTaskTopView loadNameBCTaskTopViewViewXib];
   
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

-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return  0 ;
    }else{
        return 0.01f;
    }
    
}

-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01f;
    
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return     10;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 200;
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    BCTaskTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellidenfder];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BCTaskDetailViewController  * taskVc = [[BCTaskDetailViewController  alloc] init];
    [self.navigationController pushViewController:taskVc animated:YES];
}
@end
