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

@interface BCMePDCListController ()<UITableViewDataSource,UITableViewDelegate,BCMePDCListUpCellDelegate,BCMePDCListAlertViewDelegate>
@property(nonatomic,strong)BCMePDCListHeaderView *headerView;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)BCMePDCListMode *model;
@property(nonatomic,strong)BCMePDCListAlertView *alertView;//弹框

@property(nonatomic,strong)SARefreshGifHeader *header;
@property(nonatomic,strong)BCRefreshAutoGifFooter *footer;
@property(nonatomic,assign)NSInteger page;
@property(nonatomic,strong)NSMutableArray *listArray;
@property(nonatomic,strong)NSMutableArray *zonglistArray;

@property(nonatomic,strong)BCMePDCMode *PDCmodel;
@end

@implementation BCMePDCListController
//#define HeaderViewHeight   ((SYRealValue(190))-kTopHeight)  //顶部view高度

#define HeaderViewHeight   ((SYRealValue(67+33+23))+kTopHeight+(SYRealValue(235)))  //顶部view高度
//弹框
#define alertViewWidth    SCREENWIDTH-2*(SXRealValue(16))
#define alertViewHeight   (SCREENWIDTH-2*(SXRealValue(16)))*467/343)



-(NSMutableArray *)listArray{
    if (!_listArray) {
        _listArray= [NSMutableArray array];
    }
    return _listArray;
}
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
        NSLog(@"%f",kTopHeight);
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
-(void)abc{
    
    
}


#pragma mark -BCMePDCListAlertViewDelegate 加载官网按钮
-(void)guanWangBtnClick:(BCMePDCMode *)model{
    NSString *path = [NSString stringWithFormat:@"http://%@",model.partner.site];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:path]];
}
#pragma mark -BCMePDCListAlertViewDelegate 知道了按钮点击
-(void)sureBtnClick:(BCMePDCListMode *)model{
    NSLog(@"点击了确定按钮");
    [GKCover hide];
}



