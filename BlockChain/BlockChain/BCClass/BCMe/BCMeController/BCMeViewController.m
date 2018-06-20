//
//  BCMeViewController.m
//  BlockChain
//
//  Created by 蔡路飞 on 2018/5/21.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCMeViewController.h"
#import "BCMeHeaderView.h"
#import "BCMeTableViewCell.h"
#import "BCMeModel.h"
#import "BCMeTangGuoJiLuListController.h"
#import "BCMeQRCodeController.h"
#import "BCMePDCListController.h"
#import "UIBarButtonItem+ZZExtension.h"
#import "BCSetViewController.h"
#import "BCTaskViewController.h"
#import "BCTaskDetailViewController.h"
#import "BCMeInvitingFriendsController.h"
#import "BCRequestData.h"
#import "BCTangGuoListMode.h"
#import "KMQRCode.h"
#import "BCGamePlayController.h"


@interface BCMeViewController ()<UITableViewDataSource,UITableViewDelegate,BCMeHeaderViewDelegate,BCMeTableViewCellDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)BCMeHeaderView *meHeaderView;//我的钱包顶部试图
@property(nonatomic,strong)NSMutableArray *headerArray;//顶部数据
@property(nonatomic,strong)NSMutableArray *listArray;//列表数据
@property(nonatomic,strong)BCMeModel *meModel;//数据源

@property(nonatomic,strong)SARefreshGifHeader *header;
@property(nonatomic,strong)BCRefreshAutoGifFooter *footer;
@property(nonatomic,strong)UIImage *Qiamge;
@property(nonatomic,assign)BOOL isRresh;


//@property(nonatomic,strong)BCMeNoShuJuView *noView;
@end

@implementation BCMeViewController

static NSString * const cellidenfder = @"BCMeTableViewCell";

#define HeaderViewHeight   (SYRealValue(230))  //顶部view高度

#define cellNoShuJuHeight  (SCREEN_HEIGHT-(SYRealValue(230))-kTabBarHeight-kTabBarHeight)  //无网络数据的view高度

/***数据源***/
-(NSMutableArray *)headerArray{
    if (!_headerArray) {
        
        _headerArray= [NSMutableArray array];
    }
    return _headerArray;
}
-(NSMutableArray *)listArray{
    if (!_listArray) {
        _listArray= [NSMutableArray array];
    }
    return _listArray;
}
-(BCMeModel *)meModel{
    if (!_meModel) {
        _meModel = [[BCMeModel alloc] init];
    }
    return _meModel;
}

