//
//  LFAccountTool.h
//  LF微博
//
//  Created by lanou3g on 15/9/15.
//  Copyright (c) 2015年 路飞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SALoginModel.h"
#import "BCMeModel.h"
//#import "LKBasseDataModel.h"
@interface LFAccountTool : NSObject
/**存储用户模型*/
+(void)save:(SALoginModel *)account;
/**存储用户模型*/
+(SALoginModel *)account;
///**存储图片和昵称*/
//+(void)savebaseMessage:(LKBasseDataModel *)baseMessageModel;
///**取出图片和昵称*/
//+(LKBasseDataModel*)baseMessage;
+(NSString *)iosShengheUseds;
+(void)saveIosShengheUseds:(NSString * )iosUrl;

/**存储用户模型*/
+(void)saveMe:(BCMeModel *)accountMe;
/**存储用户模型*/
+(BCMeModel *)accountMe;
@end
