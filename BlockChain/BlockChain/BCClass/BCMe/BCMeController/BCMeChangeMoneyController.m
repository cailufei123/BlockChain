//
//  BCMeChangeMoneyController.m
//  BlockChain
//
//  Created by Mac on 2018/5/24.
//  Copyright © 2018年 蔡路飞. All rights reserved.
// 转账界面

#import "BCMeChangeMoneyController.h"
#import "UIBarButtonItem+ZZExtension.h"
#import "BCMeChangeMoneyMode.h"
#import "BCMeChangeMoneyUpCell.h"
#import "BCMeChangeMoneyDownCell.h"
@interface BCMeChangeMoneyController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)BCMeChangeMoneyMode *changeMoneyModel;

@property(nonatomic,strong)UIView *footerView;


@end

@implementation BCMeChangeMoneyController


/**表格**/
-(UITableView *)tableView{
    if (!_tableView) {
        self.automaticallyAdjustsScrollViewInsets = NO;
        _tableView= [[UITableView alloc]initWithFrame:CGRectMake(0, 0, LFscreenW, LFscreenH-49) style:UITableViewStyleGrouped];
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
    //设置导航按钮
    [self setupUIBarButtonItem];
    //初始化tableivew
    [self.view addSubview:self.tableView];
}

-(void)setNaviTitle{
    self.navigationItem.title=@"TBC转账";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:FONT(@"PingFangSC-Regular", SXRealValue(17)),
       NSForegroundColorAttributeName:naverTextColor}];
}
//右边边导航控制器右边item
- (void)setupUIBarButtonItem {
    UIBarButtonItem *rightItemButton =[UIBarButtonItem itemWithImage:@"me_set_icon" hightImage:nil target:self action:@selector(onNavButtonTapped:event:)];
    self.navigationItem.rightBarButtonItem =rightItemButton;
    // self.navigationController.automaticallyAdjustsScrollViewInsets = YES;
}

#pragma mark-右侧导航按钮item 点击事件
-(void)onNavButtonTapped:(UIBarButtonItem *)sender event:(UIEvent *)event
{
   
    
}

-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return  (SYRealValue(31)) ;
    }else if(section==1){
        return  (SYRealValue(16)) ;
    }else{
        return 16;
    }
}


//返回高度
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    return nil;
//}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section==0) {
        return nil;
    }else{
        return self.footerView;
    }
}
-(UIView *)footerView{
    if (!_footerView) {
        _footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, (SYRealValue(119)))];
        _footerView.backgroundColor =bagColor;
        UILabel *label1 =[UILabel LabelWithTextColor:color6D6D72 textFont:FONT(@"PingFangSC-Regular", SXRealValue(11)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
        label1.frame = CGRectMake(SXRealValue(15), (SYRealValue(15)), SCREENWIDTH-2*(SXRealValue(15)), 20);
        label1.text=@"每种Token每天最多发起3次体现";
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:label1];
        UILabel *label2 =[UILabel LabelWithTextColor:color6D6D72 textFont:FONT(@"PingFangSC-Regular", SXRealValue(11)) textAlignment:NSTextAlignmentLeft numberOfLines:0];
        label2.frame = CGRectMake(SXRealValue(15), (SYRealValue(45)), SCREENWIDTH-2*(SXRealValue(15)), 20);
        label2.text=@"体现金额大于1ETH的需要人工审核，工作日24小时内到账，节假日顺延";
        [label2 sizeToFit];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:label2];
        [_footerView addSubview:label1];
        [_footerView addSubview:label2];
    }
    return _footerView;
}

-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
{
    if (section==0) {
        return 0.01;
    }else{
        return (SYRealValue(119));
    }
    return 50;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return (SYRealValue(88+82));
    }else{
        return (SYRealValue(230));
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //BCMeChangeMoneyMode *model = self.tangGuolistArray[indexPath.row];
    BCMeChangeMoneyMode *model;
    if (indexPath.section==0) {
        BCMeChangeMoneyUpCell *cell = [BCMeChangeMoneyUpCell getCellWithTableView:tableView cellForRowAtIndexPath:indexPath];
        cell.model =model;
        return cell;
    }else{
        BCMeChangeMoneyDownCell *cell = [BCMeChangeMoneyDownCell getCellWithTableView:tableView cellForRowAtIndexPath:indexPath];
        cell.model =model;
        return cell;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
