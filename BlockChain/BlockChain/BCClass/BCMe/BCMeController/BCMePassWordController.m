//
//  BCMePassWordController.m
//  BlockChain
//
//  Created by Mac on 2018/5/30.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCMePassWordController.h"
#import "SYPasswordView.h"

@interface BCMePassWordController ()
@property (nonatomic, strong) SYPasswordView *pasView;

@end

@implementation BCMePassWordController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"密码设置";
    self.view.backgroundColor = [UIColor colorWithRed:230 / 250.0 green:230 / 250.0 blue:230 / 250.0 alpha:1.0];
    self.navigationController.navigationBar.translucent = NO;
    
    self.pasView = [[SYPasswordView alloc] initWithFrame:CGRectMake(16, 100, self.view.frame.size.width - 32, 45)];
    [self.view addSubview:_pasView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor brownColor];
    button.frame = CGRectMake(100, 180, self.view.frame.size.width - 200, 50);
    [button addTarget:self action:@selector(clearPaw) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"清空密码" forState:UIControlStateNormal];
    [self.view addSubview:button];
}
- (void)clearPaw
{
    [self.pasView clearUpPassword];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
