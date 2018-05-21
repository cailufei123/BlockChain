//
//  ViewController.m
//  BlockChain
//
//  Created by 蔡路飞 on 2018/5/21.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor yellowColor];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 200)];
    view.backgroundColor =[UIColor redColor];
    [self.view addSubview:view];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
