//
//  BCMeTangGuoJiLuListController.m
//  BlockChain
//
//  Created by 吴博怡 on 2018/5/22.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCMeTangGuoJiLuListController.h"
#import "BCMeTangGuoJiLuHeaderView.h"
#import "BCMeTangGuoJiLuMode.h"
#import "BCMeTangGuoJiLuCell.h"
#import "UIBarButtonItem+ZZExtension.h"

@interface BCMeTangGuoJiLuListController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)BCMeTangGuoJiLuHeaderView *headerView;
@property(nonatomic,strong)BCMeTangGuoJiLuMode *listMode;//糖果记录mode

@property(nonatomic,strong)SARefreshGifHeader *header;
@property(nonatomic,strong)BCRefreshAutoGifFooter *footer;
@property(nonatomic,assign)NSInteger page;
@property(nonatomic,strong)NSMutableArray *listArray;//列表数据（矿场日常领取、糖果列表、任务板）
@property(nonatomic,strong)NSMutableArray *allListArray;

@end

@implementation BCMeTangGuoJiLuListController

#define HeaderViewHeight   (SYRealValue(140+8+54))  //顶部view高度

-(NSMutableArray *)listArray{
    if (!_listArray) {
        _listArray= [NSMutableArray array];
    }
    return _listArray;
}
-(NSMutableArray *)allListArray{
    if (!_allListArray) {
        _allListArray= [NSMutableArray array];
    }
    return _allListArray;
}

/**表格**/
-(UITableView *)tableView{
    if (!_tableView) {
        self.automaticallyAdjustsScrollViewInsets = NO;
        _tableView= [[UITableView alloc]initWithFrame:CGRectMake(0, 0, LFscreenW, LFscreenH-kTopHeight) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor  =bagColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.estimatedRowHeight = 300;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            _tableView.estimatedRowHeight = 0;
            _tableView.estimatedSectionHeaderHeight = 0;
            _tableView.estimatedSectionFooterHeight = 0;
        }
    }
    return _tableView;
}

/**顶部view**/
-(BCMeTangGuoJiLuHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [[BCMeTangGuoJiLuHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, HeaderViewHeight)];
    }
    return _headerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"糖果包";
    //请求数据
    [self createRefresh];
    //设置导航按钮
    [self setupUIBarButtonItem];
    //初始化tableivew
    [self.view addSubview:self.tableView];
    //加载headerView
    self.tableView.tableHeaderView =  self.headerView;
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
    if (self.allListArray.count>0) {
         [self.allListArray removeAllObjects];
    }
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
    candyDict[@"size"] = @20;//糖果id
    candyDict[@"page"] = [NSString stringWithFormat:@"%ld",self.page];//糖果id
    
    [BCRequestData get_candy_List_Dict:candyDict success:^(id responseObject) {
        self.listArray = [BCMeTangGuoJiLuMode mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
        [self.allListArray addObjectsFromArray:self.listArray];
        [self.headerView setUpImage:[UIImage imageNamed:@"雷鹿财富logoc-2"]];
        [self.tableView reloadData];
        [self.header endRefreshing];
        [self.footer endRefreshing];
    } erorr:^(id error) {
        [self.header endRefreshing];
        [self.footer endRefreshing];
    }];
}



//右边边导航控制器右边item
- (void)setupUIBarButtonItem {
    UIBarButtonItem *rightItemButton =[UIBarButtonItem itemWithImage:@"me_set_icon" hightImage:nil target:self action:@selector(onNavButtonTapped:event:)];
    self.navigationItem.rightBarButtonItem =rightItemButton;
    // self.navigationController.automaticallyAdjustsScrollViewInsets = YES;
}
#pragma mark-右侧导航按钮item 点击事件
-(void)onNavButtonTapped:(UIBarButtonItem *)sender event:(UIEvent *)event
{

}
//-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return  (SYRealValue(54)) ;
//}
//返回高度
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

//        UIView *view= [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, (SYRealValue(54)))];
//        UILabel *tangGuoJiLulable = [UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(16)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//        tangGuoJiLulable.text =@"糖果记录";
//        [view addSubview:tangGuoJiLulable];
//        [tangGuoJiLulable mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(view.mas_left).with.offset(SXRealValue(16));
//            make.right.mas_equalTo(view.mas_right).with.offset(SXRealValue(-20));
//            make.centerY.equalTo(view.mas_centerY);
//        }];
//        return nil;
//}
//-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 50;
//}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return  self.allListArray.count;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return (SYRealValue(54));
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BCMeTangGuoJiLuMode *model = self.allListArray[indexPath.row];
        //添加事件
        BCMeTangGuoJiLuCell *cell = [BCMeTangGuoJiLuCell getCellWithTableView:tableView cellForRowAtIndexPath:indexPath];
        cell.model =model;
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
