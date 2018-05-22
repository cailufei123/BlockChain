//
//  UIView+Extension.h
//  LongLianLive
//
//  Created by HL on 2017/1/17.
//  Copyright © 2017年 北京华信龙链科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

@property (nonatomic, assign) CGFloat x;

@property (nonatomic, assign) CGFloat y;

@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGSize size;

@property (nonatomic, assign) CGFloat centerX;

@property (nonatomic, assign) CGFloat centerY;


@property (assign, nonatomic) CGFloat ex_x;
@property (assign, nonatomic) CGFloat ex_y;
@property (assign, nonatomic) CGFloat ex_width;
@property (assign, nonatomic) CGFloat ex_height;
@property (assign, nonatomic) CGSize ex_size;
@property (assign, nonatomic) CGPoint ex_origin;

@end
