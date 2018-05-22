//
//  UIButton+LWB.h
//  BodyIntellect
//
//  Created by 李伟宾 on 15/8/13.
//  Copyright (c) 2015年 崔文峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (LWB)

/**
 *  专家简介专用
 */
+ (instancetype)buttonWithFrame:(CGRect)frame title:(NSString *)title font:(CGFloat)font;

/**普通自定义按钮 按钮文字默认居中*/
+ (instancetype)getButtonWithFrame:(CGRect)frame titleLable:(NSString *)titleLable titleColor:(UIColor *)titleColor font:(UIFont*)font backGroundColor:(UIColor *)backGroundColor;

/**无坐标按钮Mansory专用 backGroundColor可设定为nil titleColor可设为nil titleFont可设定为空*/
+ (instancetype)getButtonTitleColor:(UIColor *)titleColor titleFont:(UIFont*)titleFont backGroundColor:(UIColor *)backGroundColor target:(id)target action:(SEL)action;
/**右边字，左边图片按钮*/
+ (instancetype)getUpDwonButtonTitleColor:(UIColor *)titleColor titleName:(NSString *)titleName titleFont:(UIFont*)titleFont imageArr:(NSArray *)imageArr target:(id)target action:(SEL)action;

/**二次封装按钮图片赋值操作*/
-(void)setImageName:(NSString *)imageName forState:(UIControlState)controlState;
@end
