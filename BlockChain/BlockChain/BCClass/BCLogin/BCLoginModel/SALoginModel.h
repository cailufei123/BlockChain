//
//  SALoginModel.h
//  SkinAssistant
//
//  Created by 蔡路飞 on 2017/6/15.
//  Copyright © 2017年 LeGame. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SALoginModel : NSObject
/**
 *登陆用户名
 */

@property(nonatomic,strong)NSString * loginName;
/**
 * 登陆用户的密码
 */
@property(nonatomic,strong)NSString * logPassWord;
/**
 * 登陆用户的密码
 */
@property(nonatomic,strong)NSString * logPassWordMd5;

/**
 * 登陆放回的标示符
 */

@property(nonatomic,strong)NSString * token;
/**
 *  登陆成功 失败的返回值
 */
@property(nonatomic,strong)NSString * message;

/**
 *  USERID
 */
@property(nonatomic,strong)NSString * userId;
@property(nonatomic,strong)NSString * mobile;

/**
 *  用户名字
 */
@property(nonatomic,strong)NSString * name;
@property(nonatomic,strong)NSString * source;//微信是2QQ是3
@property(nonatomic,strong)NSString * huanId;
@property(nonatomic,strong)NSString * sUid;
@property(nonatomic,strong)NSString * taskStatusVo;
@property(nonatomic,strong)NSString * isRegister;//0 注册 1 登录





@end
