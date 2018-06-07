//
//  YWRequestData.h
//  PunchTopMasters
//
//  Created by 蔡路飞 on 2018/3/28.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface YWRequestData : NSObject

//// - 注册用户发送验证码-----
+ (void)registUserSendcodeDict:(NSDictionary *)dict success:(void (^) (id responseObject))sucess;
//// - 注册用户-----
+ (void)registUserDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
// - 用户登录-----
+ (void)userLoginDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
// - 首页糖果记录-----
+ (void)homeCandyListDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess erorr:(void(^)(id error))erorr;

// - 领取糖果-----
+ (void)candycainDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess yiLingQu:(void (^) (id message))yiLingQu;
// - 实名认证-----
+ (void)realNameIDDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
// -首页bamner -----
+ (void)homePageDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
// 中奖人列表 -----
+ (void)winPeopleDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
// 领取紫钻的接口-----
+ (void)gainPurpleStoneDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
//算力 和记录
+ (void)computePowerDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
//原力任务列表
+ (void)userTaskListDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
//普通任务列表
+ (void)taskListDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
// 获取设置密码验证码
+ (void)getpswdVcodeDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
// 重置密码
+ (void)forgetResetDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
// //原力任务上报（每日app）
+ (void)taskeEveryDayDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
//普通任务详情
+ (void)taskeDetailDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
//普通任务上报（做了一次任务）
+ (void)taskeDoonceDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
////糖果详情
+(void)candy_detail_Dict:(NSDictionary *)dict success:(void (^) (id responseObject))sucess erorr:(void(^)(id error))erorr ;
// 更新
+ (void)getplayDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
@end
