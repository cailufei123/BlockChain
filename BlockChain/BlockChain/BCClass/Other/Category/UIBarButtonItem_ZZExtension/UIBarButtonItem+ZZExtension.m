//
//  UIBarButtonItem+ZZExtension.m
//  BodyIntellect1.2
//
//  Created by 吴博怡 on 16/9/22.
//  Copyright © 2016年 知子花. All rights reserved.
//

#import "UIBarButtonItem+ZZExtension.h"

@interface UIBarButtonItem ()

@property(nonatomic,strong) UIButton *button;
@end
@implementation UIBarButtonItem (ZZExtension)

//设置item
+(instancetype)itemWithImage:(NSString *)image hightImage:(NSString *)hightImage target:(UIViewController*)target action:(SEL)action  {
    UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, [UIImage imageNamed:image].size.width, [UIImage imageNamed:image].size.height);
    if (hightImage.length){
       [button setImage:[UIImage imageNamed:hightImage] forState:UIControlStateHighlighted];
    }
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, SXRealValue(-5), SXRealValue(-5), SXRealValue(5))];// 左移下移5像素点
    return [[self alloc] initWithCustomView:button];
}

//-(void)setEdgeInsets:(UIEdgeInsets *)edgeInsets{
//    //自定义
////    button .imageEdgeInsets =UIEdgeInsetsMake(10, 0, 0, 0);
////    button.titleEdgeInsets =UIEdgeInsetsMake(10, 0, 0, 0);
////    button.contentEdgeInsets =UIEdgeInsetsMake(10, 0, 0, 0);
//}
//这句代码放在[sizetofit]后面
//    button .imageEdgeInsets =UIEdgeInsetsMake(10, 0, 0, 0);
//    button.titleEdgeInsets =UIEdgeInsetsMake(10, 0, 0, 0);
//    button.contentEdgeInsets =UIEdgeInsetsMake(10, 0, 0, 0);
@end
