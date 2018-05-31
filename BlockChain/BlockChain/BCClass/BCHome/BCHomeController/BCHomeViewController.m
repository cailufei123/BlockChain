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
#import "SDCycleScrollView.h"

@interface BCHomeViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,UISearchBarDelegate,SDCycleScrollViewDelegate>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)BCHomeTopView * homeTopView;
@property(nonatomic,strong)UILabel * lampLable;
@property(nonatomic,strong)NSMutableArray * candyLists;
@property(nonatomic,strong)NSMutableArray * titles;
@property(nonatomic,strong)NSMutableArray *wins;
@property(nonatomic,strong)NSMutableArray * canCandyLists;
@property(nonatomic,strong)NSTimer * timer;
@property(nonatomic,strong)SDCycleScrollView *cycleScrollView4;
@property(nonatomic,strong)NSString *type;
@property(nonatomic,strong)NSMutableArray * userCandyLists;
@property (nonatomic, strong) NSMutableDictionary *heightAtIndexPath;//缓存高度
@end
static NSString * const cellidenfder = @"BCHomeTableViewCell";
@implementation BCHomeViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    NSMutableDictionary * candyDict = diction;
    candyDict[@"token"] = loginToken;
    candyDict[@"size"] = @"1";
    LFLog(@"%@",candyDict);
    [YWRequestData homePageDict:candyDict success:^(id responseObj) {
        self.candyLists = [HomeCandyListModel mj_objectArrayWithKeyValuesArray:responseObj[@"data"][@"drillGrantInfos"]];
        [self.homeTopView.purpleStoneBt setTitle:[NSString stringWithFormat:@"紫钻：%@",responseObj[@"data"][@"coin"]]forState:UIControlStateNormal];
        [self.homeTopView.tellowStoneBt setTitle:[NSString stringWithFormat:@"算力：%@",responseObj[@"data"][@"compute"]]forState:UIControlStateNormal];
        
    }];
}

    
   
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self.timer hyb_invalidate];
}


- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    
    return UIStatusBarAnimationFade;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
        return UIStatusBarStyleLightContent;
   
}
-(NSMutableArray *)canCandyLists{
    if (!_canCandyLists) {
        _canCandyLists = [NSMutableArray array];
        
    }
    return _canCandyLists;
}
-(NSMutableArray *)titles{
    if (!_titles) {
        _titles = [NSMutableArray array];
        
    }
    return _titles;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.type = @"0";
    [self setTable];
    [self createTopView];
    [self createRefresh];
    [self createHideBt];
    [self createHorseLampbgView];
     [self loadHomeCandyLis];
     [self homePage];
    [self loadNewData];
     [self winPeople];
    self.timer = [NSTimer wh_scheduledTimerWithTimeInterval:4 repeats:YES callback:^(NSTimer *timer) {
       
        [self winPeople];
    }];
//    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}
-(void)winPeople{
     [self.titles removeAllObjects];
    [YWRequestData winPeopleDict:nil success:^(id responseObj) {
        self.wins = [WinPeopleModel mj_objectArrayWithKeyValuesArray:responseObj[@"data"]];
        for (WinPeopleModel * winPeopleModel in self.wins) {
            
            [self.titles addObject:winPeopleModel.content];
        }
        self. cycleScrollView4.titlesGroup = self.titles;
        self.timer.fireDate = [NSDate dateWithTimeInterval:self.wins.count*2 sinceDate:[NSDate date]];
    }];
}
-(void)homePage{

   
}
-(void)loadHomeCandyLis{
    
    [self.canCandyLists removeAllObjects];
    NSMutableDictionary * candyDict = diction;
    candyDict[@"token"] = loginToken;
  
    candyDict[@"size"] = @"48";
    LFLog(@"%@",candyDict);
    [YWRequestData homePageDict:candyDict success:^(id responseObj) {
    
        self.candyLists = [HomeCandyListModel mj_objectArrayWithKeyValuesArray:responseObj[@"data"][@"drillGrantInfos"]];
        [self.homeTopView.purpleStoneBt setTitle:[NSString stringWithFormat:@"紫钻：%@",responseObj[@"data"][@"coin"]]forState:UIControlStateNormal];
           [self.homeTopView.tellowStoneBt setTitle:[NSString stringWithFormat:@"算力：%@",responseObj[@"data"][@"compute"]]forState:UIControlStateNormal];
        for (HomeCandyListModel * candyListModel in  self.candyLists) {
            
            if (self.canCandyLists.count<10) {
                [self.canCandyLists addObject:candyListModel];
            }
            
        }
        
        if (self.canCandyLists.count>0) {
            self.homeTopView.candyLists = self.canCandyLists ;
        }else{
            self.homeTopView.lists = self.canCandyLists ;
        }
        
    }];

}
-(void)createHorseLampbgView{
    UIView * lampbgView = [[UIView alloc] initWithFrame:CGRectMake(12, kStatusBarHeight, LFscreenW-24, 24)];
    [lampbgView layercornerRadius:12];
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
 
  
    SDCycleScrollView *cycleScrollView4 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(iconimg.clf_right,0 ,LFscreenW- 40, lampbgView.clf_height) delegate:self placeholderImage:nil];
    cycleScrollView4.backgroundColor = [UIColor clearColor];
    cycleScrollView4.titleLabelBackgroundColor =  [UIColor clearColor];
    self. cycleScrollView4 = cycleScrollView4;
    cycleScrollView4.scrollDirection = UICollectionViewScrollDirectionVertical;
    cycleScrollView4.onlyDisplayText = YES;
    
   
  
    [cycleScrollView4 disableScrollGesture];
    cycleScrollView4.autoScrollTimeInterval = 2;// 自定义轮播时间间隔
    [lampbgView addSubview:cycleScrollView4];
    

}
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    
}
-(void)createHideBt{
    
    BCLevelBtton * button = [[BCLevelBtton alloc] init];
    [button setImage:[UIImage imageNamed:@"右"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"左"] forState:UIControlStateSelected];
    [button setTitle:@"隐藏矿场" forState:UIControlStateNormal];
    [button setTitle:@"我的矿场" forState:UIControlStateSelected];
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
//    SARefreshGifHeader *header = [SARefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    BCRefreshAutoGifFooter *footer = [BCRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
//    [header beginRefreshing];
    self.tableView.mj_footer = footer;
   
}
-(void)loadNewData{
    NSMutableDictionary * candyDict = diction;
    candyDict[@"token"] = loginToken;
    candyDict[@"type"] =self.type;
    candyDict[@"size"] = @"10";
    
 
    [YWRequestData homeCandyListDict:candyDict success:^(id responseObj) {
        self.userCandyLists =  [CandyListModel mj_objectArrayWithKeyValuesArray:responseObj[@"data"]];
        [MBManager hideAlert];
        if (self.userCandyLists.count<10) {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }
        [self.tableView reloadData];
    }];
}
-(void)loadMoreData{
     CandyListModel * candyListModel = [self.userCandyLists lastObject];
     NSMutableDictionary * candyDict = diction;
     candyDict[@"token"] = loginToken;
     candyDict[@"type"] =  self.type;
     candyDict[@"lastId"] = candyListModel.ID;
     candyDict[@"size"] = @"10";
   
    LFLog(@"%@",candyDict);
        [YWRequestData homeCandyListDict:candyDict success:^(id responseObj) {
            NSMutableArray * arr =  [CandyListModel mj_objectArrayWithKeyValuesArray:responseObj[@"data"]];
            
            [self.tableView.mj_footer endRefreshing];
            [self.userCandyLists addObjectsFromArray:arr];
            [self.tableView reloadData];
            if (arr.count<=0) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
        }];
}
-(void)createTopView{
    WeakSelf(weakSelf)
     self.homeTopView = [BCHomeTopView loadNameBCHomeTopViewXib];
    self.homeTopView.frame = CGRectMake(0, 0, LFscreenW, 490);
    self.homeTopView.screen = ^(NSString * type) {
        weakSelf.type = type;
        [MBManager showWaitingWithTitle:@"加载.."];
        [weakSelf loadNewData ];
    };
    self.homeTopView.refreshCandyList = ^{
         [weakSelf loadHomeCandyLis];
        
    };
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
        pdcV.code = @"TBC";
        
        [weakSelf.navigationController pushViewController:pdcV animated:YES];
    };
