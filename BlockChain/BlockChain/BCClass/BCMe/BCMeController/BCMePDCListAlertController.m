//
//  BCMePDCListAlertController.m
//  BlockChain
//
//  Created by Mac on 2018/5/23.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCMePDCListAlertController.h"
#import "BCMePDCListAlertView.h"

//PCD弹框
@interface BCMePDCListAlertController ()
@property(nonatomic,strong)BCMePDCListAlertView *alertView;

@end

@implementation BCMePDCListAlertController

#define HeaderViewWidth   ((SYRealValue(343)))
#define HeaderViewHeight   ((SYRealValue(467)))


- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor =[[UIColor blackColor] colorWithAlphaComponent:0.1];
    self.view.alpha =0;
    //[self.view addSubview:self.alertView];
}

/**顶部view**/
-(BCMePDCListAlertView *)alertView{
    if (!_alertView) {
        _alertView = [[BCMePDCListAlertView alloc] initWithFrame:CGRectMake(0, 0, HeaderViewWidth, HeaderViewHeight)];
        _alertView.backgroundColor =[UIColor greenColor];
        //_alertView.delegate =self;
        //_alertView.model=self.model;
    }
    return _alertView;
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
