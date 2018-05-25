//
//  BCMeViewController.m
//  BlockChain
//
//  Created by 蔡路飞 on 2018/5/21.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCMeViewController.h"
#import "BCMeHeaderView.h"
#import "BCMeTableViewCell.h"
#import "BCMeModel.h"
#import "BCMeTangGuoJiLuListController.h"
#import "BCMeQRCodeController.h"
#import "BCMePDCListController.h"
#import "UIBarButtonItem+ZZExtension.h"
#import "BCSetViewController.h"
#import "BCTaskViewController.h"
#import "BCTaskDetailViewController.h"
#import "BCHomeDetailViewController.h"

@interface BCMeViewController ()<UITableViewDataSource,UITableViewDelegate,BCMeHeaderViewDelegate,BCMeTableViewCellDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)BCMeHeaderView *meHeaderView;//我的钱包顶部试图
@property(nonatomic,strong)NSMutableArray *headerArray;//顶部数据
@property(nonatomic,strong)NSMutableArray *listArray;//列表数据
@property(nonatomic,strong)BCMeModel *meModel;//数据源


@end

@implementation BCMeViewController

static NSString * const cellidenfder = @"BCMeTableViewCell";

#define HeaderViewHeight   (SYRealValue(230))  //顶部view高度
/***数据源***/
-(NSMutableArray *)headerArray{
    if (!_headerArray) {
        _headerArray= [NSMutableArray array];
    }
    return _headerArray;
}
-(NSMutableArray *)listArray{
    if (!_listArray) {
        _listArray= [NSMutableArray array];
    }
    return _listArray;
}
//-(BCMeModel *)meModel{
//    if (!_meModel) {
//        _meModel = [[BCMeModel alloc] init];
//    }
//    return _meModel;
//}
//kTopHeight

/**表格**/
-(UITableView *)tableView{
    if (!_tableView) {
        
        self.automaticallyAdjustsScrollViewInsets = NO;
        _tableView= [[UITableView alloc]initWithFrame:CGRectMake(0, 0, LFscreenW, LFscreenH-kTabBarHeight-kTopHeight) style:UITableViewStylePlain];
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

/**顶部view**/
-(BCMeHeaderView *)meHeaderView{
    if (!_meHeaderView) {
        _meHeaderView = [[BCMeHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, HeaderViewHeight)];
        _meHeaderView.delegate=self;
        _meHeaderView.model =self.meModel;
        _meHeaderView.backgroundColor =[UIColor redColor];
    }
    return _meHeaderView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏
    [self setNaviTitle];
    //设置导航按钮
    [self setupUIBarButtonItem];
    //初始化tableivew
    [self.view addSubview:self.tableView];
    //加载headerView
     self.tableView.tableHeaderView =  self.meHeaderView;

}

-(void)setNaviTitle{
    self.navigationItem.title=@"糖果包";
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
    
    BCHomeDetailViewController *setVc =[[BCHomeDetailViewController alloc] init];
    [self.navigationController pushViewController:setVc animated:YES];
//    BCSetViewController *setVc =[[BCSetViewController alloc] init];
//    [self.navigationController pushViewController:setVc animated:YES];
}
#pragma 糖果记录跳转
-(void)tangGuoBtnClick{
    NSLog(@"糖果记录");
    BCMeTangGuoJiLuListController *vc = [[BCMeTangGuoJiLuListController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

#pragma 糖果更多记录跳转
-(void)moreTangGuoBtnClick{
    NSLog(@"更多糖果");
    BCTaskViewController *taskVc =[[BCTaskViewController alloc] init];
    [self.navigationController pushViewController:taskVc animated:YES];
}
#pragma 二维码
-(void)QRCodeBtnClick{
    BCMeQRCodeController *QRVc= [[BCMeQRCodeController alloc] init];
    [self.navigationController pushViewController:QRVc animated:YES];
    NSLog(@"二维码");
}



-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
        return  (SYRealValue(13)) ;
}
//-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 50;
//}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return (SYRealValue(54));
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //添加事件
    BCMeTableViewCell *cell = [BCMeTableViewCell getCellWithTableView:tableView cellForRowAtIndexPath:indexPath];
    //BCMeHeaderListMode *listMode = self.listArray[indexPath.section];
    cell.delegate =self;
    cell.model =self.meModel;
    return cell;
}
//进入PDC简介
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //BCMeHeaderListMode *listMode = self.listArray[indexPath.section];
    BCMePDCListController *pdcListVc = [[BCMePDCListController alloc] init];
    [self.navigationController pushViewController:pdcListVc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
