//
//  NSString+WBStringExtension.h
//  BlockChain
//
//  Created by Mac on 2018/6/6.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (WBStringExtension)

//是否是整形
- (BOOL)wby_isPureInt;
//是否是浮点型
- (BOOL)wby_isPureFloat;


/**获取无空格字符串*/
+(NSString *)wby_getNoSpaceText:(NSString *)text;
/**前后无空格字符串*/
//+(NSString *)getNoBeforeAndAfterSpaceText:(NSString *)text;

-(NSString *)wby_getNoBeforeAndAfterSpaceText;
//iOS 开发中判断字符串是否为空字符串的方法
//仅限于NSString
-(BOOL)wby_isBlankString:(id)string;


@end
