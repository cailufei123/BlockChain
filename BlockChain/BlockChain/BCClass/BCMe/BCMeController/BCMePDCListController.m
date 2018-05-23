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
#import "BCMePDCListMode.h"
#import "BCMeTangGuoJiLuCell.h"
#import "BCMePDCListAlertController.h"
#import "BCMePDCListAlertView.h"


@interface BCMePDCListController ()<UITableViewDataSource,UITableViewDelegate,BCMePDCListHeaderViewDelegate>
@property(nonatomic,strong)BCMePDCListHeaderView *headerView;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)CAGradientLayer *gradientLayer;//渐变色
@property(nonatomic,strong)BCMePDCListMode *model;
@property(nonatomic,strong)BCMePDCListAlertView *alertView;//弹框

@end

@implementation BCMePDCListController
//#define HeaderViewHeight   ((SYRealValue(190))-kTopHeight)  //顶部view高度

#define HeaderViewHeight   ((SYRealValue(67+33+23))+kTopHeight+(SYRealValue(235)))  //顶部view高度
//弹框
#define alertViewWidth    ((SYRealValue(343)))
#define alertViewHeight   ((SYRealValue(467)))

/**表格**/
-(UITableView *)tableView{
    if (!_tableView) {
        self.automaticallyAdjustsScrollViewInsets = NO;
        _tableView= [[UITableView alloc]initWithFrame:CGRectMake(0, 0, LFscreenW, LFscreenH-49) style:UITableViewStylePlain];
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
-(BCMePDCListHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [[BCMePDCListHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, HeaderViewHeight)];
        _headerView.delegate =self;
        _headerView.model=self.model;
    }
    return _headerView;
}
/**顶部view**/
-(BCMePDCListAlertView *)alertView{
    if (!_alertView) {
        _alertView = [[BCMePDCListAlertView alloc] initWithFrame:CGRectMake(0, 0, alertViewWidth, alertViewHeight)];
        _alertView.backgroundColor =[UIColor greenColor];
        //_alertView.delegate =self;
        _alertView.model=self.model;
    }
    return _alertView;
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
    //设置导航栏
    [self setNaviTitle];
    //初始化tableivew
    [self.view addSubview:self.tableView];
    //加载headerView
    self.tableView.tableHeaderView =  self.headerView;
    //设置变色
    //[self setGradientLayer];
    //初始化转账与收款
    [self setPayOrGetMoneyBtn];
    
}
#pragma mark -
-(void)xiaQingBtnClickWithModel:(BCMePDCListMode *)model{
    //BCCodeAlertView * codeAlertView  =[BCCodeAlertView loadNameBCCodeAlertViewXib];
    //self.alertView.clf_size = CGSizeMake(LFscreenW-30, 270);
    [GKCover coverFrom:[UIApplication sharedApplication].keyWindow contentView:self.alertView style:GKCoverStyleTranslucent showStyle:GKCoverShowStyleCenter showAnimStyle:GKCoverShowAnimStyleBottom hideAnimStyle:GKCoverHideAnimStyleNone notClick:NO];

}
#pragma 底部转账与收款
-(void)setPayOrGetMoneyBtn{
    UIView *view = [[UIView alloc] init];
 //   view.backgroundColor = naverTextColor;
    view.backgroundColor =[UIColor blueColor];
    UIButton *payBtn = [UIButton getButtonTitleColor:blackBColor titleFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) backGroundColor:naverTextColor target:self action:@selector(payBtnClick)];
    payBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [payBtn setTitle:@"转账" forState:UIControlStateNormal];
    
    [payBtn setImage:[UIImage imageNamed:@"home_purple_diamonds"] forState:UIControlStateNormal];
    [payBtn  setHitEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -10)];//热区域
    [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:payBtn];
    UIButton *getBtn = [UIButton getButtonTitleColor:blackBColor titleFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) backGroundColor:naverTextColor target:self action:@selector(getBtnClick)];
    getBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [getBtn setTitle:@"收款" forState:UIControlStateNormal];
    [getBtn setImage:[UIImage imageNamed:@"home_purple_diamonds"] forState:UIControlStateNormal];
    [getBtn  setHitEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -10)];//热区域
    [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:getBtn];
   //中线
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = colorE5E7E9;
    [self.view addSubview:view];
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
        make.width.mas_equalTo(SCREENWIDTH/2);
        make.bottom.mas_equalTo(view.mas_bottom).with.offset(0);
    }];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view.mas_top).with.offset((SYRealValue(5)));
        make.bottom.mas_equalTo(view.mas_bottom).with.offset((SYRealValue(-5)));
        make.width.mas_equalTo((SYRealValue(0.6)));
        //make.height.mas_equalTo(kTabBarHeight);
    }];
    [getBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(view.mas_right).with.offset(0);
        make.top.mas_equalTo(view.mas_top).with.offset(0);
        make.width.mas_equalTo(SCREENWIDTH/2);
        make.bottom.mas_equalTo(view.mas_bottom).with.offset(0);
    }];
    
}

#pragma mark - 转账
-(void)payBtnClick{
    
}
#pragma mark -收款
-(void)getBtnClick{
    
}
-(void)setNaviTitle{
    self.navigationItem.title=@"PDC总数";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:FONT(@"PingFangSC-Regular", SXRealValue(17)),
       NSForegroundColorAttributeName:naverTextColor}];
}


-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    return  (SYRealValue(54)) ;
}
//返回高度
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view= [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, (SYRealValue(54)))];
    view.backgroundColor = naverTextColor;
    UILabel *tangGuoJiLulable = [UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(16)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
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
//-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 50;
//}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return  20;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return (SYRealValue(54));
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //BCMeTangGuoJiLuMode *model = self.tangGuolistArray[indexPath.row];
    BCMeTangGuoJiLuMode *model;
    model.type=0;
    //添加事件
    BCMeTangGuoJiLuCell *cell = [BCMeTangGuoJiLuCell getCellWithTableView:tableView cellForRowAtIndexPath:indexPath];
    cell.model =model;
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
