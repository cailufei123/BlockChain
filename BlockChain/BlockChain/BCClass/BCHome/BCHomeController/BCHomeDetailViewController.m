//
//  BCHomeDetailViewController.m
//  BlockChain
//
//  Created by Mac on 2018/5/25.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCHomeDetailViewController.h"
#import "BCHomeDetailModel.h"
#import "BCHomeDetailUpCell.h"
#import "BCHomeDetailDownCell.h"

//糖果详情页面
@interface BCHomeDetailViewController ()<UITableViewDataSource,UITableViewDelegate,BCHomeDetailDownCellDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)BCHomeDetailModel *detailModel;
 @property(nonatomic,strong)UIButton * statusBt;
@end

@implementation BCHomeDetailViewController

#define HeaderViewHeight   (SYRealValue(310))  //顶部view高度


/**表格**/
-(UITableView *)tableView{
    if (!_tableView) {
        self.automaticallyAdjustsScrollViewInsets = NO;
        _tableView= [[UITableView alloc]initWithFrame:CGRectMake(0, 0, LFscreenW, LFscreenH-kTopHeight-56) style:UITableViewStyleGrouped];
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

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏
    [self setNaviTitle];
    //初始化tableivew
    [self.view addSubview:self.tableView];
    NSMutableDictionary * candydetailDict = diction;
    candydetailDict[@"token"] = loginToken;
     candydetailDict[@"candyId"] = self.candyId;
    [YWRequestData candy_detail_Dict:candydetailDict success:^(id responseObject) {
        BCHomeDetailModel * homeDetailModel = [BCHomeDetailModel mj_objectWithKeyValues:responseObject[@"data"]];
        self.detailModel = homeDetailModel;
        [self lingquStatus];
       
        [self.tableView reloadData];
    }];
    
    UIView * bottomView =  [[UIView alloc] initWithFrame:CGRectMake(0, LFscreenH-56-kTopHeight, LFscreenW, 56)];
    bottomView.backgroundColor = bagColor;
    [self.view addSubview:bottomView];
    UIButton * lingquBt = [[UIButton alloc] initWithFrame:CGRectMake(16, 0, LFscreenW-32, 40)];
    self.statusBt = lingquBt;
    [lingquBt addTarget:self action:@selector(lingquBtClick) forControlEvents:UIControlEventTouchUpInside];
//    [lingquBt setTitle:@"领取" forState:UIControlStateNormal];
    lingquBt.titleLabel.font  = [UIFont systemFontOfSize:16];
//    lingquBt.backgroundColor = [SVGloble colorWithHexString:@"#B378D5"];
    [bottomView addSubview:lingquBt];
    [lingquBt layercornerRadius:5];
    
}
-(void)lingquStatus{
    if ([self.detailModel.candyProcess.canGain isEqualToString:@"0"]) {
        [self.statusBt setBackgroundColor:[SVGloble colorWithHexString:@"#9A9A9A"]];
        self.statusBt.userInteractionEnabled = NO;
        [self.statusBt setTitle:@"已领取" forState:UIControlStateNormal];
        
        if ([self.detailModel.candyProcess.status isEqualToString:@"0"]) {
            [self.statusBt setBackgroundColor:[SVGloble colorWithHexString:@"#9A9A9A"]];
            self.statusBt.userInteractionEnabled = NO;
            [self.statusBt setTitle:@"进行中" forState:UIControlStateNormal];
            
        }else{
            [self.statusBt setBackgroundColor:[SVGloble colorWithHexString:@"#9A9A9A"]];
            self.statusBt.userInteractionEnabled = NO;
            [self.statusBt setTitle:@"已结束" forState:UIControlStateNormal];
            
        }
        [self.statusBt setTitle:@"已领取" forState:UIControlStateNormal];
    }else if ([self.detailModel.candyProcess.canGain isEqualToString:@"1"]){
        [self.statusBt setBackgroundColor:[SVGloble colorWithHexString:@"#C8AACC"]];
        self.statusBt.userInteractionEnabled = YES;
        [self.statusBt setTitle:@"领取" forState:UIControlStateNormal];
        if ([self.detailModel.candyProcess.status isEqualToString:@"0"]) {
            [self.statusBt setBackgroundColor:[SVGloble colorWithHexString:@"#C8AACC"]];
            self.statusBt.userInteractionEnabled = YES;
            [self.statusBt setTitle:@"领取" forState:UIControlStateNormal];
            
        }else{
            [self.statusBt setBackgroundColor:[SVGloble colorWithHexString:@"#9A9A9A"]];
            self.statusBt.userInteractionEnabled = NO;
            [self.statusBt setTitle:@"已结束" forState:UIControlStateNormal];
            
        }
    }
}
-(void)lingquBtClick{
    NSMutableDictionary *  candycainDict = diction;
    candycainDict[@"token"] = loginToken;
    candycainDict[@"candyId"] = self.detailModel.candyProcess.candyId;
    LFLog(@"%@ %@",CANDY_GAIN,candycainDict);
    [YWRequestData candycainDict:candycainDict success:^(id responseObj) {
        self.detailModel.candyProcess.canGain = @"0";
          [self lingquStatus];
        [MBManager showBriefAlert:@"领取成功"];
        if (  self.refreshCandyLists ) {
              self.refreshCandyLists(self.indexpath1);
        }
      
//        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    }];
}
-(void)setNaviTitle{
    self.navigationItem.title=@"糖果详情";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:FONT(@"PingFangSC-Regular", SXRealValue(17)),
       NSForegroundColorAttributeName:naverTextColor}];
}


//返回高度
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    return nil;
//}
//-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//    if (section==0) {
//        return nil;
//    }else{
//        return self.footerView;
//    }
//}

//header
-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
 return (SYRealValue(13));
   
}
//几个分区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
//每行显示几个
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  1;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.section==0) {
//        return (SYRealValue(88+82));
//    }else{
//        return (SYRealValue(230));
//    }
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
    if (indexPath.section==0) {
        BCHomeDetailUpCell *cell = [BCHomeDetailUpCell getCellWithTableView:tableView cellForRowAtIndexPath:indexPath];
        cell.model = self.detailModel ;
        return cell;
    }else{
        BCHomeDetailDownCell *cell = [BCHomeDetailDownCell getCellWithTableView:tableView cellForRowAtIndexPath:indexPath];
        cell.model = self.detailModel ;
        cell.delegate=self;
        return cell;
    }
}

#pragma mark- 跳转到官网
-(void)gotoGuanWangBtnClick{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
