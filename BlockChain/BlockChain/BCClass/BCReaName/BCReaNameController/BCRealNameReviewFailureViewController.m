//
//  BCRealNameReviewFailureViewController.m
//  BlockChain
//
//  Created by 蔡路飞 on 2018/5/24.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCRealNameReviewFailureViewController.h"
#import "BCReaNameController.h"
@interface BCRealNameReviewFailureViewController ()

@end

@implementation BCRealNameReviewFailureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"审核失败";
}


- (IBAction)gotoAuthenticationClick:(id)sender {
    BCReaNameController * reaNamv = [[BCReaNameController alloc] init];
    [self.navigationController pushViewController:reaNamv animated:YES];
    
}



@end
