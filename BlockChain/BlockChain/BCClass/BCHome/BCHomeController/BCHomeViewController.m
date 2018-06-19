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
#import "CMVersion.h"
#import "SAVourcherHeartView.h"
#import "BCNotMessageCell.h"
#import "BCGamePlayController.h"
#import "TXScrollLabelView.h"
@interface BCHomeViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,UISearchBarDelegate,SDCycleScrollViewDelegate,TXScrollLabelViewDelegate>

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
@property (nonatomic, strong) BCLevelBtton * button;
@property (nonatomic, assign) BOOL  isHaveData;
@property (strong, nonatomic) TXScrollLabelView *scrollLabelView;
@property (nonatomic, strong)UIView * lampbgView;
@end
static NSString * const cellidenfder = @"BCHomeTableViewCell";
static NSString * const notMessageCellidenfder = @"BCNotMessageCell";
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
        [self.homeTopView.purpleStoneBt setTitle:[NSString stringWithFormat:@"财富币：%@",responseObj[@"data"][@"coin"]]forState:UIControlStateNormal];
        [self.homeTopView.tellowStoneBt setTitle:[NSString stringWithFormat:@"算力：%@",responseObj[@"data"][@"compute"]]forState:UIControlStateNormal];
        
    }];
//     [self loadHomeCandyLis];
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
    self.isHaveData = YES;
    [self setTable];
    [self createTopView];
    [self createRefresh];
    [self createHideBt];
    [self createHorseLampbgView];
     [self loadHomeCandyLis];
     [self homePage];
    [self loadNewData];
     [self winPeople];
    self.timer = [NSTimer wh_scheduledTimerWithTimeInterval:60 repeats:YES callback:^(NSTimer *timer) {
        [self winPeople];
    }];
   
//    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    [self updataVison];
    // 配置参数
    self.tableView.buttonText = @"再次请求";
    self.tableView.buttonNormalColor = [UIColor redColor];
    self.tableView.buttonHighlightColor = [UIColor yellowColor];
    self.tableView.loadedImageName = @"网络异常";
    self.tableView.descriptionText = @"破网络，你还是再请求一次吧";
    self.tableView.dataVerticalOffset = 200;
    
}
-(void)updataVison{
    NSString *oldVersion = [self getAppVersion];
    NSString * oldVersionNmb = [oldVersion stringByReplacingOccurrencesOfString:@"." withString:@""];
    NSMutableDictionary * dictCont = [NSMutableDictionary dictionary];
    
    dictCont[@"appVer"] =@([oldVersionNmb doubleValue]);
    dictCont[@"channel"] =@"0";
    dictCont[@"type"] =@"1";
    
    LFLog(@"%@",dictCont);
    LFLog(@"%@",GET_LEPLAY);
    [YWRequestData getplayDict:dictCont success:^(id responseObj) {
        //LFLog(@"%@",responseObj);
        if ([responseObj[@"status"] isEqual:@(0)]) {
            CMVersion * version = [CMVersion mj_objectWithKeyValues:responseObj[@"data"]];
            NSUserDefaults *prosionDate =  [NSUserDefaults standardUserDefaults];
            
            [prosionDate setObject:version.version forKey:@"comeVesion"];
            [prosionDate setObject:version.url forKey:downUrl];
            if ([oldVersion integerValue]>=[version.version integerValue]) {
                return ;
            }
            
            if ([version.isForceUpdate isEqualToString:@"1"]) {//1：强更；0不强制
                
                //                if (version.versionCode.length)
                //                {
                UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"升级提示" message:version.briefDesc preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction * alertAction = [UIAlertAction actionWithTitle:@"去升级" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    [self jumpToAppStore:version];//跳转appstore
                }];
                [alertController addAction:alertAction];
                [self.navigationController presentViewController:alertController animated:YES completion:nil];
                
                //                }
                
                
            }else if ([version.isForceUpdate isEqualToString:@"0"]){
                
                UIAlertController * alertVc = [UIAlertController alertControllerWithTitle:@"升级提示" message:version.briefDesc preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction * sureAction = [UIAlertAction actionWithTitle:@"立即体验" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    [self jumpToAppStore:version];//跳转appstore
                }];
                
                
                UIAlertAction * alertAction1 = [UIAlertAction actionWithTitle:@"默默忽略" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                }];
                UIAlertAction *resetAction = [UIAlertAction actionWithTitle:@"下次再说" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                }];
                
                [alertVc addAction:resetAction];
                [alertVc addAction:alertAction1];
                [alertVc addAction:sureAction];
                [self.navigationController presentViewController:alertVc animated:YES completion:nil];
                
                
                
            }
            
            
        }else{
            
            
        }
        
        
    }];
}
#pragma mark 跳转appstore
-(void)jumpToAppStore:(CMVersion *)version
{
    LFLog(@"%@",version.url);
    NSString *urlStr = version.url;
    NSURL *url = [NSURL URLWithString:urlStr];
    if ([[UIApplication sharedApplication] canOpenURL:url])
    {
        [[UIApplication sharedApplication] openURL:url];
    }else
    {
        NSLog(@"can not open");
    }
    
    
    
    //     [[UIApplication sharedApplication] openURL:url];
    //
    //    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/us/app/come/id1173766551?l=zh&ls=1&mt=8"]];
    //
    //  https://itunes.apple.com/us/app/come/id1173766551?l=zh&ls=1&mt=8
}

