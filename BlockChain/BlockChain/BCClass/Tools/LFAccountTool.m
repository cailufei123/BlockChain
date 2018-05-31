//
//  LFAccountTool.m
//  LF微博
//
//  Created by lanou3g on 15/9/15.
//  Copyright (c) 2015年 路飞. All rights reserved.
//
#define LFAccountFilepath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.data"]
#define messageFilepath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"baseMessage.data"]
#define LFAccountFilepathMe [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"accountMe.data"]
#import "LFAccountTool.h"

@implementation LFAccountTool
/**存储用户模型*/
+(void)save:(SALoginModel *)account{
    // 归档
    [NSKeyedArchiver archiveRootObject:account toFile:LFAccountFilepath];
    
}
/**取出户模型*/
+(SALoginModel *)account{
    // 读取帐号
    SALoginModel *lfoauthModel = [NSKeyedUnarchiver unarchiveObjectWithFile:LFAccountFilepath];
    
 
/**
 NSOrderedAscending = -1L,  升序，越往右边越大
 NSOrderedSame, 相等，一样
 NSOrderedDescending 降序，越往右边越小
 */
    return lfoauthModel;
}

+(NSString *)iosShengheUseds{
    NSString * iosUrl = [USER_DEFAULT objectForKey:@"appshenghe"];
    return iosUrl;
}
+(void)saveIosShengheUseds:(NSString * )iosUrl{
    
    [USER_DEFAULT setObject:iosUrl forKey:@"appshenghe"];
}
//+(void)savebaseMessage:(LKBasseDataModel *)baseMessageModel{
//
//    // 归档
//    [NSKeyedArchiver archiveRootObject:baseMessageModel toFile:messageFilepath];
//}
//
//+(LKBasseDataModel*)baseMessage
//{
//
//  LKBasseDataModel *baseMessageModel = [NSKeyedUnarchiver unarchiveObjectWithFile:messageFilepath];
//     return baseMessageModel;
//}
/**存储用户模型*/
+(void)saveMe:(BCMeModel *)accountMe{
    // 归档
    [NSKeyedArchiver archiveRootObject:accountMe toFile:LFAccountFilepathMe];
 
}
/**存储用户模型*/
+(BCMeModel *)accountMe{
      BCMeModel *lfoauthModel = [NSKeyedUnarchiver unarchiveObjectWithFile:LFAccountFilepathMe];
      return lfoauthModel;
}
@end
