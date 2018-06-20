//
//  BCMePDCListController.m
//  BlockChain
//
//  Created by Mac on 2018/5/23.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCMePDCListController.h"
#import "BCMePDCListHeaderView.h"
#import "BCMeTangGuoJiLuMode.h"
#import "BCMePDCMode.h"
#import "BCMePDCListMode.h"

#import "BCMePDCListAlertView.h"

#import "BCSetViewController.h"
#import "BCMeChangeMoneyController.h"
#import "BCMeQRCodeController.h"
#import "BCMePDCListUpCell.h"
#import "BCMePDCListDownCell.h"
#import "BCMeNoDataFooterView.h"

@interface BCMePDCListController ()<UITableViewDataSource,UITableViewDelegate,BCMePDCListUpCellDelegate,BCMePDCListAlertViewDelegate>
@property(nonatomic,strong)BCMePDCListHeaderView *headerView;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)BCMeNoDataFooterView *noView;//无数据view
@property(nonatomic,strong)BCMePDCListMode *model;
@property(nonatomic,strong)BCMePDCListAlertView *alertView;//弹框

@property(nonatomic,strong)SARefreshGifHeader *header;
@property(nonatomic,strong)BCRefreshAutoGifFooter *footer;
@property(nonatomic,assign)NSInteger page;
@property(nonatomic,strong)NSMutableArray *zonglistArray;
@property(nonatomic,strong)BCMePDCMode *PDCmodel;
@property(nonatomic,strong)UIView *bottomView;

@property(nonatomic,assign)BOOL isFirstRefresh;//第一次加载
@property(nonatomic,assign)BOOL isRefresh;//是否刷新
@property(nonatomic,copy)NSString *coin;
@property(nonatomic,assign)BOOL isUpLoad;//是否是上拉加载
@property(nonatomic,assign)BOOL isNoNetWork;//当前是否有网络
@property(nonatomic,assign)BOOL isRresh;//是否刷新
@property(nonatomic,assign)BOOL isAnBtn;//是否按按钮
@property(nonatomic,assign)BOOL back;//是否是上一页返回

@property(nonatomic,assign)BOOL yuanNav;
@property(nonatomic,strong)NSMutableDictionary *heightAtIndexPath;
@end

@implementation BCMePDCListController
//#define HeaderViewHeight   ((SYRealValue(190))-kTopHeight)  //顶部view高度

#define HeaderViewHeight   ((SYRealValue(67+33+23))+kTopHeight+(SYRealValue(235)))  //顶部view高度
#define alertViewWidth    SCREENWIDTH-2*(SXRealValue(16))//弹框
#define alertViewHeight   (SCREENWIDTH-2*(SXRealValue(16)))*467/343)
#define upBigViewHeight   ((SYRealValue(67+33+23)))
#define cellNoShuJuHeight  (300)  //无网络数据的view高度