//    self.tableView.tableHeaderView =  self.homeTopView;
      [self.tableView addSubview:self.homeTopView]  ;
}

-(void)setTable{
  
//    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView= [[UITableView alloc]initWithFrame:CGRectMake(0, 0, LFscreenW, LFscreenH-kTabBarHeight) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor  =[UIColor blackColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//       self.tableView.contentInset = UIEdgeInsetsMake(490, 0, 0, 0);
    [self.tableView registerNib:[UINib nibWithNibName:cellidenfder bundle:nil] forCellReuseIdentifier:cellidenfder];
   
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        self.tableView.estimatedRowHeight = 0;
        self.tableView.estimatedSectionHeaderHeight = 0;
        self.tableView.estimatedSectionFooterHeight = 0;
    }
    
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, LFscreenW, 490)];
    self.tableView.tableHeaderView.clf_height = 490;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
   
        CGFloat offsetY = scrollView.contentOffset.y;
    LFLog(@"%lf",offsetY);
    if (offsetY<0) {
        self.tableView.backgroundColor  =[UIColor blackColor];
    }else{
         self.tableView.backgroundColor  =bagColor;
    }
    if (offsetY>394-kTopHeight-20-34) {
        self.homeTopView .clf_y =offsetY-(394-kTopHeight-20-34);
    }else{
        self.homeTopView .clf_y  = 0;
//        self.homeTopView .clf_y = offsetY;
//        self.tableView.backgroundColor  =bagColor;
    }
//      self.homeTopView .clf_y = -offsetY/2;
  
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
    
    return     self.userCandyLists.count;
    
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
   
    NSNumber *height = [self.heightAtIndexPath objectForKey:indexPath];
    if(height)
    {
        return height.floatValue;
    }
    else
    {
        return 70;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSNumber *height = @(cell.frame.size.height);
    [self.heightAtIndexPath setObject:height forKey:indexPath];
}

#pragma mark - Getters
- (NSMutableDictionary *)heightAtIndexPath
{
    if (!_heightAtIndexPath) {
        _heightAtIndexPath = [NSMutableDictionary dictionary];
    }
    return _heightAtIndexPath;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
   CandyListModel * candyListModel = self.userCandyLists[indexPath.row];
    BCHomeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellidenfder];
    cell.receiveCandy = ^(UIButton *button) {
        NSMutableDictionary *  candycainDict = diction;
        candycainDict[@"token"] = loginToken;
        candycainDict[@"candyId"] = candyListModel.candyId;
        LFLog(@"%@ %@",CANDY_GAIN,candycainDict);
        [YWRequestData candycainDict:candycainDict success:^(id responseObj) {
            candyListModel.canGain = @"0";
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        }];
    
    };
    cell.candyListModel = candyListModel;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CandyListModel * candyListModel = self.userCandyLists[indexPath.row];
    BCHomeDetailViewController * taskVc = [[BCHomeDetailViewController alloc] init];
    taskVc.indexpath1 = indexPath;
    WeakSelf(weakSelf)
    taskVc.refreshCandyLists = ^(NSIndexPath *indexpath1) {
        CandyListModel * candyListModel = self.userCandyLists[indexpath1.row];
        candyListModel.canGain = @"0";
        [weakSelf.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    };
   
  
    taskVc.candyId = candyListModel.candyId;
    [self.navigationController pushViewController:taskVc animated:YES];
}
@end
