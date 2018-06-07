//
//  SAMessageViewController.m
//  SkinAssistant
//
//  Created by 蔡路飞 on 2017/6/28.
//  Copyright © 2017年 LeGame. All rights reserved.
//

#import "SAMessageViewController.h"
#import "DataBase.h"
#import "SAMessageModel.h"
#import "ATMessageCell.h"
#import "BCMessageDetailsViewController.h"
@interface SAMessageViewController ()<UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>
@property(nonatomic,strong) UITableView * tableView;
@property (strong, nonatomic, nullable) NSArray *tags;
@property (assign, nonatomic) NSUInteger number;
@property (nonatomic, getter=isLoading) BOOL loading;
@property (strong, nonatomic)NSMutableArray * datas;
@property (strong, nonatomic)SAMessageModel * messageModel;
@property (strong, nonatomic)NSMutableArray * array1;
@property (strong, nonatomic)NSMutableArray *  array2;
@property (strong, nonatomic)NSMutableArray *  array3;
@property (assign, nonatomic) BOOL  isStart;
@end

static NSString * const atmessageID = @"ATMessageCell";
@implementation SAMessageViewController
- (void)setLoading:(BOOL)loading
{
    if (self.isLoading == loading) {
        return;
    }
    
    _loading = loading;
    
    [self.tableView reloadEmptyDataSet];
}
-(NSMutableArray *)datas{
    if (!_datas) {
        _datas = [[NSMutableArray alloc] init];
        
        
    }
    return _datas;

}
-(NSMutableArray *)array1{
    if (!_array1) {
        _array1 = [[NSMutableArray alloc] init];
        
        
    }
    return _array1;
    
}

-(NSMutableArray *)array2{
    if (!_array2) {
        _array2 = [[NSMutableArray alloc] init];
        
        
    }
    return _array2;
    
}
-(NSMutableArray *)array3{
    if (!_array3) {
        _array3 = [[NSMutableArray alloc] init];
        
       
    }
    return _array3;
    
}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIImage imageNamed:@"无消息"];
}
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    NSString *title = @"目前没有任何内容";
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:16.0f],
                                 NSForegroundColorAttributeName:blackTextColor
                                 };
    return [[NSAttributedString alloc] initWithString:title attributes:attributes];
}
- (CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView {
    return 30.0f;
}

// 或者，返回固定值
- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView {
    return -50;
}
- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button {
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:skipHomeNotice object:nil];
}
- (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
    return [UIImage imageNamed:@"去逛逛"];
}
- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView{
    
    return self.isStart;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"全部已读" color:[UIColor whiteColor] highlightColor:[UIColor whiteColor] target:self action: @selector(cleanBtClick) ];
    self.navigationItem.title = @"消息";
    [self setTable];
    [self getmessageBageVlue];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getmessageBageVlu) name:pushRefresh object:nil];
