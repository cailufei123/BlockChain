//
//  BCMeChangeMoneyController.m
//  BlockChain
//
//  Created by Mac on 2018/5/24.
//  Copyright © 2018年 蔡路飞. All rights reserved.
// 转账界面

#import "BCMeChangeMoneyController.h"
#import "UIBarButtonItem+ZZExtension.h"
#import "BCMeChangeMoneyMode.h"
#import "BCMeChangeMoneyUpCell.h"
#import "BCMeChangeMoneyDownCell.h"
#import "BCSetViewController.h"
#import "BCMeRealNameAlertView.h"
#import "BCMeSurePayView.h"
#import "SYPasswordView.h"
#import "BCMePassWordController.h"
#import "BCSetViewController.h"
#import "BCSetPayPasswordViewController.h"
#import "DES3Util.h"//加密mode

@interface BCMeChangeMoneyController ()<UITableViewDataSource,UITableViewDelegate,BCMeChangeMoneyDownCellDelegate,BCMeChangeMoneyUpCellDelegate,BCMeRealNameAlertViewDelegate,BCMeSurePayViewDelegate,SYPasswordViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)BCMeChangeMoneyMode *moneyModel;
@property(nonatomic,strong)UIView *footerView;
@property(nonatomic,strong)BCMeRealNameAlertView *realNameAlertView;//弹框
@property(nonatomic,strong)BCMeSurePayView *surePayView;//确认支付界面
@property (nonatomic, strong) SYPasswordView *passView;//输入密码框

@property(nonatomic,strong)UIView *BGView1;
@property(nonatomic,strong)UIView *BGView2;

@property(nonatomic,assign)BOOL isShow;


@property(nonatomic,strong)SARefreshGifHeader *header;
@property(nonatomic,strong)BCRefreshAutoGifFooter *footer;
@property(nonatomic,copy)NSString *text1;
@property(nonatomic,copy)NSString *text2;
@property(nonatomic,copy)NSString *text3;
@property(nonatomic,assign)CGFloat value;

@property(nonatomic,strong)BCMeChangeMoneyDownCell *downCell;
@end

@implementation BCMeChangeMoneyController



#define realWidth         (SCREEN_WIDTH-2*(SXRealValue(16)))
#define realHeigth        ((SCREEN_WIDTH-(SXRealValue(32)))*211/343)

