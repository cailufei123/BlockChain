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
-(void)shareObjectWithTitle:(NSString *)title
                      descr:(NSString *)descr
                  thumImage:(id)thumImage
                 webpageUrl:(NSString *)Url
currentViewController:(id)currentViewController;
@end