//   [self creveBootomTabar];

}
-(void)creveBootomTabar{
    UIView * bootomTabar = [[UIView alloc] initWithFrame:CGRectMake(0, LFscreenH-kTopHeight-50, LFscreenW, 50)];
    bootomTabar.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bootomTabar];
    UIButton * cleanBt = [UIButton buttonWithType:UIButtonTypeCustom];
    cleanBt.frame= CGRectMake(0, 0, 100, 50);
    cleanBt.clf_centerY = bootomTabar.clf_height/2;
    [cleanBt setTitleColor:bkColor forState:UIControlStateNormal];
    [cleanBt setTitle:@"清除消息" forState:UIControlStateNormal];
    cleanBt.titleLabel.font = [UIFont systemFontOfSize:16];
    [cleanBt addTarget:self action:@selector(cleanBtClick1) forControlEvents:UIControlEventTouchUpInside];
    [bootomTabar addSubview:cleanBt];
    
    UIButton * readBt = [UIButton buttonWithType:UIButtonTypeCustom];
    readBt.frame= CGRectMake(LFscreenW-100, 0, 100, 50);
    readBt.clf_centerY = bootomTabar.clf_height/2;
    [readBt setTitleColor:bkColor forState:UIControlStateNormal];
    readBt.titleLabel.font = [UIFont systemFontOfSize:16];
    [readBt setTitle:@"全部已读" forState:UIControlStateNormal];
    [bootomTabar addSubview:readBt];
    [readBt addTarget:self action:@selector(readBtClick) forControlEvents:UIControlEventTouchUpInside];
}
-(void)cleanBtClick1{
    
        [[DataBase sharedDataBase] deleteAllMessage];
        [self getmessageBageVlue];
}
-(void)cleanBtClick{
   
    for (int i= 0; i<self.datas.count; i++) {
          SAMessageModel * messageModel  = self.datas[i];
           messageModel.bageVlue = @"1";
         [[DataBase sharedDataBase] updateMessage:messageModel];
        
    }
    
    [self.tableView reloadData];
     [self getmessageBageVlue];
//    BCMessageDetailsViewController * detailsV = [[BCMessageDetailsViewController alloc] init];
//    detailsV.messageModel = messageModel;
//    [self.navigationController pushViewController:detailsV animated:YES];
  

//    [[DataBase sharedDataBase] deleteAllMessage];
//    [self getmessageBageVlue];
}
-(void)readBtClick{
//[[DataBase sharedDataBase] readMessage];
//[self getmessageBageVlue];
  
    NSString *msg_id = [self currentTimeStr];
    SAMessageModel * messageModel = [[SAMessageModel alloc] init];
    messageModel.msg_content = @"统计分析组件可以精准分析应用的各种事件，并包含了crash错误定位等功能统计分析组件可以精准分析应用的各种事件，并包含了crash错误定位等功能统计分析组件可以精准分析应用的各种事件，并包含了crash错误定位等功能统计分析组件可以精准分析应用的各种事件，并包含了crash错误定位等功能统计分析组件可以精准分析应用的各种事件，并包含了crash错误定位等功能统计分析组件可以精准分析应用的各种事件，并包含了crash错误定位等功能统计分析组件可以精准分析应用的各种事件，并包含了crash错误定位等功能统计分析组件可以精准分析应用的各种事件，并包含了crash错误定位等功能统计分析组件可以精准分析应用的各种事件，并包含了crash错误定位等功能统计分析组件可以精准分析应用的各种事件，并包含了crash错误定位等功能统计分析组件可以精准分析应用的各种事件，并包含了crash错误定位等功能统计分析组件可以精准分析应用的各种事件，并包含了crash错误定位等功能统计分析组件可以精准分析应用的各种事件，并包含了crash错误定位等功能统计分析组件可以精准分析应用的各种事件，并包含了crash错误定位等功能统计分析组件可以精准分析应用的各种事件，并包含了crash错误定位等功能统计分析组件可以精准分析应用的各种事件，并包含了crash错误定位等功能统计分析组件可以精准分析应用的各种事件，并包含了crash错误定位等功能统计分析组件可以精准分析应用的各种事件，并包含了crash错误定位等功能统计分析组件可以精准分析应用的各种事件，并包含了crash错误定位等功能统计分析组件可以精准分析应用的各种事件，并包含了crash错误定位等功能统计分析组件可以精准分析应用的各种事件，并包含了crash错误定位等功能统计分析组件可以精准分析应用的各种事件，并包含了crash错误定位等功能统计分析组件可以精准分析应用的各种事件，并包含了crash错误定位等功能统计分析组件可以精准分析应用的各种事件，并包含了crash错误定位等功能统计分析组件可以精准分析应用的各种事件，并包含了crash错误定位等功能统计分析组件可以精准分析应用的各种事件，并包含了crash错误定位等功能";
    messageModel.msg_type = @"0";
    messageModel.msg_title = @"统计";
     messageModel.bageVlue = @"0";
      messageModel.msg_id = msg_id;
    NSDate * data  =[NSDate date];
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    fmt.dateFormat = @"MM-dd HH:mm";
    NSString *dateStr = [fmt stringFromDate:data];
    messageModel.timeStr = dateStr;
     
    [[DataBase sharedDataBase] addMessage:messageModel];
    [self getmessageBageVlue];
    
    
}
- (NSString *)currentTimeStr{
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];//获取当前时间0秒后的时间
    NSTimeInterval time=[date timeIntervalSince1970]*1000;// *1000 是精确到毫秒，不乘就是精确到秒
    NSString *timeString = [NSString stringWithFormat:@"%.0f", time];
    return timeString;
}


