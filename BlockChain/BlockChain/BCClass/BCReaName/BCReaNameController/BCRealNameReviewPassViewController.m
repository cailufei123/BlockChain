//
//  BCRealNameReviewPassViewController.m
//  BlockChain
//
//  Created by 蔡路飞 on 2018/5/24.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCRealNameReviewPassViewController.h"

@interface BCRealNameReviewPassViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLb;

@property (weak, nonatomic) IBOutlet UILabel *cordIDNumberLb;
@end

@implementation BCRealNameReviewPassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationItem.title = @"已认证";
}



@end
