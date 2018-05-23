//
//  ATSkipTool.m
//  Auction
//
//  Created by 蔡路飞 on 2017/11/3.
//  Copyright © 2017年 Cailufei. All rights reserved.
//

#import "ATSkipTool.h"

#import "BCLoginController.h"
static id _instance;
@interface ATSkipTool()<UIWebViewDelegate>

@property(nonatomic,strong)UIViewController * controller;

@end
@implementation ATSkipTool
+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}






- (void)loginAction:(UIViewController * )controller{
    BCLoginController * registVc = [[BCLoginController alloc] init];
    SALoginRegistNavController *naVc = [[SALoginRegistNavController alloc] initWithRootViewController:registVc];
    [controller presentViewController:naVc animated:YES completion:nil];
    
}



-(void)pushToViewControllerWithClassName:(NSString *)className ViewController:(UIViewController * )controller {
    if (className != nil) {
        id myObj = [[NSClassFromString(className) alloc] init];
        @try {
            [controller.navigationController pushViewController:myObj animated:YES];
        }
        @catch (NSException *exception) {
            // 捕获到的异常exception
        }
        @finally {
            // 结果处理
        }
    }
}


@end
