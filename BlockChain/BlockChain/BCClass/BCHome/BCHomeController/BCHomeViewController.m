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
#import "SARefreshGifHeader.h"
#import "BCRefreshAutoGifFooter.h"
@interface BCHomeViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,UISearchBarDelegate>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)BCHomeTopView * homeTopView;
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
     self.homeTopView = [BCHomeTopView loadNameBCHomeTopViewXib];
    self.homeTopView.calculation = ^{//获取算力
        
    };
    self.homeTopView.hideSquare = ^{//隐藏矿场
        
    };
    self.homeTopView.more = ^{//获取更多糖果
        
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
@end