-(BCMeChangeMoneyMode *)moneyModel{
    if (!_moneyModel) {
        _moneyModel =[[BCMeChangeMoneyMode alloc] init];
    }
    return _moneyModel;
    
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
-(BCMeRealNameAlertView *)realNameAlertView{
    if (!_realNameAlertView) {
        _realNameAlertView = [[BCMeRealNameAlertView alloc] initWithFrame:CGRectMake(0, 0, realWidth, realHeigth)];
        [Util roundBorderView:SXRealValue(3) border:0 color:[UIColor blackColor] view:_realNameAlertView];
        _realNameAlertView.message.text =@"请先完成实名认证并设置支付密码才可进行转账操作";
        [_realNameAlertView setUpMessage];//设置数据
        _realNameAlertView.delegate =self;
    }
    return _realNameAlertView;
}
-(BCMeSurePayView *)surePayView{
    if (!_surePayView) {
        CGFloat  showHeight;
        if (IS_IPhoneX) {
            showHeight =(SYRealValue(100));
        }else{
            showHeight=(SYRealValue(100));
        }
        _surePayView = [[BCMeSurePayView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
        _surePayView.delegate =self;
        _surePayView.model =self.moneyModel;
    }
    return _surePayView;
}

-(SYPasswordView *)passView{
    if (!_passView) {
        CGFloat  showHeight;
        if (IS_IPhoneX) {
            showHeight =(SYRealValue(230));
        }else if(IS_IPHONE5){
            showHeight=(SYRealValue(180));
        }else if (IS_IPHONE_6){
            showHeight=(SYRealValue(180));
        }else{
            showHeight=(SYRealValue(210));
        }
        _passView = [[SYPasswordView alloc] initWithFrame:CGRectMake(0, showHeight, SCREENWIDTH, SCREEN_HEIGHT-showHeight)];
        _passView.delegate=self;
    }
    return _passView;
}
//    [self.pasView clearUpPassword];


-(UIView *)BGView1{
    if (!_BGView1) {
        _BGView1                 = [[UIView alloc] init];
        _BGView1.frame           = [[UIScreen mainScreen] bounds];
        _BGView1.tag             = 102;
        _BGView1.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
        _BGView1.opaque = NO;
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeShareView)];
//        tap.numberOfTapsRequired = 1;
//        tap.cancelsTouchesInView = NO;
//        [_BGView1 addGestureRecognizer:tap];
    }
    return _BGView1;
}
-(UIView *)BGView2{
    if (!_BGView2) {
        _BGView2                 = [[UIView alloc] init];
        _BGView2.frame           = [[UIScreen mainScreen] bounds];
        _BGView2.tag             = 102;
        _BGView2.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
        _BGView2.opaque = NO;
    }
    return _BGView2;
}

-(void)showSurePayView{
    if (_isShow==NO) {
        _isShow=YES;
        //--UIWindow的优先级最高，Window包含了所有视图，在这之上添加视图，可以保证添加在最上面
        UIWindow *appWindow = [[UIApplication sharedApplication] keyWindow];
        [appWindow addSubview:self.BGView1];
        [appWindow addSubview:self.surePayView];
        
        // ------View出现动画
        self.surePayView.transform = CGAffineTransformMakeTranslation(0.01, SCREENHEIGHT);
        [UIView animateWithDuration:0.3 animations:^{
            self.surePayView.transform = CGAffineTransformMakeTranslation(0.01, 0.01);
        }];
    }else{
        _isShow=NO;
        [self closeSurePayView];
    }
}

#pragma mark - 关闭语音view
-(void)closeSurePayView{
    WS(weakSelf);
    [UIView animateWithDuration:0.3 animations:^{
        self.surePayView.transform = CGAffineTransformMakeTranslation(0.01, SCREENHEIGHT);
        //self.voiceView.alpha = 0.2;
        //self.BGView1.alpha = 0;
    } completion:^(BOOL finished) {
        [self.surePayView removeFromSuperview];
        [self.BGView1 removeFromSuperview];
        self.surePayView=nil;
        self.BGView1=nil;
        weakSelf.isShow=NO;
    }];
}
//==================================
-(void)showPassView{
        //--UIWindow的优先级最高，Window包含了所有视图，在这之上添加视图，可以保证添加在最上面
        UIWindow *appWindow = [[UIApplication sharedApplication] keyWindow];
        [appWindow addSubview:self.BGView2];
        [appWindow addSubview:self.passView];
        
        // ------View出现动画
        self.passView.transform = CGAffineTransformMakeTranslation(0.01, SCREENHEIGHT);
        [UIView animateWithDuration:0.3 animations:^{
            self.passView.transform = CGAffineTransformMakeTranslation(0.01, 0.01);
        }];
}

#pragma mark - 关闭语音view
-(void)closePassView{
    //WS(weakSelf);
    [UIView animateWithDuration:0.3 animations:^{
        self.passView.transform = CGAffineTransformMakeTranslation(0.01, SCREENHEIGHT);
        //self.voiceView.alpha = 0.2;
        //self.BGView1.alpha = 0;
    } completion:^(BOOL finished) {
        [self.passView removeFromSuperview];
        [self.BGView2 removeFromSuperview];
        self.passView=nil;
        self.BGView2=nil;
        //weakSelf.isShow=NO;
    }];
}
//=========================================

-(void)changeHeight:(CGFloat)height{
    CGFloat  payViewToTop;
    if (IS_IPhoneX) {
        payViewToTop =SCREENHEIGHT-height-(SYRealValue(30));
    }else{
        payViewToTop =SCREENHEIGHT-height-(SYRealValue(10));
    }
    self.surePayView.frame =CGRectMake(0, payViewToTop, SCREENWIDTH, SCREENHEIGHT);
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setNaviImage];
}

//设置导航图片
-(void)setNaviImage{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"millcolorGrad"] forBarMetrics:UIBarMetricsDefault];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.moneyModel.code =self.code;
    self.moneyModel.tiXianPrice =@"0.001000";//默认
    //添加上下拉刷新
    [self createRefresh];
    //设置导航栏
    [self setNaviTitle];
    //设置导航按钮
    //[self setupUIBarButtonItem];
    //初始化tableivew
    [self.view addSubview:self.tableView];
}

