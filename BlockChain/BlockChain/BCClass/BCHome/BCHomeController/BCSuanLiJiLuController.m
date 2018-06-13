//
//  BCSuanLiJiLuController.m
//  BlockChain
//
//  Created by Mac on 2018/5/25.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCSuanLiJiLuController.h"
#import "BCSuanLiJiLuModel.h"
#import "BCHomeSuanLiUpCell.h"
#import "BCHomeSuanLiDownCell.h"
#import "BCTaskViewController.h"
#import "BCMeNoDataFooterView.h"


@interface BCSuanLiJiLuController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)BCMeNoDataFooterView *noView;//无数据view

@property(nonatomic,strong)BCSuanLiJiLuModel *model;
@property(nonatomic,strong)BCSuanLiJiLuListModel *listMode;

@property(nonatomic,strong)SARefreshGifHeader *header;
@property(nonatomic,strong)BCRefreshAutoGifFooter *footer;
@property(nonatomic,assign)NSInteger start;
@property(nonatomic,strong)NSMutableArray *allListArray;
@property(nonatomic,strong)UIView *jiaSuView;

@property(nonatomic,assign)BOOL isUpLoad;//是否是上拉加载
@property(nonatomic,assign)BOOL isNoNetWork;//当前是否有网络
@property(nonatomic,assign)BOOL isRresh;//是否刷新
@property(nonatomic,assign)BOOL isAnBtn;
@end

@implementation BCSuanLiJiLuController

#define JiaSuBtnViewHeight  (SYRealValue(95)) //底部加速算力view高度
//顶部总体高度
#define upBigViewHeight   ((SYRealValue(197)))
#define cellNoShuJuHeight  (300)  //无网络数据的view高度


-(NSMutableArray *)allListArray{
    if (!_allListArray) {
        _allListArray = [NSMutableArray array];
    }
    return _allListArray;
}

/**表格**/
-(UITableView *)tableView{
    if (!_tableView) {
        self.automaticallyAdjustsScrollViewInsets = NO;
        _tableView= [[UITableView alloc]initWithFrame:CGRectMake(0, 0, LFscreenW, LFscreenH-JiaSuBtnViewHeight) style:UITableViewStylePlain];
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
/**无数据view**/
-(BCMeNoDataFooterView *)noView{
    if (!_noView) {
        _noView = [[BCMeNoDataFooterView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, cellNoShuJuHeight)];
        _noView.centerIcon.image =[UIImage imageNamed:@"无消息"];
        _noView.message.text = @"暂无数据";
        _noView.backgroundColor =[UIColor whiteColor];
    }
    return _noView;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.isAnBtn =NO;
    //设置透明图片
    [self setNaviTouMingImage];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.isAnBtn =YES;
    //设置图片
    [self setNaviImage];
}

//设置导航图片为透明
-(void)setNaviTouMingImage{
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
    //添加上下拉加载
    [self createRefresh];
    //设置导航栏
    [self setNaviTitle];
    //初始化tableivew
    [self.view addSubview:self.tableView];
    //初始化转账与收款
    [self setUpBottomBtn];
    //添加无网络点击按钮重新健在
    [self addGainRefresh];
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
    //设置底部footer文字
    [footer setTitle:@"我已经到底啦" forState:MJRefreshStateNoMoreData];
    [header beginRefreshing];
    self.tableView.mj_header = header;
    self.tableView.mj_footer = footer;
    self.header =header;
    self.footer =footer;
    
}
//下拉加载
-(void)loadNewData{
    self.isUpLoad=NO;
    self.start=0;
    if (self.allListArray.count>0) {
        [self.allListArray removeAllObjects];
    }
    [self loadData];
    
}
//上拉加载
-(void)loadMoreData{
    self.isUpLoad=YES;
    [self loadData];
}
-(void)loadData{
    
    NSMutableDictionary * candyDict = diction;
    candyDict[@"token"] = loginToken;
    candyDict[@"start"] =[NSString stringWithFormat:@"%zd",self.start];
    //candyDict[@"size"] = @20;//糖果id
    //candyDict[@"page"] = [NSString stringWithFormat:@"%ld",self.page];//糖果id
    
    [BCRequestData get_suanLiJiLu_Dict:candyDict success:^(id responseObject) {
        self.model = [BCSuanLiJiLuModel mj_objectWithKeyValues:responseObject[@"data"]];
        NSArray* listArray = [BCSuanLiJiLuListModel mj_objectArrayWithKeyValuesArray:self.model.computeLogs];
        self.isNoNetWork =NO;//有网络
        self.isRresh =YES;
        if (listArray.count>0) {//有数据
            if (self.isUpLoad==NO) {
                [self setNaviBarHidden:YES setTouMingImage:NO];
            }
            self.jiaSuView.hidden =NO;
            //判断是否有网络
            self.tableView.loadErrorType = YYLLoadErrorTypeDefalt;
            [self.allListArray addObjectsFromArray:listArray];
            self.start += listArray.count;
            [self.header endRefreshing];
            [self.footer endRefreshing];
            [self.tableView reloadData];
            if (self.isUpLoad==NO) {
                [self setNaviBarHidden:NO setTouMingImage:YES];
            }
        }
        if(self.allListArray.count<1){//无数据
                //self.jiaSuView.hidden =YES;
                //改变导航栏的颜色
                //[self setNaviImage];
                //self.tableView.loadErrorType = YYLLoadErrorTypeNoData;
                [self.footer endRefreshing];
                [self.header endRefreshing];
                [self.tableView reloadData];
        }
        if (listArray.count==0) {
            if(self.allListArray.count>0){
                self.footer.hidden =NO;
            }else{
                self.footer.hidden =YES;
            }
             [self.footer endRefreshingWithNoMoreData];
        }
    } erorr:^(id error) {
        self.isRresh =NO;
        self.isNoNetWork =YES;//无网络
        [self.allListArray removeAllObjects];
        [self.tableView reloadData];
        [self.header endRefreshing];
        [self.footer endRefreshing];
        //设置导航栏图片
        [self setNaviImage];
        //设置导航栏颜色
        self.tableView.loadErrorType = YYLLoadErrorTypeNoNetwork;
        self.jiaSuView.hidden =YES;
      
    }];
    
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
            if (self.isAnBtn) return;
            [self setNaviTouMingImage];//设置透明图片
        }else{
            //[self setNaviImage];//设置图片
        }
    }
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.isAnBtn) return;//判断离开控制，停止调用设置导航栏
    if (self.isNoNetWork) return;//没有网络不执行
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY> upBigViewHeight) {
        //设置导航图片
        [self setNaviImage];
    }else{
        //设置透明导航
        [self setNaviTouMingImage];
    }
}


