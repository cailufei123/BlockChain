//
//  UILabel+LWB.m
//  BodyIntellect
//
//  Created by 李伟宾 on 15/8/13.
//  Copyright (c) 2015年 崔文峰. All rights reserved.
//

#import "UILabel+LWB.h"

@implementation UILabel (LWB)

+ (instancetype)labelWithFrame:(CGRect)frame text:(NSString *)text font:(CGFloat)font {
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = frame;
    label.text  = text;
    label.font  = [UIFont systemFontOfSize:font];
    label.textColor = [UIColor whiteColor];
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    return label;
}


+ (instancetype)reportNormalLabelWithFrame:(CGRect)frame text:(NSString *)text font:(CGFloat)font{
    UILabel *label = [[UILabel alloc] init];
    label.frame = frame;
    label.text = text;
    label.textAlignment = NSTextAlignmentLeft;

    label.font = [UIFont systemFontOfSize:font];
    return label;
}



+ (instancetype)reportContentLabelWithFrame:(CGRect)frame text:(NSString *)text font:(CGFloat)font{
    UILabel *label = [[UILabel alloc] init];
    label.frame = frame;
    label.text = text;
    label.textAlignment = NSTextAlignmentLeft;
    
    label.font = [UIFont systemFontOfSize:font];
    
    
    label.numberOfLines = 0;
    label.textColor = [UIColor lightGrayColor];
    CGSize size = [text sizeWithFont:label.font constrainedToSize:CGSizeMake(label.frame.size.width, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    [label setFrame:CGRectMake(50, label.frame.origin.y+3,  SCREENWIDTH-20-40, size.height)];
    label.text = text;
    
    return label;
}
+ (instancetype)LabelWithFrame:(CGRect)frame TextColor:(UIColor *)textColor textFont:(UIFont *)textFont textAlignment:(NSTextAlignment )textAlignment numberOfLines:(NSInteger)numberOfLines{
    UILabel *lable = [[UILabel alloc] init];
    if (textColor) {
        lable.textColor = textColor;
    }
    lable.frame=frame;
    lable.font = textFont;
    lable.textAlignment =textAlignment;
    lable.numberOfLines =numberOfLines;
    [lable sizeToFit];
    return lable;
}

+ (instancetype)LabelWithTextColor:(UIColor *)textColor textFont:(UIFont *)textFont textAlignment:(NSTextAlignment )textAlignment numberOfLines:(NSInteger)numberOfLines{
    UILabel *lable = [[UILabel alloc] init];
    if (textColor) {
       lable.textColor = textColor;
    }
    lable.font = textFont;
    lable.textAlignment =textAlignment;
    lable.numberOfLines =numberOfLines;
    [lable sizeToFit];
    return lable;
}

@end