-(void)viewDidAppear:(BOOL)animated{
//[self getmessageBageVlue];

}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];

}
-(void)getmessageBageVlu{
// [self getmessageBageVlue];

    
    
   
    
  
}
-(void)getmessageBageVlue{
    [self.datas removeAllObjects];

      NSMutableArray * datas1 = [[DataBase sharedDataBase] getAllMessage];
   

        [self.datas addObjectsFromArray:datas1];
 LFLog(@"%@",self.datas);
    self.isStart = datas1.count>0?NO:YES;
    [self.tableView reloadEmptyDataSet];
    [self.tableView reloadData];
}
-(void)setTable{
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, LFscreenW, LFscreenH-kTopHeight) style:UITableViewStylePlain];
   self. number = 0;
    self.tableView = tableView;
    [self.view addSubview:tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerNib:[UINib nibWithNibName:atmessageID bundle:nil] forCellReuseIdentifier:atmessageID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = bagColor;
  
//    [[LFDisplayView sharedManager ]  initNoNetworkView:self.view reloadData:^{
//        [weakSelf.tableView.mj_header beginRefreshing];
//        [[LFDisplayView sharedManager ]hideNoNetworkView];
//    }];
    self.tableView.emptyDataSetSource = self;
    self.tableView.emptyDataSetDelegate = self;
    
    //这行代码必须加上，可以去除tableView的多余的线，否则会影响美观
    self.tableView.tableFooterView = [UIView new];
     self.tableView.mj_footer.hidden = YES;

}


-(void)loadNewData{
   
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

         [self.tableView.mj_footer endRefreshingWithNoMoreData];
         [self.tableView.mj_header endRefreshing ];
         [self.tableView.mj_footer endRefreshing ];
         self. number = 0;
         [self.tableView reloadData];
         [self.tableView reloadEmptyDataSet];
         self.tableView.mj_footer.hidden = YES;
         self.loading = NO;
         [self.tableView.mj_footer endRefreshingWithNoMoreData];
    });
    
    
}

//增加编辑模式
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return YES;
}
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return @"删除";
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
      SAMessageModel * messageModel  = self.datas[indexPath.row];
     [[DataBase sharedDataBase] deleteMessage:messageModel];
    [self.datas removeObjectAtIndex:indexPath.row];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    self.isStart = self.datas.count>0?NO:YES;
    [self.tableView reloadEmptyDataSet];
}
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.datas.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
        return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SAMessageModel * messageModel  = self.datas[indexPath.row];
    ATMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:atmessageID ];
   cell.messageModel = messageModel;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 57;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SAMessageModel * messageModel  = self.datas[indexPath.row];
     messageModel.bageVlue = @"1";
    LFLog(@"%@",messageModel.msg_id);
      [[DataBase sharedDataBase] updateMessage:messageModel];
    [self.tableView reloadRowAtIndexPath:indexPath withRowAnimation:UITableViewRowAnimationNone];
    
    BCMessageDetailsViewController * detailsV = [[BCMessageDetailsViewController alloc] init];
    detailsV.messageModel = messageModel;
    [self.navigationController pushViewController:detailsV animated:YES];


}
@end
