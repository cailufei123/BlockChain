//
//  NSString+WBStringExtension.m
//  BlockChain
//
//  Created by Mac on 2018/6/6.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "NSString+WBStringExtension.h"

@implementation NSString (WBStringExtension)

/*
 *  时间戳对应的NSDate
 */
//-(NSDate *)date{
//    
//    NSTimeInterval timeInterval=self.floatValue;
//
//    return [NSDate dateWithTimeIntervalSince1970:timeInterval];
//}


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


/**获取无空格字符串*/
+(NSString *)wby_getNoSpaceText:(NSString *)text {
    if (text.length == 0) text = @"0";
    text = [text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    text = [text stringByReplacingOccurrencesOfString:@" " withString:@""];
    text = [text stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return text;
}


-(NSString *)wby_getNoBeforeAndAfterSpaceText {
    //    if (text.length == 0) text = @"游客";
   NSString *text =  [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return text;
}


//iOS 开发中判断字符串是否为空字符串的方法,包括@“ ”
//仅限于NSString
-(BOOL)wby_isBlankString{
    if (![self isKindOfClass:[NSString class]]) {
        return YES;
    }else if (self == nil){
        return YES;
    }
    if ([self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([self isEqualToString:@"(null)"]) {
        return YES;
    }
    if ([self isEqualToString:@"<null>"]) {
        return YES;
    }
    if ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

- (NSString*)wby_Str_filter{
        NSString * str = self;
    if ([self isEqualToString:@"<null>"] || [self isEqualToString:@"(null)"]) {
            str = @"";
        }
        return str;
}


//重写
//- (NSString*)description {
//    NSString * str = self;
//    NSLog(@"-----------%@",str);
//    if ([self isEqualToString:@"<null>"] || [self isEqualToString:@"(null)"]) {
//        str = @"";
//    }
//    return str;
//}


///**前后无空格字符串*/
//+(NSString *)getNoBeforeAndAfterSpaceText:(NSString *)text {
//    //    if (text.length == 0) text = @"游客";
//    text = [text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//    NSLog(@"text=====%@",text);
//    return text;
//}

//+(BOOL)isBlankString:(id)string{
//    if (![string isKindOfClass:[NSString class]]) {
//        return YES;
//    }else if (string == nil){
//        return YES;
//    }
//    if ([string isKindOfClass:[NSNull class]]) {
//        return YES;
//    }
//    if ([string isEqualToString:@"(null)"]) {
//        return YES;
//    }
//    if ([string isEqualToString:@"<null>"]) {
//        return YES;
//    }
//    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
//        return YES;
//    }
//    return NO;
//}





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
