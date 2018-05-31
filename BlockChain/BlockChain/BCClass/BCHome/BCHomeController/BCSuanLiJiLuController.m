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


@interface BCSuanLiJiLuController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)BCSuanLiJiLuModel *model;
@property(nonatomic,strong)BCSuanLiJiLuListModel *listMode;

@property(nonatomic,strong)SARefreshGifHeader *header;
@property(nonatomic,strong)BCRefreshAutoGifFooter *footer;
@property(nonatomic,assign)NSInteger start;
@property(nonatomic,strong)NSMutableArray *allListArray;


@end

@implementation BCSuanLiJiLuController

#define JiaSuBtnViewHeight  (SYRealValue(95)) //底部加速算力view高度
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
    //添加上下拉加载
    [self createRefresh];
    //设置导航栏
    [self setNaviTitle];
    //初始化tableivew
    [self.view addSubview:self.tableView];
    //初始化转账与收款
    [self setUpBottomBtn];
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
    self.start=0;
    if (self.allListArray.count>0) {
        [self.allListArray removeAllObjects];
    }
    [self loadData];
    
}
//上拉加载
-(void)loadMoreData{
    [self loadData];
}
-(void)loadData{
    NSMutableDictionary * candyDict = diction;
    candyDict[@"token"] = loginToken;
    candyDict[@"start"] =[NSString stringWithFormat:@"%ld",self.start];
    
//    candyDict[@"size"] = @20;//糖果id
    //candyDict[@"page"] = [NSString stringWithFormat:@"%ld",self.page];//糖果id
    [BCRequestData get_suanLiJiLu_Dict:candyDict success:^(id responseObject) {
        self.model = [BCSuanLiJiLuModel mj_objectWithKeyValues:responseObject[@"data"]];
        NSArray* listArray = [BCSuanLiJiLuListModel mj_objectArrayWithKeyValuesArray:self.model.computeLogs];
        if (listArray.count>0) {
            [self.allListArray addObjectsFromArray:listArray];
            self.start = listArray.count;
            [self.header endRefreshing];
            [self.footer endRefreshing];
        }
        if (listArray.count==0) {
             [self.footer endRefreshingWithNoMoreData];
        }
        [self.tableView reloadData];
       
    } erorr:^(id error) {
        [self.header endRefreshing];
        [self.footer endRefreshing];
    }];
    
}



#pragma 底部转账与收款
-(void)setUpBottomBtn{
    UIView *jiaSuView = [[UIView alloc] init];
    jiaSuView.backgroundColor =bagColor;
    UIButton *jiaSuBtn = [UIButton getButtonTitleColor:naverTextColor titleFont:FONT(@"PingFangSC-Semibold", SXRealValue(15)) backGroundColor:colorB378D5 target:self action:@selector(jiaSuBtnClick:)];
    jiaSuBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [jiaSuBtn setTitle:@"加速算力抢铜板" forState:UIControlStateNormal];
    [jiaSuBtn  setHitEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -10)];//热区域
    [jiaSuView addSubview:jiaSuBtn];
    [self.view addSubview:jiaSuView];
    [jiaSuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).with.offset(0);
        make.right.mas_equalTo(self.view.mas_right).with.offset(0);
        make.bottom.mas_equalTo(self.view.mas_bottom).with.offset(0);
        make.height.mas_equalTo(JiaSuBtnViewHeight);
    }];
    [jiaSuBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(jiaSuView.mas_left).with.offset(SXRealValue(15));
        make.right.mas_equalTo(jiaSuView.mas_right).with.offset(SXRealValue(-15));
        make.centerY.mas_equalTo(jiaSuView.mas_centerY);
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
        //        return nil;
        UIView *view= [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, (SYRealValue(54)))];
        view.backgroundColor = naverTextColor;
        UILabel *tangGuoJiLulable = [UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(15)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
        tangGuoJiLulable.text =@"收支记录";
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
    }else{
        return nil;
    }
}

-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==1) {
        return (SYRealValue(54));
    }else{
        return 0.01;
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
