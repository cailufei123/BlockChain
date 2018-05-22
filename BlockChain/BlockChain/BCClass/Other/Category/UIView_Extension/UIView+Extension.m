//
//  UIView+Extension.m
//  LongLianLive
//
//  Created by HL on 2017/1/17.
//  Copyright © 2017年 北京华信龙链科技有限公司. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

-(void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    if (isnan(x)) {
        frame.origin.x = 0;
        self.frame = frame;
    } else {
        frame.origin.x = x;
        self.frame = frame;
    }
}

-(CGFloat)x {
    return self.frame.origin.x;
}

-(void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    if (isnan(y)) {
        frame.origin.y = 0;
        self.frame = frame;
    } else {
        frame.origin.y = y;
        self.frame = frame;
    }
}

-(CGFloat)y {
    return self.frame.origin.y;
}

-(void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    if (isnan(width)) {
        frame.size.width = 0;
        self.frame = frame;
    } else {
        frame.size.width = width;
        self.frame = frame;
    }
}

-(CGFloat)width {
    return self.frame.size.width;
}

-(void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    if (isnan(height)) {
        frame.size.height = 0;
        self.frame = frame;
    } else {
        frame.size.height = height;
        self.frame = frame;
    }
}

-(CGFloat)height {
    return self.frame.size.height;
}

-(void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

-(CGSize)size {
    return self.frame.size;
}

-(void)setCenterX:(CGFloat)centerX {
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

-(CGFloat)centerX {
    return self.center.x;
}

-(void)setCenterY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

-(CGFloat)centerY {
    return self.center.y;
}

- (void)setEx_x:(CGFloat)ex_x
{
    CGRect frame = self.frame;
    frame.origin.x = ex_x;
    self.frame = frame;
}

- (CGFloat)ex_x
{
    return self.frame.origin.x;
}

- (void)setEx_y:(CGFloat)ex_y
{
    CGRect frame = self.frame;
    frame.origin.y = ex_y;
    self.frame = frame;
}

- (CGFloat)ex_y
{
    return self.frame.origin.y;
}

- (void)setEx_width:(CGFloat)ex_width
{
    CGRect frame = self.frame;
    frame.size.width = ex_width;
    self.frame = frame;
}

- (CGFloat)ex_width
{
    return self.frame.size.width;
}

- (void)setEx_height:(CGFloat)ex_height
{
    CGRect frame = self.frame;
    frame.size.height = ex_height;
    self.frame = frame;
}

- (CGFloat)ex_height
{
    return self.frame.size.height;
}

- (void)setEx_size:(CGSize)ex_size
{
    CGRect frame = self.frame;
    frame.size = ex_size;
    self.frame = frame;
}

- (CGSize)ex_size
{
    return self.frame.size;
}

- (void)setEx_origin:(CGPoint)ex_origin
{
    CGRect frame = self.frame;
    frame.origin = ex_origin;
    self.frame = frame;
}

- (CGPoint)ex_origin
{
    return self.frame.origin;
}
@end