-(NSMutableArray *)zonglistArray{
    if (!_zonglistArray) {
        _zonglistArray= [NSMutableArray array];
    }
    return _zonglistArray;
}
/**表格**/
-(UITableView *)tableView{
    if (!_tableView) {
        self.automaticallyAdjustsScrollViewInsets = NO;
        _tableView= [[UITableView alloc]initWithFrame:CGRectMake(0, 0, LFscreenW, LFscreenH-49) style:UITableViewStyleGrouped];
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
#pragma mark - Getters
- (NSMutableDictionary *)heightAtIndexPath
{
    if (!_heightAtIndexPath) {
        _heightAtIndexPath = [NSMutableDictionary dictionary];
    }
    return _heightAtIndexPath;
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

/**顶部view**/
//-(BCMePDCListHeaderView *)headerView{
//    if (!_headerView) {
//        _headerView = [[BCMePDCListHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, HeaderViewHeight)];
//        _headerView.delegate =self;
////        _headerView.model=self.model;
//    }
//    return _headerView;
//}
/**顶部view**/
-(BCMePDCListAlertView *)alertView{
    if (!_alertView) {
        _alertView = [[BCMePDCListAlertView alloc] initWithFrame:CGRectMake(SXRealValue(16), (SYRealValue(110)), alertViewWidth, alertViewHeight];
        [Util roundBorderView:SXRealValue(3) border:0 color:[UIColor blackColor] view:_alertView];

        //_alertView.backgroundColor =[UIColor greenColor];
//[_alertView.guanWangBtn addTarget:self action:@selector(abc) forControlEvents:UIControlEventTouchUpInside];
        _alertView.delegate =self;
    }
    return _alertView;
                                                                        
}



#pragma mark -BCMePDCListAlertViewDelegate 加载官网按钮
-(void)guanWangBtnClick:(BCMePDCMode *)model{
    NSString *path;
    if([model.partner.site hasPrefix:@"http://"]){//有链接
        path = [NSString stringWithFormat:@"%@",model.partner.site];
    }else{
        path = [NSString stringWithFormat:@"http://%@",model.partner.site];
    }
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:path] options:@{UIApplicationOpenURLOptionUniversalLinksOnly: @NO} completionHandler:^(BOOL success) {
        
    }];
    
    
}
#pragma mark -BCMePDCListAlertViewDelegate 知道了按钮点击
-(void)sureBtnClick:(BCMePDCListMode *)model{
    //NSLog(@"点击了确定按钮");
    [GKCover hide];


}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.isAnBtn =NO;
        [self setNaviImageHidden];
    //是否刷新
//    if(_isRefresh==YES){
        [self loadNewData];
//        _isRefresh =NO;
//    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.isAnBtn =YES;
    [self setNaviImage];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if(self.back){
        if(self.yuanNav){
            //设置导航图片
            [self setNaviImage];
        }else{
            //设置透明导航
            [self setNaviImageHidden];
        }
    }
}

//设置导航图片为透明
-(void)setNaviImageHidden{
    //去掉背景图片
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    //去掉底部线条
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
}
//设置导航图片
-(void)setNaviImage{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"millcolorGrad"] forBarMetrics:UIBarMetricsDefault]; 
}
                                                                 
                                                                            
- (void)viewDidLoad {
    [super viewDidLoad];
    self.isAnBtn =NO;
    _isFirstRefresh=YES;
    _page =0;
    //设置导航栏
    [self setNaviTitle:self.code];
    //增加刷新
    [self createRefresh];
    //初始化tableivew
    [self.view addSubview:self.tableView];
    //初始化转账与收款
    //[self setPayOrGetMoneyBtn];
    [self addGainRefresh];
    //初始化转账与收款
    [self setPayOrGetMoneyBtn];
    
}
                                                                            
#pragma mark -增加重新加载监听
-(void)addGainRefresh{
    WS(weakSelf);
    //点击从新加载回到
    self.tableView.headerRefreshingBlock = ^{
        [weakSelf loadNewData];
    };
    self.tableView.footerRefreshingBlock = ^{
    };
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
    self.isUpLoad =NO;
    self.page=1;
    if(self.zonglistArray.count>0){
        [self.zonglistArray removeAllObjects];
    }
    [self loadData];
}
                                                                            
//上拉加载
-(void)loadMoreData{
    self.isUpLoad =YES;
    self.page+=1;
  [self loadData];
    
}
                                                                            