- (void)viewWillAppear:(BOOL)animated {
//去掉背景图片
[self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
//去掉底部线条
[self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
}

- (void)viewWillDisappear:(BOOL)animated {
    
 [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"millcolorGrad"] forBarMetrics:UIBarMetricsDefault];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    _page =0;
    //设置导航栏
    [self setNaviTitle];
    //增加刷新
    [self createRefresh];
    //初始化tableivew
    [self.view addSubview:self.tableView];
    //加载headerView
//    self.tableView.tableHeaderView =  self.headerView;
//    //初始化转账与收款
//    [self setPayOrGetMoneyBtn];
    
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
    if(self.zonglistArray.count>0){
        [self.zonglistArray removeAllObjects];
    }
    [self loadData];

}
//上拉加载
-(void)loadMoreData{
    self.page+=1;
  [self loadData];
    
}
-(void)loadData{
    WS(weakSelf);
    NSMutableDictionary * candyDict = diction;
    candyDict[@"token"] = loginToken;
    candyDict[@"code"] = self.code;//糖果id
    candyDict[@"size"] = @100;//糖果id
    candyDict[@"page"] = [NSString stringWithFormat:@"%ld",self.page];//糖果id
    
    [BCRequestData get_token_Detail_Dict:candyDict success:^(id responseObject) {
    self.PDCmodel = [BCMePDCMode mj_objectWithKeyValues:responseObject[@"data"]];
    self.listArray = [BCMePDCListMode mj_objectArrayWithKeyValuesArray:self.PDCmodel.ucl];
       
        if(self.PDCmodel.partner!=nil){
            //初始化转账与收款
            [weakSelf setPayOrGetMoneyBtn];
        }
        if(self.listArray.count>0){
            [self.zonglistArray addObjectsFromArray:self.listArray];
            [self.footer endRefreshing];
            [self.header endRefreshing];
        }
        if(self.listArray.count==0){
            [self.footer endRefreshingWithNoMoreData];
        }
        [self.tableView reloadData];
        [self.footer endRefreshing];
        [self.header endRefreshing];
    } erorr:^(id error) {
        [self.header endRefreshing];
        [self.footer endRefreshing];
        
    }];
}

#pragma mark -点击详情按钮
-(void)xiaQingBtnClickWithModel:(BCMePDCMode *)model{
    //BCCodeAlertView * codeAlertView  =[BCCodeAlertView loadNameBCCodeAlertViewXib];
    self.alertView.model=self.PDCmodel;
    //self.alertView.clf_size = CGSizeMake(SXRealValue(343), SYRealValue(467));
    [GKCover coverFrom:[UIApplication sharedApplication].keyWindow contentView:self.alertView style:GKCoverStyleTranslucent showStyle:GKCoverShowStyleCenter showAnimStyle:GKCoverShowAnimStyleBottom hideAnimStyle:GKCoverHideAnimStyleCenter notClick:NO];
}
                                                                            
#pragma 底部转账与收款
-(void)setPayOrGetMoneyBtn{
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor =naverTextColor;
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
    [self.view addSubview:view];
    UIView *line1 = [[UIView alloc] init];
    line1.backgroundColor = colorE5E7E9;
    [self.view addSubview:line1];
    
    [view addSubview:payBtn];
    [view addSubview:line];
    [view addSubview:getBtn];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).with.offset(0);
        make.right.mas_equalTo(self.view.mas_right).with.offset(0);
        make.bottom.mas_equalTo(self.view.mas_bottom).with.offset(0);
        make.height.mas_equalTo(49);
    }];
    [payBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view.mas_left).with.offset(0);
        make.top.mas_equalTo(view.mas_top).with.offset(0);
        make.width.mas_equalTo(SCREENWIDTH/2-1);
        make.bottom.mas_equalTo(view.mas_bottom).with.offset(0);
    }];
    [getBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(view.mas_right).with.offset(0);
        make.top.mas_equalTo(view.mas_top).with.offset(0);
        make.width.mas_equalTo(SCREENWIDTH/2-1);
        make.bottom.mas_equalTo(view.mas_bottom).with.offset(0);
    }];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view.mas_top).with.offset((SYRealValue(5)));
        make.bottom.mas_equalTo(view.mas_bottom).with.offset((SYRealValue(-5)));
        make.centerX.mas_equalTo(view.mas_centerX);
        make.width.mas_equalTo((SYRealValue(1)));
    }];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view.mas_top).with.offset((SYRealValue(0)));
        make.left.mas_equalTo(self.view.mas_left).with.offset(0);
        make.right.mas_equalTo(self.view.mas_right).with.offset((SYRealValue(-0.6)));
        make.height.mas_equalTo((SYRealValue(0.6)));
    }];
    
}

#pragma mark - 转账按钮
-(void)payBtnClick{
    //已进行实名认证
    BCMeChangeMoneyController *moneyVc = [[BCMeChangeMoneyController alloc] init];
    moneyVc.code =self.code;
    [self.navigationController pushViewController:moneyVc animated:YES];
}
#pragma mark -收款按钮
-(void)getBtnClick{
    BCMeQRCodeController *QRVc= [[BCMeQRCodeController alloc] init];
    QRVc.isShouKuan =YES;
    [self.navigationController pushViewController:QRVc animated:YES];
    NSLog(@"二维码");
}
-(void)setNaviTitle{
    self.navigationItem.title=[NSString stringWithFormat:@"%@总数",self.code];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:FONT(@"PingFangSC-Regular", SXRealValue(16)),
       NSForegroundColorAttributeName:naverTextColor}];
}


-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return 0.01;
    }else{
        return  (SYRealValue(54)) ;
    }
}

//返回高度
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return nil;
    }else{
        if (self.listArray.count<1) return nil;
    UIView *view= [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, (SYRealValue(54)))];
    view.backgroundColor = naverTextColor;
    UILabel *tangGuoJiLulable = [UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(15)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
    tangGuoJiLulable.text =@"收款记录";
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
//-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 50;
//}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return 1;
    }else{
        return  self.zonglistArray  .count;
    }
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 300;
    }else{
       return (SYRealValue(54));
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
        cell.model =self.PDCmodel;
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
