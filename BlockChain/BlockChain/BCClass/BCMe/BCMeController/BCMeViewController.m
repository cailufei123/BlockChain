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


/**表格**/
-(UITableView *)tableView{
    if (!_tableView) {
        
        self.automaticallyAdjustsScrollViewInsets = NO;
        _tableView= [[UITableView alloc]initWithFrame:CGRectMake(0, kTopHeight, LFscreenW, LFscreenH-kTabBarHeight-kTopHeight) style:UITableViewStylePlain];
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
    //初始化tableivew
    [self.view addSubview:self.tableView];
    //加载headerView
     self.tableView.tableHeaderView =  self.meHeaderView;

}

#pragma 糖果记录跳转
-(void)tangGuoBtnClick{
    NSLog(@"糖果记录");
    
}
#pragma 糖果更多记录跳转
-(void)moreTangGuoBtnClick{
    NSLog(@"更多糖果");
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
