//
//  UIView+CLFExtension.h
//  LF百思不得姐
//
//  Created by 蔡路飞 on 16/6/14.
//  Copyright © 2016年 pecoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CLFExtension)
@property (nonatomic, assign) CGSize clf_size;
@property (nonatomic, assign) CGFloat clf_width;
@property (nonatomic, assign) CGFloat clf_height;
@property (nonatomic, assign) CGFloat clf_x;
@property (nonatomic, assign) CGFloat clf_y;
@property (nonatomic, assign) CGFloat clf_centerX;
@property (nonatomic, assign) CGFloat clf_centerY;

@property (nonatomic, assign) CGFloat clf_right;
@property (nonatomic, assign) CGFloat clf_bottom;

+ (instancetype)viewFromXib;

- (BOOL)intersectWithView:(UIView *)view;

- (void)layercornerRadius:(CGFloat)value;
-(void)gradientFreme:(CGRect)freme startColor:(UIColor *)startColor endColor:(UIColor *)endColor;

@end
