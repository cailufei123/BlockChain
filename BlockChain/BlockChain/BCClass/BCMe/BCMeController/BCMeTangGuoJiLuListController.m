//
//  BCMeTangGuoJiLuListController.m
//  BlockChain
//
//  Created by 吴博怡 on 2018/5/22.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCMeTangGuoJiLuListController.h"
#import "BCMeTangGuoListHeaderView.h"
#import "BCMeTableViewCell.h"

@interface BCMeTangGuoJiLuListController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *tangGuolistArray;//列表数据

@property(nonatomic,strong)BCMeTangGuoListHeaderView *headerView;//列表数据


@end

@implementation BCMeTangGuoJiLuListController

#define HeaderViewHeight   (SYRealValue(140))  //顶部view高度

-(NSMutableArray *)tangGuolistArray{
    if (!_tangGuolistArray) {
        _tangGuolistArray= [NSMutableArray array];
    }
    return _tangGuolistArray;
}

/**表格**/
-(UITableView *)tableView{
    if (!_tableView) {
        self.automaticallyAdjustsScrollViewInsets = NO;
        _tableView= [[UITableView alloc]initWithFrame:CGRectMake(0, kTopHeight, LFscreenW, LFscreenH-kTopHeight) style:UITableViewStylePlain];
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
-(BCMeTangGuoListHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [[BCMeTangGuoListHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, HeaderViewHeight)];
        [_headerView setUpImage:[UIImage imageNamed:@"home_top_bg"]];
        _headerView.backgroundColor =[UIColor redColor];
    }
    return _headerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"糖果包";
    //初始化tableivew
    [self.view addSubview:self.tableView];
    //加载headerView
    self.tableView.tableHeaderView =  self.headerView;
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
    //cell.delegate =self;
    //cell.model =self.meModel;
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
