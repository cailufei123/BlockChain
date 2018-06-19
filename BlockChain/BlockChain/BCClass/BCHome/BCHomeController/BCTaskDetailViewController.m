//
//  BCTaskDetailViewController.m
//  BlockChain
//
//  Created by Mac on 2018/5/24.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCTaskDetailViewController.h"
#import "BCTaskDetailModel.h"
#import "BCTaskDetailUpCell.h"
#import "BCTaskDetailDownCell.h"
@interface BCTaskDetailViewController ()<UITableViewDataSource,UITableViewDelegate,BCTaskDetailDownCellDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)BCTaskDetailModel *taskDetailModel;
@end

@implementation BCTaskDetailViewController

/**表格**/
-(UITableView *)tableView{
    if (!_tableView) {
        self.automaticallyAdjustsScrollViewInsets = NO;
        _tableView= [[UITableView alloc]initWithFrame:CGRectMake(0, 0, LFscreenW, LFscreenH-kTabBarHeight) style:UITableViewStyleGrouped];
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

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏
    [self setNaviTitle];
    //初始化tableivew
    [self.view addSubview:self.tableView];
    NSMutableDictionary * taskeDetailDict =diction;
 
    taskeDetailDict[@"token"] = loginToken;
    taskeDetailDict[@"taskId"] = self.taskId;
    [YWRequestData taskeDetailDict:taskeDetailDict success:^(id responseObj) {
        BCTaskDetailModel * taskDetailModel = [BCTaskDetailModel mj_objectWithKeyValues:responseObj[@"data"]];
        self.taskDetailModel = taskDetailModel;
        [self.tableView reloadData];
    }];
}
-(void)setNaviTitle{
    self.navigationItem.title=@"任务详情";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:FONT(@"PingFangSC-Regular", SXRealValue(17)),
       NSForegroundColorAttributeName:naverTextColor}];
}



-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return 0.01;
    }else{
        return (SYRealValue(15));
    }
}
-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
{
    if (section==0) {
        return 0.01;
    }else{
        return 0.01;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  1;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.section==0) {
//        return (SYRealValue(373));
//    }else{
//        return (SYRealValue(248));
//    }
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
    if (indexPath.section==0) {
        BCTaskDetailUpCell *cell = [BCTaskDetailUpCell getCellWithTableView:tableView cellForRowAtIndexPath:indexPath];
        cell.model =self.taskDetailModel;
        return cell;
    }else{
        BCTaskDetailDownCell *cell = [BCTaskDetailDownCell getCellWithTableView:tableView cellForRowAtIndexPath:indexPath];
        cell.delegate=self;
       cell.model =self.taskDetailModel;
        return cell;
    }
}
#pragma mark -BCTaskDetailDownCellDelegate 分享按钮
-(void)fenXiangBtnClick{
    [ATSKIPTOOl shareObjectWithTitle:self.taskDetailModel.taskInfo.name descr:self.taskDetailModel.taskInfo.taskDesc thumImage:self.taskDetailModel.partnerInfo.icon webpageUrl:self.taskDetailModel.shareUrl currentViewController:self success:^{
        
        NSMutableDictionary * taskeDetailDict =diction;
        taskeDetailDict[@"token"] = loginToken;
        taskeDetailDict[@"taskId"] = self.taskId;
        [YWRequestData taskeDoonceDict:taskeDetailDict success:^(id responseObj) {
            
        }];
        
    }] ;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