-(void)loadData{
    NSMutableDictionary * candyDict = diction;
    candyDict[@"token"] = loginToken;
    candyDict[@"code"] = self.code;//糖果id
    candyDict[@"size"] = @20;//糖果id
    candyDict[@"page"] = [NSString stringWithFormat:@"%@",@(self.page)];//糖果id
    NSLog(@"%@",TOKEN_DETAIL);
    [BCRequestData get_token_Detail_Dict:candyDict success:^(id responseObject) {
    self.PDCmodel = [BCMePDCMode mj_objectWithKeyValues:responseObject[@"data"]];
    NSMutableArray* listArray = [BCMePDCListMode mj_objectArrayWithKeyValuesArray:self.PDCmodel.ucl];
        self.isRresh =YES;
        if(self.PDCmodel.partner!=nil){
            [self setNaviTitle:self.PDCmodel.partner.code];
            self.coin =self.PDCmodel.uci.coin;
            if(self.isUpLoad==NO){
                [self setNaviBarHidden:YES setTouMingImage:NO];
            }
            //判断是否有网络
            self.tableView.loadErrorType = YYLLoadErrorTypeDefalt;
            self.bottomView.hidden= NO;
            [self.tableView reloadData];
            [self.footer endRefreshing];
            [self.header endRefreshing];
            //显示导航栏
            if(self.isUpLoad==NO){
                [self setNaviBarHidden:NO setTouMingImage:YES];
            }
        }else{ //无数据
            //改变导航栏的颜色
            [self setNaviImage];
            self.bottomView.hidden= YES;
             self.tableView.loadErrorType = YYLLoadErrorTypeNoData;
            [self.tableView reloadData];
            [self.footer endRefreshing];
            [self.header endRefreshing];
        }
        if(listArray.count>0){
            [self.zonglistArray addObjectsFromArray:listArray];
            [self.footer endRefreshing];
            [self.header endRefreshing];
            
//            if(self.isFirstRefresh){//只执行一次
                //第一次加载
                if(listArray.count<15){
                    [self.footer endRefreshingWithNoMoreData];
                }
                self.isFirstRefresh=NO;
//            }
            [self.tableView reloadData];
        }
        if(listArray.count==0){
            if(self.zonglistArray.count>0){
                self.footer.hidden =NO;
            }else{
                self.footer.hidden =YES;
            }
            //判断是否是第一次加载
            [self.footer endRefreshingWithNoMoreData];
        }
        self.isNoNetWork =NO;//有网络
    } erorr:^(id error) {
        self.isRresh =NO;
        self.isNoNetWork =YES;//无网络
        self.bottomView.hidden =YES;
        [self.header endRefreshing];
        [self.footer endRefreshing];
        [self setNaviTitle:@"TBC"];
        [self setNaviImage];
        [self.tableView reloadData];
        //设置导航栏颜色
        self.tableView.loadErrorType = YYLLoadErrorTypeNoNetwork;
    }];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //增加无法下拉
    [Util cantXiaLaScrollView:scrollView];
    if(self.isAnBtn)return;
    if(self.isNoNetWork==YES) return;//无网络
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY> upBigViewHeight) {
        _yuanNav =YES;
        //设置导航图片
        [self setNaviImage];
    }else{
        _yuanNav =NO;
         //设置透明导航
        [self setNaviImageHidden];
    }
}
                                                                            
                                                                            
//无网络有网络切换，显示或者异常导航栏，适合进入无导航栏切换网络问题
-(void)setNaviBarHidden:(BOOL)isHidden setTouMingImage:(BOOL)isTouMing{
    if(isHidden==YES){
        [self.navigationController setNavigationBarHidden:YES animated:NO];
    }else{
        //刷新之后重新设置导航栏
        [self.navigationController setNavigationBarHidden:NO animated:NO];
        //在设置导航栏的图片
        if(isTouMing==YES){
            if(self.isAnBtn) return;
            [self setNaviImageHidden];//设置透明图片
        }else{
            //[self setNaviImage];//设置图片
        }
    }
}
                                                                            
