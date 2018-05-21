//
//  UIView+CLFExtension.m
//  LF百思不得姐
//
//  Created by 蔡路飞 on 16/6/14.
//  Copyright © 2016年 pecoo. All rights reserved.
//

#import "UIView+CLFExtension.h"

@implementation UIView (CLFExtension)
- (CGSize)clf_size
{
    
    return self.frame.size;
}

- (void)setClf_size:(CGSize)clf_size
{
    CGRect frame = self.frame;
    frame.size = clf_size;
    self.frame = frame;
}

- (CGFloat)clf_width
{
    return self.frame.size.width;
}

- (CGFloat)clf_height
{
    return self.frame.size.height;
}

- (void)setClf_width:(CGFloat)clf_width
{
    CGRect frame = self.frame;
    frame.size.width = clf_width;
    self.frame = frame;
}

- (void)setClf_height:(CGFloat)clf_height
{
    CGRect frame = self.frame;
    frame.size.height = clf_height;
    self.frame = frame;
}

- (CGFloat)clf_x
{
    return self.frame.origin.x;
}

- (void)setClf_x:(CGFloat)clf_x
{
    CGRect frame = self.frame;
    frame.origin.x = clf_x;
    self.frame = frame;
}

- (CGFloat)clf_y
{
    return self.frame.origin.y;
}

- (void)setClf_y:(CGFloat)clf_y
{
    CGRect frame = self.frame;
    frame.origin.y = clf_y;
    self.frame = frame;
}

- (CGFloat)clf_centerX
{
    return self.center.x;
}

- (void)setClf_centerX:(CGFloat)clf_centerX
{
    CGPoint center = self.center;
    center.x = clf_centerX;
    self.center = center;
}

- (CGFloat)clf_centerY
{
    return self.center.y;
}

- (void)setClf_centerY:(CGFloat)clf_centerY
{
    CGPoint center = self.center;
    center.y = clf_centerY;
    self.center = center;
}

- (CGFloat)clf_right
{
    //    return self.clf_x + self.clf_width;
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)clf_bottom
{
    //    return self.clf_y + self.clf_height;
    return CGRectGetMaxY(self.frame);
}

- (void)setClf_right:(CGFloat)clf_right
{
    self.clf_x = clf_right - self.clf_width;
}

- (void)setClf_bottom:(CGFloat)clf_bottom
{
    self.clf_y = clf_bottom - self.clf_height;
}

+ (instancetype)viewFromXib
{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
}

- (BOOL)intersectWithView:(UIView *)view
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    CGRect selfRect = [self convertRect:self.bounds toView:window];
    CGRect viewRect = [view convertRect:view.bounds toView:window];
    return CGRectIntersectsRect(selfRect, viewRect);
}
- (void)layercornerRadius:(CGFloat)value{
    self.layer.cornerRadius = value;
    self.layer.masksToBounds = YES;

}
-(void)gradientFreme:(CGRect)frame startColor:(UIColor *)startColor endColor:(UIColor *)endColor{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame =  frame;
    gradient.colors = [NSArray arrayWithObjects:
                       (id)startColor
                       .CGColor,
                       (id)endColor.CGColor,nil];
    //  设置三种颜色变化点，取值范围 0.0~1.0
    //    gradient.locations = @[@(0.1f) ,@(0.5f)];
    
    //  设置渐变颜色方向，左上点为(0,0), 右下点为(1,1)
    gradient.startPoint = CGPointMake(0, 0);
    gradient.endPoint = CGPointMake(1, 0);
    
    [self.layer addSublayer:gradient];
   
}

@end
