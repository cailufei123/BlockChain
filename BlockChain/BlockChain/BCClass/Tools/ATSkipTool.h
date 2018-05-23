//
//  ATSkipTool.h
//  Auction
//
//  Created by 蔡路飞 on 2017/11/3.
//  Copyright © 2017年 Cailufei. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ATSkipTool : NSObject

+ (instancetype)sharedInstance;
- (void)loginAction:(UIViewController * )controller;

-(void)pushToViewControllerWithClassName:(NSString *)className ViewController:(UIViewController * )controller ;
@end
