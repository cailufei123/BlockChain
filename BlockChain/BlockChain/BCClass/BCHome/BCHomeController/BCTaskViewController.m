//
//  BCTaskViewController.m
//  BlockChain
//
//  Created by 蔡路飞 on 2018/5/23.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCTaskViewController.h"
#import "BCTaskTopView.h"
#import "BCTaskTableViewCell.h"
@interface BCTaskViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,UISearchBarDelegate>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)BCTaskTopView * taskTopView;
@end
static NSString * const cellidenfder = @"BCTaskTableViewCell";
@implementation BCTaskViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"任务版";
    [self setTable];
    [self createTopView];
    [self createRefresh];
}
- (void)createRefresh
{
    SARefreshGifHeader *header = [SARefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    BCRefreshAutoGifFooter *footer = [BCRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    self.tableView.mj_footer = footer;
}
-(void)loadMoreData{
    
    
}
-(void)createTopView{
    self.taskTopView = [BCTaskTopView loadNameBCTaskTopViewViewXib];
   
    self.tableView.tableHeaderView =  self.taskTopView;
    
}
-(void)setTable{
    
    self.tableView= [[UITableView alloc]initWithFrame:CGRectMake(0, 0, LFscreenW, LFscreenH-kTopHeight) style:UITableViewStylePlain];
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
    
    return 200;
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    BCTaskTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellidenfder];
    
    return cell;
}

@end
