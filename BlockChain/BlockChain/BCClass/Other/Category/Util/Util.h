//
//  Util.h
//  firstview
//
//  Created by HL on 2017/10/18.
//  Copyright © 2017年 SZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Util : NSObject

//切圆角
+(void)roundBorderView:(int)radix border:(float)width color:(UIColor*)borderColor view:(UIView*)pView;
//设置按钮底部线
+(void)setUnderlineFromButton:(UIButton *)button textColor:(UIColor *)textColor underlineColor:(UIColor *)underlineColor;

@end