#pragma mark -点击详情按钮
-(void)xiaQingBtnClickWithModel:(BCMePDCMode *)model{
    //BCCodeAlertView * codeAlertView  =[BCCodeAlertView loadNameBCCodeAlertViewXib];
    self.alertView.model=self.PDCmodel;
    //self.alertView.clf_size = CGSizeMake(SXRealValue(343), SYRealValue(467));
    [GKCover coverFrom:[UIApplication sharedApplication].keyWindow contentView:self.alertView style:GKCoverStyleTranslucent showStyle:GKCoverShowStyleCenter showAnimStyle:GKCoverShowAnimStyleBottom hideAnimStyle:GKCoverHideAnimStyleCenter notClick:NO];
}
-(UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc] init];
    }
    return _bottomView;
}
                                                                            
#pragma 底部转账与收款
-(void)setPayOrGetMoneyBtn{
    self.bottomView.hidden=YES;
    self.bottomView.backgroundColor =naverTextColor;
    UIButton *payBtn = [UIButton getButtonTitleColor:blackBColor titleFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) backGroundColor:naverTextColor target:self action:@selector(payBtnClick)];
    payBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [payBtn setTitle:@"转账  " forState:UIControlStateNormal];
    [payBtn setImage:[UIImage imageNamed:@"转账"] forState:UIControlStateNormal];
    [payBtn  setHitEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -10)];//热区域
//    [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:payBtn];
    UIButton *getBtn = [UIButton getButtonTitleColor:blackBColor titleFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) backGroundColor:naverTextColor target:self action:@selector(getBtnClick)];
    getBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [getBtn setTitle:@"收款  " forState:UIControlStateNormal];
    [getBtn setImage:[UIImage imageNamed:@"收款"] forState:UIControlStateNormal];
    [getBtn  setHitEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -10)];//热区域
//    [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:getBtn];
   //中线
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = colorE5E7E9;
    [self.view addSubview:self.bottomView];
    UIView *line1 = [[UIView alloc] init];
    line1.backgroundColor = colorE5E7E9;
    [self.view addSubview:line1];
    
    [self.bottomView addSubview:payBtn];
    [self.bottomView addSubview:line];
    [self.bottomView addSubview:getBtn];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).with.offset(0);
        make.right.mas_equalTo(self.view.mas_right).with.offset(0);
        make.bottom.mas_equalTo(self.view.mas_bottom).with.offset(0);
        make.height.mas_equalTo(49);
    }];
    [payBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.bottomView.mas_left).with.offset(0);
        make.top.mas_equalTo(self.bottomView.mas_top).with.offset(0);
        make.width.mas_equalTo(SCREENWIDTH/2-1);
        make.bottom.mas_equalTo(self.bottomView.mas_bottom).with.offset(0);
    }];
    [getBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.bottomView.mas_right).with.offset(0);
        make.top.mas_equalTo(self.bottomView.mas_top).with.offset(0);
        make.width.mas_equalTo(SCREENWIDTH/2-1);
        make.bottom.mas_equalTo(self.bottomView.mas_bottom).with.offset(0);
    }];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bottomView.mas_top).with.offset((SYRealValue(5)));
        make.bottom.mas_equalTo(self.bottomView.mas_bottom).with.offset((SYRealValue(-5)));
        make.centerX.mas_equalTo(self.bottomView.mas_centerX);
        make.width.mas_equalTo((SYRealValue(1)));
    }];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bottomView.mas_top).with.offset((SYRealValue(0)));
        make.left.mas_equalTo(self.view.mas_left).with.offset(0);
        make.right.mas_equalTo(self.view.mas_right).with.offset((SYRealValue(-0.6)));
        make.height.mas_equalTo((SYRealValue(0.6)));
    }];
    
}