- (void)createRefresh
{
    SARefreshGifHeader *header = [SARefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    BCRefreshAutoGifFooter *footer = [BCRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    [header beginRefreshing];
    self.tableView.mj_header = header;
//    self.tableView.mj_footer = footer;
    self.header =header;
    self.footer =footer;
}

//下拉加载
-(void)loadNewData{
    [self.header endRefreshing];
    
}
//上拉加载
-(void)loadMoreData{
    [self.footer endRefreshing];
}


-(void)setNaviTitle{
    self.navigationItem.title=@"转账";
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
-(void)onNavButtonTapped:(UIBarButtonItem *)sender event:(UIEvent *)event
{
   
    
}

-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return  (SYRealValue(31)) ;
    }else if(section==1){
        return  (SYRealValue(16)) ;
    }else{
        return 16;
    }
}


//返回高度
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    return nil;
//}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section==0) {
        return nil;
    }else{
        return self.footerView;
    }
}
-(UIView *)footerView{
    if (!_footerView) {
        _footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, (SYRealValue(119)))];
        _footerView.backgroundColor =bagColor;
        UILabel *label1 =[UILabel LabelWithTextColor:color6D6D72 textFont:FONT(@"PingFangSC-Regular", SXRealValue(11)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
        label1.frame = CGRectMake(SXRealValue(15), (SYRealValue(15)), SCREENWIDTH-2*(SXRealValue(15)), 20);
        label1.text=@"每种Token每天最多发起3次体现";
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:label1];
        UILabel *label2 =[UILabel LabelWithTextColor:color6D6D72 textFont:FONT(@"PingFangSC-Regular", SXRealValue(11)) textAlignment:NSTextAlignmentLeft numberOfLines:0];
        label2.frame = CGRectMake(SXRealValue(15), (SYRealValue(45)), SCREENWIDTH-2*(SXRealValue(15)), 20);
        label2.text=@"体现金额大于1ETH的需要人工审核，工作日24小时内到账，节假日顺延";
        [label2 sizeToFit];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:label2];
        [_footerView addSubview:label1];
        [_footerView addSubview:label2];
    }
    return _footerView;
}
//header
-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
{
    if (section==0) {
        return 0.01;
    }else{
        return (SYRealValue(119));
    }
    return 50;
}
//几个分区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
//每行显示几个
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return (SYRealValue(88+82));
    }else{
        return (SYRealValue(230));
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //BCMeChangeMoneyMode *model = self.tangGuolistArray[indexPath.row];
    BCMeChangeMoneyMode *model;
    if (indexPath.section==0) {
        BCMeChangeMoneyUpCell *cell = [BCMeChangeMoneyUpCell getCellWithTableView:tableView cellForRowAtIndexPath:indexPath];
        cell.model =model;
        cell.delegate=self;
        return cell;
    }else{
        BCMeChangeMoneyDownCell *cell = [BCMeChangeMoneyDownCell getCellWithTableView:tableView cellForRowAtIndexPath:indexPath];
        self.downCell =cell;
        cell.model =model;
        cell.delegate=self;
        return cell;
    }
}

//收款钱包
-(void)changeValue1:(NSString *)chageValue1{
    self.text1 =chageValue1.wby_getNoBeforeAndAfterSpaceText;
    self.moneyModel.dizhi =self.text1;
}
//转账金额
-(void)changeValue2:(NSString *)chageValue2{
    self.text2 =chageValue2;
    self.moneyModel.zhuanZhangPrice = self.text2;
    //传递转账金额
    self.downCell.zhuanZhangPrice = self.text2;
}
//备注
-(void)changeValue3:(NSString *)chageValue3{
    self.text3 =chageValue3.wby_getNoBeforeAndAfterSpaceText;
    self.moneyModel.beiZhu=self.text3;
}

//体现费用
-(void)getSliderValue:(NSString *)sliderValue{
    self.value =[sliderValue floatValue];
    self.moneyModel.tiXianPrice = sliderValue;
    //NSLog(@"slider==%.6f",self.value);
}



//1            100
//
//0.001000    0.01000
//下一步
-(void)nextBtnClick{
    if (kStringIsEmpty(self.text1)) {//收款钱包为空
        [MBManager showBriefAlert:@"钱包地址不能为空"];
    }else if (kStringIsEmpty(self.text2)){
        [MBManager showBriefAlert:@"请输入转账金额"];
    }else if (kStringIsEmpty(self.text3)){
        [MBManager showBriefAlert:@"请输入备注"];
    }else{
        
        CGFloat  value = [self.text2 floatValue];
        if (value <= 0) {
            [MBManager showBriefAlert:@"请重新输入转账金额"];
            return;
        }
        //再次校验,如果是以太币的情况下
        
        if ([_moneyModel.code isEqualToString:@"ETH"]) {//如果是以太币
            CGFloat  textPrice = [self.text2 floatValue];//输入金额
            CGFloat  shouXuPrice =[_moneyModel.tiXianPrice floatValue];//手续费   1
            CGFloat  coin =[self.coin floatValue]; //以太币可转账的总金额
            CGFloat  resultPrice =coin-shouXuPrice;  //可转账总金额-手续费 == 最终可转出的金额
            
            if (textPrice>resultPrice) {//输入金额 >最终可转出的金额 提示输入有误
                [MBManager showBriefAlert:[NSString stringWithFormat:@"最多能转出%.6f %@",resultPrice,_moneyModel.code]];
            }else{
                //发送请求接口
                [self requestPay];
            }
        }else{//不是以太币
            NSLog(@"text2===%f",[self.text2 floatValue]);
            NSLog(@"coin===%f",[self.coin floatValue]);

            if ([self.text2 floatValue]>[self.coin floatValue]) {
                [MBManager showBriefAlert:[NSString stringWithFormat:@"最多能转出%.6f %@",self.coin.floatValue,_moneyModel.code]];
            }else{
                //发送请求接口
                [self requestPay];
            }
        }

    }
}

