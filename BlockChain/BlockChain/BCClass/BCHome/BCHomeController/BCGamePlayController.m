//
//  BCGamePlayeController.m
//  BlockChain
//
//  Created by Mac on 2018/6/4.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCGamePlayController.h"
#import "BCGamePlayMode.h"
#import "BCGamePlayUpCell.h"
#import "BCGamePlayDownCell.h"
#import "BCTaskViewController.h"

//玩法攻略 界面
@interface BCGamePlayController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)SARefreshGifHeader *header;
@property(nonatomic,strong)BCRefreshAutoGifFooter *footer;
@property(nonatomic,assign)NSInteger page;
@property(nonatomic,strong)NSMutableArray *listArr;
@property(nonatomic,strong)BCGamePlayMode *playMode;


@end

@implementation BCGamePlayController
#define JiaSuBtnViewHeight  ((SYRealValue(95))) //底部加速算力view高度


-(BCGamePlayMode *)playMode{
    if (!_playMode) {
        _playMode = [[BCGamePlayMode alloc] init];
    }
    return _playMode;
}
-(NSMutableArray *)listArr{
    if (!_listArr) {
        _listArr = [[NSMutableArray alloc] init];
    }
    return _listArr;
}
/**表格**/
-(UITableView *)tableView{
    if (!_tableView) {
        self.automaticallyAdjustsScrollViewInsets = NO;
        _tableView= [[UITableView alloc]initWithFrame:CGRectMake(0, 0, LFscreenW, LFscreenH-JiaSuBtnViewHeight-kTopHeight) style:UITableViewStylePlain];
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


//下拉加载
-(void)loadNewData{
    [self loadData];
}
//上拉加载
-(void)loadMoreData{
    self.page+=1;
    [self loadData];
}
-(void)loadData{
    [self.tableView reloadData];
    [self.header endRefreshing];
    [self.footer endRefreshing];

}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"玩法攻略";
    //初始化tableivew
    [self.view addSubview:self.tableView];
    //设置数据
    [self setListArray];
    //设置算力按钮
    [self setUpBottomBtn];
    //请求数据
    [self createRefresh];
  
 
}
//假数据
-(void)setListArray{
    [self.listArr removeAllObjects];
    //设置数据
    for (int i=0; i<2; i++) {
        BCGamePlayMode *mode = [[BCGamePlayMode alloc] init];
        if (i==0) {
            mode.text1 =@"算力越高，单位时间挖取的财富币越多";
            mode.text2 =@"算力是用户获取财富币的影响因子，同一时段内算力越高，获得的财富币越多，后续的版本中算力也将关系到用户等级以及相应的用户权限。";
        }else if(i==1){
            mode.text1 =@"如何获取算力";
            mode.text2 =@"登录、收取财富币、邀请好友、完成任务等活动均可增加算力，未来随着生态体系的扩张，将支持更多获取算力的方式。";
        }
        [self.listArr addObject:mode];
        //NSLog(@"%zd",self.listArr.count);

    }
}

- (void)createRefresh
{
    SARefreshGifHeader *header = [SARefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    //BCRefreshAutoGifFooter *footer = [BCRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    [header beginRefreshing];
    self.tableView.mj_header = header;
    //self.tableView.mj_footer = footer;
    self.header =header;
    //self.footer =footer;
    
}



#pragma 底部转账与收款
-(void)setUpBottomBtn{
    UIView *jiaSuView = [[UIView alloc] init];
    jiaSuView.backgroundColor =bagColor;
    UIButton *jiaSuBtn = [UIButton getButtonTitleColor:naverTextColor titleFont:FONT(@"PingFangSC-Semibold", SXRealValue(15)) backGroundColor:colorB378D5 target:self action:@selector(jiaSuBtnClick:)];
    jiaSuBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [jiaSuBtn setTitle:@"加速算力" forState:UIControlStateNormal];
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

#pragma mark - 加速算力事件
-(void)jiaSuBtnClick:(UIButton *)button{
    BCTaskViewController *taskVc =[[BCTaskViewController alloc] init];
    [self.navigationController pushViewController:taskVc animated:YES];
}


-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return 1;
    }else{
        return self.listArr.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        BCGamePlayMode *model = [[BCGamePlayMode alloc] init];
        //添加事件
        BCGamePlayUpCell *cell1 = [BCGamePlayUpCell getCellWithTableView:tableView cellForRowAtIndexPath:indexPath];
        cell1.model =model;
        return cell1;
    }else{
        BCGamePlayMode *model = self.listArr[indexPath.row];
        //添加事件
        BCGamePlayDownCell *cell2 = [BCGamePlayDownCell getCellWithTableView:tableView cellForRowAtIndexPath:indexPath];
        cell2.model =model;
        return cell2;
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