#pragma mark - 转账按钮
-(void)payBtnClick{
    
    WS(weakSelf);
    //已进行实名认证
    BCMeChangeMoneyController *moneyVc = [[BCMeChangeMoneyController alloc] init];
    moneyVc.coin = self.coin;
    //转账成功回调
    moneyVc.refreshAllData = ^(BOOL isRefresh) {
        weakSelf.isRefresh = isRefresh;
    };
    moneyVc.backBlock = ^(BOOL back) {//从上一页返回
        weakSelf.back = back;
    };
    moneyVc.code =self.code;
    [self.navigationController pushViewController:moneyVc animated:YES];
}
#pragma mark -BCMeChangeMoneyControllerDelegate
-(void)refreshAllData:(BOOL)isRefresh{//刷新数据
    _isRefresh = isRefresh;
}
                                                                            
                                                                            
#pragma mark -收款按钮
-(void)getBtnClick{
    WS(weakSelf);
    BCMeQRCodeController *QRVc= [[BCMeQRCodeController alloc] init];
    QRVc.isShouKuan =YES;
    QRVc.backBlock = ^(BOOL back) {//从上一页返回
        weakSelf.back =back;
    };
    [self.navigationController pushViewController:QRVc animated:YES];
}
-(void)setNaviTitle:(NSString *)naviTitle{
    self.navigationItem.title=[NSString stringWithFormat:@"%@总数",naviTitle];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:FONT(@"PingFangSC-Regular", SXRealValue(16)),
       NSForegroundColorAttributeName:naverTextColor}];
}


//返回高度
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{

    if(section==0){
        return nil;
    }else{
        return (self.zonglistArray.count<1 && self.isRresh==YES) ? self.noView : nil;
    }
}

-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return 0.01;
    }else{
       // CGFloat resultHeight =self.zonglistArray.count<1 ? 0.01  : (SYRealValue(54));
        return (self.isRresh==NO)? 0.01  : (SYRealValue(54));
    }
}
                                                                            
-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
{
    if (section==0) {
             return 0.01;
    }else{
        return (self.zonglistArray.count<1 && self.isRresh==YES) ? cellNoShuJuHeight : 0.01;;
    }
}
                                                                            
//返回高度
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return nil;
    }else{
        if(self.isRresh==NO) return nil;
//        if (self.zonglistArray.count<1) return nil;
    UIView *view= [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, (SYRealValue(54)))];
    view.backgroundColor = naverTextColor;
    UILabel *tangGuoJiLulable = [UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(15)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
    tangGuoJiLulable.text =@"糖果记录";
    UIView *lineView= [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, (SYRealValue(0.6)))];
    lineView.backgroundColor = colorE5E7E9;
    [view addSubview:tangGuoJiLulable];
    [view addSubview:lineView];
    [tangGuoJiLulable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view.mas_left).with.offset(SXRealValue(16));
        make.right.mas_equalTo(view.mas_right).with.offset(SXRealValue(-20));
        make.centerY.equalTo(view.mas_centerY);
    }];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view.mas_left).with.offset(0);
        make.right.mas_equalTo(view.mas_right).with.offset(0);
        make.bottom.mas_equalTo(view.mas_bottom).with.offset((SYRealValue(-0.6)));
        make.height.mas_equalTo((SYRealValue(0.6)));
    }];
    return view;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
            return 1;
    }else{
        return  self.zonglistArray.count;
    }
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSNumber *height = [self.heightAtIndexPath objectForKey:indexPath];
    if (indexPath.section==0) {
        //return 300;
        return height?height.floatValue:400;
    }else{
       return (SYRealValue(54));
    }
}
       
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
    NSNumber *height = @(cell.frame.size.height);
    [self.heightAtIndexPath setObject:height forKey:indexPath];
}
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return UITableViewAutomaticDimension;
    }else{
        return (SYRealValue(54));
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        //添加事件
        BCMePDCListUpCell *cell = [BCMePDCListUpCell getCellWithTableView:tableView cellForRowAtIndexPath:indexPath];
        cell.delegate =self;
        cell.model = self.PDCmodel;
        return cell;
        
    }else{
        BCMePDCListMode *model = self.zonglistArray [indexPath.row];
        //添加事件
        BCMePDCListDownCell *cell = [BCMePDCListDownCell getCellWithTableView:tableView cellForRowAtIndexPath:indexPath];
        cell.model =model;
        return cell;
    }
}

                                                                            
                                                                    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