#pragma mark 获取版本信息
- (NSString *)getAppVersion {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *minorVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return minorVersion;
}
-(void)winPeople{
     [self.titles removeAllObjects];
  
    [YWRequestData winPeopleDict:nil success:^(id responseObj) {
        self.wins = [WinPeopleModel mj_objectArrayWithKeyValuesArray:responseObj[@"data"]];
        for (WinPeopleModel * winPeopleModel in self.wins) {
            
            [self.titles addObject:winPeopleModel.content];
        }
     
          [self.scrollLabelView removeFromSuperview];
        self. cycleScrollView4.titlesGroup = self.titles;
         self.scrollLabelView = [TXScrollLabelView scrollWithTextArray: self.titles type:TXScrollLabelViewTypeLeftRight velocity:1 options:UIViewAnimationOptionCurveEaseInOut inset:UIEdgeInsetsZero];
        [self.lampbgView addSubview:self.scrollLabelView];
        /** Step3: 设置代理进行回调 */
         self.scrollLabelView.scrollLabelViewDelegate = self;
        /** Step4: 布局(Required) */
         self.scrollLabelView.frame = CGRectMake(35,0 ,LFscreenW- 40, self.lampbgView.clf_height);
        
     
        
        //偏好(Optional), Preference,if you want.
//         self.scrollLabelView.tx_centerX  = [UIScreen mainScreen].bounds.size.width * 0.5;
//         self.scrollLabelView.scrollInset = UIEdgeInsetsMake(0, 10 , 0, 10);
         self.scrollLabelView.scrollSpace = 5;
         self.scrollLabelView.font = [UIFont systemFontOfSize:13];
         self.scrollLabelView.textAlignment = NSTextAlignmentCenter;
         self.scrollLabelView.backgroundColor = [UIColor clearColor];
         self.scrollLabelView.layer.cornerRadius = 5;
        
        /** Step5: 开始滚动(Start scrolling!) */
        [ self.scrollLabelView beginScrolling];
//        self.timer.fireDate = [NSDate dateWithTimeInterval:self.wins.count*2 sinceDate:[NSDate date]];
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
    self.lampbgView = lampbgView;
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
  
  
//    SDCycleScrollView *cycleScrollView4 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(iconimg.clf_right,0 ,LFscreenW- 40, lampbgView.clf_height) delegate:self placeholderImage:nil];
//    cycleScrollView4.backgroundColor = [UIColor clearColor];
//    cycleScrollView4.titleLabelBackgroundColor =  [UIColor clearColor];
//    self. cycleScrollView4 = cycleScrollView4;
//    cycleScrollView4.scrollDirection = UICollectionViewScrollDirectionVertical;
//    cycleScrollView4.onlyDisplayText = YES;
    
 
}

//- (void)verticalMarqueeTapGes:(UITapGestureRecognizer *)ges {
//    NSLog(@"点击第 %ld 条数据啦啊！！！", _verticalMarquee.currentIndex);
//
//
//}






- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    
}
-(void)createHideBt{
    
    BCLevelBtton * button = [[BCLevelBtton alloc] init];
    self.button = button;
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
   
    // 只需一行代码，我来解放你的代码
    [YWRequestData homeCandyListDict:candyDict success:^(id responseObj) {
        self.userCandyLists =  [CandyListModel mj_objectArrayWithKeyValuesArray:responseObj[@"data"]];
        [self setButtonisHidden];//根据数据判断，磁场按钮是否显示
        [MBManager hideAlert];
        if (self.userCandyLists.count<10) {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }
           //self.tableView.loadErrorType = YYLLoadErrorTypeNoNetwork;
        if (self.userCandyLists.count>0) {
              self.tableView.loadErrorType = YYLLoadErrorTypeDefalt;
        }
        
        
        self.isHaveData =  self.userCandyLists.count<=0?NO:YES;
        [self.tableView reloadData];
        self.tableView.mj_footer.hidden = self.userCandyLists.count>0?NO:YES;
    } erorr:^(id error) {
         self.tableView.loadErrorType = YYLLoadErrorTypeNoNetwork;
    }];

    NSUserDefaults * userdevice = [NSUserDefaults standardUserDefaults];
  NSString * devicToken=  [userdevice  objectForKey:userdevicToken];
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    dict[@"deviceId"] = devicToken;
    dict[@"token"] = loginToken;
    dict[@"type"] = @"1";
  
    [LFHttpTool post:PUSH_DEVICEID params:dict progress:^(id downloadProgress) {
        
    } success:^(id responseObj) {
    } failure:^(NSError *error) {
        
    }];
    
    
}
-(void)setButtonisHidden{
    if (self.userCandyLists.count<1) {
        self.button.hidden=YES;
    }else{
        self.button.hidden=NO;
    }
}
-(void)loadMoreData{
     CandyListModel * candyListModel = [self.userCandyLists lastObject];
     NSMutableDictionary * candyDict = diction;
     candyDict[@"token"] = loginToken;
     candyDict[@"type"] =  self.type;
     candyDict[@"lastId"] = candyListModel.ID;
     candyDict[@"size"] = @"10";
   
    LFLog(@"%@",candyDict);
    // 只需一行代码，我来解放你的代码
    [YWRequestData homeCandyListDict:candyDict success:^(id responseObj) {
        NSMutableArray * arr =  [CandyListModel mj_objectArrayWithKeyValuesArray:responseObj[@"data"]];
        
        [self.tableView.mj_footer endRefreshing];
        [self.userCandyLists addObjectsFromArray:arr];
        [self.tableView reloadData];
        if (arr.count<=0) {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }
    } erorr:^(id error) {
        self.tableView.loadErrorType = YYLLoadErrorTypeDefalt;
    }];
    
//        [YWRequestData homeCandyListDict:candyDict success:^(id responseObj) {
//            NSMutableArray * arr =  [CandyListModel mj_objectArrayWithKeyValuesArray:responseObj[@"data"]];
//            
//            [self.tableView.mj_footer endRefreshing];
//            [self.userCandyLists addObjectsFromArray:arr];
//            [self.tableView reloadData];
//            if (arr.count<=0) {
//                [self.tableView.mj_footer endRefreshingWithNoMoreData];
//            }
//        }];
}
-(void)createTopView{
    WeakSelf(weakSelf)
     self.homeTopView = [BCHomeTopView loadNameBCHomeTopViewXib];
    [self.homeTopView.playMethodBt addTarget:self action:@selector(playMethodBtClick) forControlEvents:UIControlEventTouchUpInside];
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
        pdcV.code = @"LLMC";
        [weakSelf.navigationController pushViewController:pdcV animated:YES];
    };
//    self.tableView.tableHeaderView =  self.homeTopView;
      [self.tableView addSubview:self.homeTopView]  ;
}
-(void)playMethodBtClick{
       BCGamePlayController *vc = [[BCGamePlayController alloc] init];
      [self.navigationController pushViewController:vc animated:YES];
}
-(void)setTable{
  
//    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView= [[UITableView alloc]initWithFrame:CGRectMake(0, 0, LFscreenW, LFscreenH-kTabBarHeight) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor  =[UIColor blackColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//       self.tableView.contentInset = UIEdgeInsetsMake(490, 0, 0, 0);
    [self.tableView registerNib:[UINib nibWithNibName:cellidenfder bundle:nil] forCellReuseIdentifier:cellidenfder];
     [self.tableView registerNib:[UINib nibWithNibName:notMessageCellidenfder bundle:nil] forCellReuseIdentifier:notMessageCellidenfder];
   
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        self.tableView.estimatedRowHeight = 0;
        self.tableView.estimatedSectionHeaderHeight = 0;
        self.tableView.estimatedSectionFooterHeight = 0;
    }
      self.tableView.backgroundColor  =bagColor;
    __weak typeof(self) weakSelf = self;
     self.tableView.headerRefreshingBlock = ^{
         [weakSelf loadHomeCandyLis];
           [weakSelf loadNewData];
         
    };
     self.tableView.footerRefreshingBlock = ^{
        //请求数据
//        [weakSelf loadData];
    };
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
          self.button.selected = YES;
    }else{
           self.button.selected = NO;
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
     
           return   self.isHaveData?self.userCandyLists.count:1;
    
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
         return   self.isHaveData?70:200;
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
  
   
    
    if (self.isHaveData) {
        CandyListModel * candyListModel = self.userCandyLists[indexPath.row];
        BCHomeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellidenfder];
        cell.receiveCandy = ^(UIButton *button) {
            NSMutableDictionary *  candycainDict = diction;
            candycainDict[@"token"] = loginToken;
            candycainDict[@"candyId"] = candyListModel.candyId;
            LFLog(@"%@ %@",CANDY_GAIN,candycainDict);
//            [YWRequestData candycainDict:candycainDict success:^(id responseObj) {
//                candyListModel.canGain = @"0";
//                [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
//            }];
            
        };
        cell.candyListModel = candyListModel;
          return cell;
    }else{
           BCNotMessageCell * cell = [tableView dequeueReusableCellWithIdentifier:notMessageCellidenfder];
        cell.userInteractionEnabled= NO;//展示不可以点击
        return cell;
    }
  
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
