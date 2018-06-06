//
//  NSString+WBStringExtension.m
//  BlockChain
//
//  Created by Mac on 2018/6/6.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "NSString+WBStringExtension.h"

@implementation NSString (WBStringExtension)

//判断是否为整形：

- (BOOL)wby_isPureInt{
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    BOOL istrue =[scan scanInt:&val] && [scan isAtEnd];
    return istrue;
}

//判断是否为浮点形：

- (BOOL)wby_isPureFloat{
    NSScanner* scan = [NSScanner scannerWithString:self];
    float val;
    BOOL istrue =[scan scanFloat:&val] && [scan isAtEnd];
    return istrue;
}





//判断是否为整形：

//- (BOOL)isPureInt:(NSString*)string{
//
//    NSScanner* scan = [NSScanner scannerWithString:string];
//
//    int val;
//
//    return[scan scanInt:&val] && [scan isAtEnd];
//
//}


////判断是否为浮点形：
//
//- (BOOL)isPureFloat:(NSString*)string{
//
//    NSScanner* scan = [NSScanner scannerWithString:string];
//
//    float val;
//
//    return[scan scanFloat:&val] && [scan isAtEnd];
//
//}


////判断是否是纯数字
//
//if( ![self isPureInt:insertValue.text] || ![self isPureFloat:insertValue.text])
//
//{
//
//    resultLabel.textColor = [UIColor redColor];
//
//    resultLabel.text = @"警告:含非法字符，请输入纯数字！";
//
//    return;
//
//}


@end
