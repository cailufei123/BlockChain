//
//  UIBarButtonItem+LFExtension.h
//  LF百思不得姐
//
//  Created by 蔡路飞 on 16/6/14.
//  Copyright © 2016年 pecoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (LFExtension)
+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;
+ (instancetype)itemWithText:(NSString *)text  target:(id)target action:(SEL)action;
+ (instancetype)itemWithImage:(NSString *)image selectImage:(NSString *)selectImage target:(id)target action:(SEL)action;
@end
