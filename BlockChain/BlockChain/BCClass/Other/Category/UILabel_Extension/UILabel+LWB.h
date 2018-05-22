//
//  UILabel+LWB.h
//  BodyIntellect
//
//  Created by 李伟宾 on 15/8/13.
//  Copyright (c) 2015年 崔文峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LWB)

/**
 *  专家简介专用
 */
+ (instancetype)labelWithFrame:(CGRect)frame text:(NSString *)text font:(CGFloat)font;

/**
 *  报告界面专用label
 */
+ (instancetype)reportNormalLabelWithFrame:(CGRect)frame text:(NSString *)text font:(CGFloat)font;

+ (instancetype)reportContentLabelWithFrame:(CGRect)frame text:(NSString *)text font:(CGFloat)font;

//masory自动布局 需要的lable
+ (instancetype)LabelWithTextColor:(UIColor *)textColor textFont:(UIFont *)textFont textAlignment:(NSTextAlignment )textAlignment numberOfLines:(NSInteger)numberOfLines;
@end
