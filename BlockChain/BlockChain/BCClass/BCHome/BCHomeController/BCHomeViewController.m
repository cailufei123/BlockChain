//
//  BCHomeViewController.m
//  BlockChain
//
//  Created by 蔡路飞 on 2018/5/21.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCHomeViewController.h"
#import "BCHomeTableViewCell.h"
#import "BCHomeTopView.h"
#import "BCTaskViewController.h"
#import "BCLevelBtton.h"
#import "BCHomeDetailViewController.h"
#import "BCMePDCListController.h"
#import "BCSuanLiJiLuController.h"
#import "BCHomeModel.h"
@interface BCHomeViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,UISearchBarDelegate>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)BCHomeTopView * homeTopView;
@property(nonatomic,strong)UILabel * lampLable;
@property(nonatomic,strong)NSMutableArray * candyLists;
@end
static NSString * const cellidenfder = @"BCHomeTableViewCell";
@implementation BCHomeViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    
}


- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    
    return UIStatusBarAnimationFade;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
        return UIStatusBarStyleLightContent;
   
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTable];
    [self createTopView];
    [self createRefresh];
    [self createHideBt];
    [self createHorseLampbgView];
    [self loadHomeCandyLis];
}
-(void)loadHomeCandyLis{
    NSMutableDictionary * candyDict = diction;
    candyDict[@"token"] = loginToken;
   candyDict[@"lastId"] = loginToken;
     candyDict[@"size"] = @"10";
   
    [YWRequestData homeCandyListDict:candyDict success:^(id responseObj) {
        self.candyLists = [HomeCandyListModel mj_objectArrayWithKeyValuesArray:responseObj[@"data"]];
        self.homeTopView.candyLists = self.candyLists ;
    }];
}
-(void)createHorseLampbgView{
    UIView * lampbgView = [[UIView alloc] initWithFrame:CGRectMake(0, kStatusBarHeight, LFscreenW, 24)];
    lampbgView.backgroundColor = [SVGloble colorWithHexString:@"#242424"];
    UIImageView * iconimg = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 14, 14)];
    iconimg.image= [UIImage imageNamed:@"广播"];
    iconimg.clf_centerY = 12;
    [lampbgView addSubview:iconimg];
      [self.view addSubview:lampbgView];
    UILabel * lampLable = [[UILabel alloc] init];
    self.lampLable = lampLable;
    lampLable.font = FONT(@"PingFangSC-Regular", 12);
   lampLable.textColor = [UIColor whiteColor];
    lampLable.frame = CGRectMake(iconimg.clf_right+5, 0, LFscreenW-40, 24);
    lampLable.clf_centerY = 12;
    [lampbgView addSubview:lampLable];
    
    
    
  
    
  
    
 
    
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:@"今天天气不错呀"];
    
    [AttributedStr addAttribute:NSFontAttributeName
     
                          value:[UIFont systemFontOfSize:12.0]
     
                          range:NSMakeRange(2, 2)];
    
    [AttributedStr addAttribute:NSForegroundColorAttributeName
     
                          value:[UIColor redColor]
     
                          range:NSMakeRange(2, 2)];
    
    self.lampLable.attributedText = AttributedStr;
    
    [lampbgView addSubview:self.lampLable];
}
-(void)createHideBt{
    
    BCLevelBtton * button = [[BCLevelBtton alloc] init];
    [button setImage:[UIImage imageNamed:@"右"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"左"] forState:UIControlStateSelected];
    [button setTitle:@"我的矿场" forState:UIControlStateNormal];
    [button setTitle:@"隐藏矿场" forState:UIControlStateSelected];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    [button setBackgroundImage:[UIImage imageNamed:@"home_hide_bg"] forState:UIControlStateNormal];
    button.frame = CGRectMake(LFscreenW-86, kTopHeight+20, 86, 34);
    [button addTarget:self action:@selector(hideSquare:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
   
}

-(void)hideSquare:(UIButton * )bt{
    if (bt.selected) {
        bt.selected = NO;
           [self.tableView setContentOffset:CGPointMake(0,0) animated:YES];
        
    }else{
         bt.selected = YES;
       [self.tableView setContentOffset:CGPointMake(0,350) animated:YES];
    }
 
}
- (void)createRefresh
{
    SARefreshGifHeader *header = [SARefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    BCRefreshAutoGifFooter *footer = [BCRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    [header beginRefreshing];
    self.tableView.mj_footer = footer;
}
-(void)loadMoreData{
    
   
}
-(void)createTopView{
    WeakSelf(weakSelf)
     self.homeTopView = [BCHomeTopView loadNameBCHomeTopViewXib];
    self.homeTopView.calculation = ^{//获取算力
        BCTaskViewController * taskVc = [[BCTaskViewController alloc] init];
        [weakSelf.navigationController pushViewController:taskVc animated:YES];
    };
   
    self.homeTopView.more = ^{//获取更多糖果
        BCTaskViewController * taskVc = [[BCTaskViewController alloc] init];
        [weakSelf.navigationController pushViewController:taskVc animated:YES];
    };
    
    
    self.homeTopView.yellowStoneBt = ^{
        
        BCSuanLiJiLuController *pdcV = [[BCSuanLiJiLuController alloc] init];
        [weakSelf.navigationController pushViewController:pdcV animated:YES];
    };
    self.homeTopView.purpleStone  = ^{
        BCMePDCListController *pdcV = [[BCMePDCListController alloc] init];
        [weakSelf.navigationController pushViewController:pdcV animated:YES];
    };
    self.tableView.tableHeaderView =  self.homeTopView;
    
}
-(void)setTable{
  
//    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView= [[UITableView alloc]initWithFrame:CGRectMake(0, -1, LFscreenW, LFscreenH-kTabBarHeight) style:UITableViewStylePlain];
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
    
    return 50;
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
 
    BCHomeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellidenfder];
 
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    BCHomeDetailViewController * taskVc = [[BCHomeDetailViewController alloc] init];
    [self.navigationController pushViewController:taskVc animated:YES];
}
@end
