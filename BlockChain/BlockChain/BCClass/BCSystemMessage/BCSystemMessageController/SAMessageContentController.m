 //
//  SAMessageContentController.m
//  SkinAssistant
//
//  Created by 蔡路飞 on 2017/7/13.
//  Copyright © 2017年 LeGame. All rights reserved.
//

#import "SAMessageContentController.h"
#import "ATMessageContentViewCell.h"
#import "SAMessageModel.h"
#import "DataBase.h"

#import "ATServiceAgreementController.h"
@interface SAMessageContentController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * tableView;
@property (strong, nonatomic)NSArray * datas;
@end
static NSString * const contentID = @"ATMessageContentViewCell";
@implementation SAMessageContentController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setTable];
    
    [self setTableDatas];
//     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getmessageBage) name:pushRefresh object:nil];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
   
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
//    [[NSNotificationCenter defaultCenter] removeObserver:self];

}
-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
-(void)getmessageBage{
 [self setTableDatas];
}
-(void)setTableDatas{

    NSMutableArray * datas1 = [[DataBase sharedDataBase] selectitemDream_desc:@"0"];
    NSMutableArray * datas2 = [[DataBase sharedDataBase] selectitemDream_desc:@"1"];
    NSMutableArray * datas3 = [[DataBase sharedDataBase] selectitemDream_desc:@"2"];
    

    NSArray * datasO = [[datas1 reverseObjectEnumerator] allObjects];
     NSArray * datasT = [[datas2 reverseObjectEnumerator] allObjects];
     NSArray * datasS = [[datas3 reverseObjectEnumerator] allObjects];
    if ([self.type isEqualToString:@"0"]) {
        self.navigationItem.title = @"系统消息";
        
        SAMessageModel * messageModel  = [datas1 firstObject];
         messageModel.extra1 = @"1";
        [[DataBase sharedDataBase] updateMessage:messageModel];
        self.datas = datasO;
    }else if ([self.type isEqualToString:@"1"]){
        self.navigationItem.title = @"我的收藏";
        for (int i = 0; i<datas2.count; i++) {
           SAMessageModel * messageModel  = datas2[i];
             messageModel.extra1 = @"1";
             [[DataBase sharedDataBase] updateMessage:messageModel];
        }
//        SAMessageModel * messageModel  = [datas2 firstObject];
//         messageModel.extra1 = @"1";
//         [[DataBase sharedDataBase] updateMessage:messageModel];
        
        self.datas = datasT;
    }else if ([self.type isEqualToString:@"2"]){
        self.navigationItem.title = @"通知";
        SAMessageModel * messageModel  = [datas3 firstObject];
        messageModel.extra1 = @"1";
        [[DataBase sharedDataBase] updateMessage:messageModel];
        self.datas = datasS;
    }
    self.refreshmianpage();
    
    [self.tableView reloadData];
}
-(void)setTable{
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, LFscreenW, LFscreenH-kTopHeight) style:UITableViewStyleGrouped];
   
    self.tableView = tableView;
    [self.view addSubview:tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerNib:[UINib nibWithNibName:contentID bundle:nil] forCellReuseIdentifier:contentID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = bagColor;
    __weak typeof(self) weakSelf = self;
//    [[LFDisplayView sharedManager ]  initNoNetworkView:self.view reloadData:^{
//        [weakSelf.tableView.mj_header beginRefreshing];
//        [[LFDisplayView sharedManager ]hideNoNetworkView];
//    }];
//
    //这行代码必须加上，可以去除tableView的多余的线，否则会影响美观
    self.tableView.tableFooterView = [UIView new];
    self.tableView.mj_footer.hidden = YES;
    
}

#pragma mark - UITableViewDataSource
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    SAMessageModel * messageModel  = self.datas[section];
    
    
    UIView *sesionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 44)];
    
    [sesionView setBackgroundColor:[UIColor clearColor]];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(14, (sesionView.clf_height)/2, LFscreenW-150, 25)];
    label.clf_centerY =sesionView.clf_height/2;
    label.clf_centerX =LFscreenW/2;
    label.text =messageModel.timeStr;
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = bkColor;
    label.textAlignment = NSTextAlignmentCenter;
    [sesionView addSubview:label];
    return sesionView;
    
    
    
}

-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
    
}

-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == self.datas.count-1) {
        return 44;
    }
    return 0.01f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.datas.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SAMessageModel * messageModel  = self.datas[indexPath.section];
    ATMessageContentViewCell *cell = [tableView dequeueReusableCellWithIdentifier:contentID ];
    cell.contentLb.text= messageModel.msg_content;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
     SAMessageModel * messageModel  = self.datas[indexPath.section];
    return messageModel.cellHight;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    SAMessageModel * messageModel  = self.datas[indexPath.section];
   
//    RoomModel * roomModel = [[RoomModel alloc] init];
//    roomModel.type = messageModel.skip_type;
//    roomModel.eventId = messageModel.skip_id;
//    [ATSKIPTOOl ViewController:self message:roomModel];
//    if ([messageModel.skip_type isEqualToString:@"0"]) {
//
//
//        PDDDetailsViewController * homeDateilsVc = [[PDDDetailsViewController alloc] init];
//        homeDateilsVc.groupId = messageModel.skip_id;
//        [self.navigationController pushViewController:homeDateilsVc animated:YES];
//    }else{
//        ATServiceAgreementController * serviceAgreementVc = [[ATServiceAgreementController alloc] init];
//        serviceAgreementVc.htmlurl = messageModel.skip_id;
//        serviceAgreementVc.htmltitle = messageModel.msg_title;
//        [self.navigationController pushViewController:serviceAgreementVc animated:YES];
//
//    }
    
}


@end
