//
//  UIView+WBY.m
//  BodyIntellect1.2
//
//  Created by hai on 16/12/1.
//  Copyright © 2016年 知子花. All rights reserved.
//

#import "UIView+WBY.h"

@implementation UIView (WBY)

/**封装自定义按钮,tag=0时无手势 target传nil action传nil*/
+ (instancetype)getViewUserEnabled:(BOOL)userEnabled backGroundColor:(UIColor*)backGroundColor tag:(NSInteger )tag target:(id)target action:(SEL)action
{
    UIView  *view= [[UIView alloc] init];
    if (userEnabled==YES) {
        view.userInteractionEnabled =userEnabled;
    }
    if (backGroundColor!=nil) {
        view.backgroundColor= backGroundColor;
    }
    if (tag!=0) {
        view.tag=tag;
    }
    if (target!=nil && action!=nil) {
        UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc] initWithTarget:target action:action];
        [view addGestureRecognizer:tap];
    }
    return  view;
}



#pragma mark - 设置部分圆角
/**
 *  设置部分圆角(绝对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 */
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii {
    
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:radii];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    
    self.layer.mask = shape;
}

/**
 *  设置部分圆角(相对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 *  @param rect    需要设置的圆角view的rect
 */
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii
                 viewRect:(CGRect)rect {
    
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:radii];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    
    self.layer.mask = shape;
}
@end
