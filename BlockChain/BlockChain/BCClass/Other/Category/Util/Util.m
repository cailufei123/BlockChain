//
//  Util.m
//  firstview
//
//  Created by HL on 2017/10/18.
//  Copyright © 2017年 SZ. All rights reserved.
//

#import "Util.h"

@implementation Util


+(void)roundBorderView:(int)radix border:(float)width color:(UIColor*)borderColor view:(UIView*)pView;
{
    
    if(radix > 0){
        pView.layer.cornerRadius = radix;
        pView.clipsToBounds = YES;
    }
    if(width > 0)
        pView.layer.borderWidth = width;
    if(borderColor != nil)
        pView.layer.borderColor = [borderColor CGColor];
}

+(void)setUnderlineFromButton:(UIButton *)button textColor:(UIColor *)textColor underlineColor:(UIColor *)underlineColor{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"邀请码观看"];
    NSRange strRange = {0,[str length]};
    [str addAttributes:@{NSUnderlineStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle],NSUnderlineColorAttributeName:underlineColor,NSForegroundColorAttributeName:textColor} range:strRange];
    [button setAttributedTitle:str forState:UIControlStateNormal];
}

//封装cell背景色
+(void)selectCellBackgroundColor:(UITableViewCell *)cell{
    //选中背景
    UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    selectedBackgroundView.backgroundColor = naverBagColor;
    cell.selectedBackgroundView = selectedBackgroundView;
}
+(void)selectCellBackgroundColor:(UITableViewCell *)cell selectBackgroundColor:(UIColor *)color{
    //选中背景
    UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    selectedBackgroundView.backgroundColor = color;
    cell.selectedBackgroundView = selectedBackgroundView;
}

@end