/**表格**/
-(UITableView *)tableView{
    if (!_tableView) {
        self.automaticallyAdjustsScrollViewInsets = NO;
        _tableView= [[UITableView alloc]initWithFrame:CGRectMake(0, 0, LFscreenW, LFscreenH-kTabBarHeight-kTopHeight) style:UITableViewStyleGrouped];
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
-(BCMeHeaderView *)meHeaderView{
    if (!_meHeaderView) {
        _meHeaderView = [[BCMeHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, HeaderViewHeight)];
        _meHeaderView.delegate=self;
//        _meHeaderView.model =self.meModel;
        //_meHeaderView.backgroundColor =[UIColor redColor];
    }
    return _meHeaderView;
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //加载数据
    [self loadNewData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏
    [self setNaviTitle];
    //增加下拉刷新
    //[self createRefresh];
   
    //设置导航按钮
    [self setupUIBarButtonItem];
    //初始化tableivew
    [self.view addSubview:self.tableView];
    //加载headerView
     self.tableView.tableHeaderView =  self.meHeaderView;
    //增加重新加载监听
    [self addGainRefresh];
   
}

#pragma mark -增加重新加载监听
-(void)addGainRefresh{
    WS(weakSelf);
    //点击从新加载回到
    self.tableView.headerRefreshingBlock = ^{
        [weakSelf loadNewData];
    };
//    self.tableView.footerRefreshingBlock = ^{
//    };
}

//下拉加载
-(void)loadNewData{
    //[MBManager showWaitingWithTitle:@"加载.."];
    [self loadUpData];
}

-(void)loadUpData{
    NSMutableDictionary * candyDict = diction;
    candyDict[@"token"] = loginToken;
    //NSLog(@"%@",USER_INFO);
    
    [BCRequestData getUser_InfoDict:candyDict success:^(id responseObject) {
        //[MBManager hideAlert];
        BCMeModel *model = [BCMeModel mj_objectWithKeyValues:REQUEST_DATA];
        self.meModel=model;
        [self loadListData];//请求list数据
         [LFAccountTool saveMe:model];
        [self.header endRefreshing];
    } erorr:^(id error) {//请求失败
        self.tableView.loadErrorType = YYLLoadErrorTypeNoNetwork;
    }];
}

-(void)loadListData{
    //BCMeModel * meModel = [self.listArray lastObject];
    NSMutableDictionary * candyDict = diction;
    candyDict[@"token"] = loginToken;
    [self.listArray removeAllObjects];
    NSLog(@"%@",MY_TOKEN_LIST);
    [BCRequestData get_Token_List_Dict:candyDict success:^(id responseObject) {
        //[MBManager hideAlert];
        BCMeDownModel *model = [BCMeDownModel mj_objectWithKeyValues:responseObject[@"data"]];
        self.meModel.coin = model.coin;
        self.meHeaderView.model =self.meModel;//传递数据
        self.listArray = [BCTangGuoListMode mj_objectArrayWithKeyValuesArray:model.list];
        
        //判断网络
        noDataHeight =HeaderViewHeight;
        self.tableView.loadErrorType = YYLLoadErrorTypeNoData;
        noDataHeight =0;
        
        if (self.listArray.count>0) {
            self.tableView.loadErrorType = YYLLoadErrorTypeDefalt;
        }
        //self.isRresh =YES;//刷新
        [self.tableView reloadData];
    } erorr:^(id error) {
        self.tableView.loadErrorType = YYLLoadErrorTypeNoNetwork;
    }];

}
//上拉加载
-(void)loadMoreData{
    [self.footer endRefreshing];
}

-(void)setNaviTitle{
    self.navigationItem.title=@"雷鹿财富";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:FONT(@"PingFangSC-Regular", SXRealValue(17)),
       NSForegroundColorAttributeName:naverTextColor}];
}

//右边边导航控制器右边item
- (void)setupUIBarButtonItem {
    UIBarButtonItem *rightItemButton =[UIBarButtonItem itemWithImage:@"me_set_icon" hightImage:nil target:self action:@selector(onNavButtonTapped:event:)];
    self.navigationItem.rightBarButtonItem =rightItemButton;
    // self.navigationController.automaticallyAdjustsScrollViewInsets = YES;
}
#pragma mark-右侧导航按钮item 点击事件
-(void)onNavButtonTapped:(UIBarButtonItem *)sender event:(UIEvent *)event{
    BCSetViewController *setVc =[[BCSetViewController alloc] init];
    setVc.model =self.meModel;
    [self.navigationController pushViewController:setVc animated:YES];
}



#pragma 糖果记录跳转
-(void)tangGuoBtnClick{
    BCMeTangGuoJiLuListController *vc = [[BCMeTangGuoJiLuListController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

#pragma 糖果更多记录跳转
-(void)moreTangGuoBtnClick{
    BCTaskViewController *taskVc =[[BCTaskViewController alloc] init];
    [self.navigationController pushViewController:taskVc animated:YES];
}
#pragma 二维码
-(void)QRCodeBtnClick{
    //生成二维码 并传递图片下去
    BCMeQRCodeController *QRVc= [[BCMeQRCodeController alloc] init];
    QRVc.isShouKuan =NO;
    QRVc.meModel  = self.meModel;
    [self.navigationController pushViewController:QRVc animated:YES];
}

-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section{
        return  0.01 ;
}

-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section{
        return  (SYRealValue(13)) ;
}

////新增加
//-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
//{
//    return (self.listArray.count<1 && self.isRresh==YES) ? cellNoShuJuHeight : 0.01;
//}
//
////返回高度
//-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//
//    return (self.listArray.count<1 && self.isRresh==YES) ? self.noView : nil;
//}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return  self.listArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return (SYRealValue(54));
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //添加事件
    BCMeTableViewCell *cell = [BCMeTableViewCell getCellWithTableView:tableView cellForRowAtIndexPath:indexPath];
    BCTangGuoListMode *listMode = self.listArray[indexPath.row];
    cell.delegate =self;
    cell.model =listMode;
    return cell;
}
//进入PDC简介
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BCTangGuoListMode *listMode = self.listArray[indexPath.row];
    BCMePDCListController *pdcListVc = [[BCMePDCListController alloc] init];
    pdcListVc.code =listMode.code;//苹果id
    [self.navigationController pushViewController:pdcListVc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
