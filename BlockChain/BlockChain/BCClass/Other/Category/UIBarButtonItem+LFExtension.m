//
//  UIBarButtonItem+LFExtension.m
//  LF百思不得姐
//
//  Created by 蔡路飞 on 16/6/14.
//  Copyright © 2016年 pecoo. All rights reserved.
//

#import "UIBarButtonItem+LFExtension.h"

@implementation UIBarButtonItem (LFExtension)
+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.contentEdgeInsets =UIEdgeInsetsMake(0, -20, 0, 10);
    button.size = CGSizeMake(40, 40);
 
  
    return [[self alloc] initWithCustomView:button];
}

+ (instancetype)itemWithImage:(NSString *)image selectImage:(NSString *)selectImage target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectImage] forState:UIControlStateSelected];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//    [button sizeToFit];
    button.size = CGSizeMake(40, 40);
  
    button.imageEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    return [[self alloc] initWithCustomView:button];
}

+ (instancetype)itemWithText:(NSString *)text  target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button setTitle:text forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    return [[self alloc] initWithCustomView:button];
}

@end