#pragma mark - 立刻支付
-(void)requestPay{
    //判断是否已经认证身份
    LFLog(@"==%@",CASH_COIN);
    NSLog(@"%@",loginMe.authStatus);
    if ([loginMe.authStatus isEqualToString:@"2"]) {//弹出支付界面
        [self showSurePayView];
    }else{
        //未进行去设置中实名认证 用户点击"转账"时验证其身份认证状态和支付密码状态，身份未认证或者未设置支付密码时提示“请先完成实名认证并设置支付密码才可进行转账操作”
        [GKCover coverFrom:[UIApplication sharedApplication].keyWindow contentView:self.realNameAlertView style:GKCoverStyleTranslucent showStyle:GKCoverShowStyleCenter showAnimStyle:GKCoverShowAnimStyleBottom hideAnimStyle:GKCoverHideAnimStyleNone notClick:NO];
    }
}

#pragma mark -BCMeRealNameAlertViewDelegate 点击去认证
-(void)goBtnClick{
    [GKCover hide];
    BCSetViewController *setVc =[[BCSetViewController alloc] init];
    [self.navigationController pushViewController:setVc animated:YES];
}

#pragma mark -BCMeRealNameAlertViewDelegate 取消认证
-(void)cancelBtnClick{
    [GKCover hide];
}

#pragma mark - BCMeSurePayViewDelegate 去支付密码界面转账
-(void)maskToPay{
    //[self closeSurePayView];
    [self showPassView];
//    BCMePassWordController *passVc =[[BCMePassWordController alloc] init];
//    [self.navigationController pushViewController:passVc animated:YES];
}

-(void)backClick{
    [self closeSurePayView];
}

#pragma mark -PCMePassWordDelegate 输入密码完成，请求支付接口
-(void)getPassWord:(NSString *)passWord{
    self.moneyModel.passWord =passWord;
    NSLog(@"password===%@",passWord);
    [self loadData];
}

-(void)loadData{
    NSMutableDictionary * candyDict = diction;
    candyDict[@"token"]    = loginToken;//本地存储
    candyDict[@"price"]    = self.moneyModel.zhuanZhangPrice;
    candyDict[@"account"]  = self.moneyModel.dizhi;
    candyDict[@"code"]     = self.moneyModel.code;
    candyDict[@"ethPrice"] = self.moneyModel.tiXianPrice;//默认0.001000
    candyDict[@"password"] = [DES3Util encryptUseDES: self.moneyModel.passWord key:@"llcfbcap"];
//    candyDict[@"password"] = @"kPN5VW7gYww=";
    candyDict[@"remark"]   = self.moneyModel.beiZhu;

    WS(weakSelf);
    
    [BCRequestData get_yuEr_Dict:candyDict success:^(id responseObject) {//成功
        [weakSelf hiddenTwoView];
        //刷新数据
        if(self.refreshAllData){
            self.refreshAllData(YES);
        }
    } passwordError:^(NSString *message) {//密码错误
        [weakSelf.passView  clearUpPassword];//清空密码
        NSLog(@"服务器===%@",message);
    } noYuEr:^(NSString *yuer) {//额度不够
        if(self.refreshAllData){
            self.refreshAllData(YES);
        }
        [weakSelf.passView  clearUpPassword];//清空密码
        [weakSelf hiddenTwoView];
        //NSString *message =[NSString stringWithFormat:@"%@%@",self.moneyModel.code,@"余额不足"];
        NSString *message =[NSString stringWithFormat:@"eth%@",@"余额不够"];
        [MBManager showBriefAlert:message];
    } erorr:^(id error) {//网络错误，或者服务器错误
        
    }];
}


//隐藏支付界面和密码界面
-(void)hiddenTwoView{
    [self closePassView];
    [self closeSurePayView];
}

//忘记密码
-(void)forgetBtnClick{
        [self closeSurePayView];
        [self closePassView];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        BCSetPayPasswordViewController *setVc =[[BCSetPayPasswordViewController alloc] init];
        setVc.title =@"重置支付密码";
        [self.navigationController pushViewController:setVc animated:YES];
    });
}
//返回
-(void)backBtnClick{
    [self closePassView];
}

//未认证去设置界面
-(void)gotoSetingController{
    BCSetViewController *setVc =[[BCSetViewController alloc] init];
    [self.navigationController pushViewController:setVc animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)dealloc{
    NSLog(@"销毁");
}


@end