-(UIView *)jiaSuView{
    if (!_jiaSuView) {
        _jiaSuView = [[UIView alloc] init];
        _jiaSuView.backgroundColor =bagColor;
        _jiaSuView.hidden =YES;
    }
    return _jiaSuView;
}

#pragma 底部转账与收款
-(void)setUpBottomBtn{
    
    UIButton *jiaSuBtn = [UIButton getButtonTitleColor:naverTextColor titleFont:FONT(@"PingFangSC-Semibold", SXRealValue(15)) backGroundColor:colorB378D5 target:self action:@selector(jiaSuBtnClick:)];
    jiaSuBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [jiaSuBtn setTitle:@"加速算力" forState:UIControlStateNormal];
    [jiaSuBtn  setHitEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -10)];//热区域
    [self.jiaSuView addSubview:jiaSuBtn];
    [self.view addSubview:self.jiaSuView];
    [self.jiaSuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).with.offset(0);
        make.right.mas_equalTo(self.view.mas_right).with.offset(0);
        make.bottom.mas_equalTo(self.view.mas_bottom).with.offset(0);
        make.height.mas_equalTo(JiaSuBtnViewHeight);
    }];
    [jiaSuBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.jiaSuView.mas_left).with.offset(SXRealValue(15));
        make.right.mas_equalTo(self.jiaSuView.mas_right).with.offset(SXRealValue(-15));
        make.centerY.mas_equalTo(self.jiaSuView.mas_centerY);
        make.height.mas_equalTo((SCREENWIDTH-2*(SXRealValue(15)))*40/346);
    }];
}
#pragma mark - 加速算力抢铜板按钮点击
-(void)jiaSuBtnClick:(UIButton *)button{
    BCTaskViewController *taskVc= [[BCTaskViewController alloc] init];
    [self.navigationController pushViewController:taskVc animated:YES];
}

-(void)setNaviTitle{
    self.navigationItem.title=@"算力记录";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:FONT(@"PingFangSC-Regular", SXRealValue(16)),
       NSForegroundColorAttributeName:naverTextColor}];
}


//-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return  (SYRealValue(54)) ;
//}

//返回高度
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section==1) {
        if (self.isRresh==NO) return nil;
//        if (self.allListArray.count<1) return nil;
            UIView *view= [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, (SYRealValue(54)))];
            view.backgroundColor = naverTextColor;
            UILabel *tangGuoJiLulable = [UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(15)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
            tangGuoJiLulable.text =@"收支记录";
//            UIView *lineView= [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, (SYRealValue(0.6)))];
//            lineView.backgroundColor = colorE5E7E9;
            [view addSubview:tangGuoJiLulable];
//            [view addSubview:lineView];
            [tangGuoJiLulable mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(view.mas_left).with.offset(SXRealValue(16));
                make.right.mas_equalTo(view.mas_right).with.offset(SXRealValue(-20));
                make.centerY.equalTo(view.mas_centerY);
            }];
//            [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.left.mas_equalTo(view.mas_left).with.offset(0);
//                make.right.mas_equalTo(view.mas_right).with.offset(0);
//                make.bottom.mas_equalTo(view.mas_bottom).with.offset((SYRealValue(-0.6)));
//                make.height.mas_equalTo((SYRealValue(0.6)));
//            }];
            return view;
    }else{
        return nil;
    }
}

//返回高度
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    if(section==0){
        return nil;
    }else{
        return (self.allListArray.count<1 && self.isRresh==YES) ? self.noView : nil;
    }
}

-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
{
    if (section==0) {
        return 0.01;
    }else{
        return (self.allListArray.count<1 && self.isRresh==YES) ? cellNoShuJuHeight : 0.01;;
    }
}


-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return 0.01;
    }else{
        //return 0.01;
        return (self.isRresh==YES) ? (SYRealValue(54)) : 0.01 ;

    }
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return  1;
    }else{
        return  self.allListArray.count;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return UITableViewAutomaticDimension;
    }else{
        return (SYRealValue(44));
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        //添加事件
        BCHomeSuanLiUpCell *cell = [BCHomeSuanLiUpCell getCellWithTableView:tableView cellForRowAtIndexPath:indexPath];
        cell.model =self.model;
        return cell;
    }else{
        BCSuanLiJiLuListModel *model = self.allListArray[indexPath.row];
        //添加事件
        BCHomeSuanLiDownCell *cell = [BCHomeSuanLiDownCell getCellWithTableView:tableView cellForRowAtIndexPath:indexPath];
        cell.model =model;
        return cell;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
