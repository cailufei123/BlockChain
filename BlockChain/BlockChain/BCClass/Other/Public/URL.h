//
//  URL.h
//  品多多
//
//  Created by 蔡路飞 on 2017/12/7.
//  Copyright © 2017年 cailufei. All rights reserved.
//

#ifndef URL_h
#define URL_h

//#define PUBLIC_URL @"http://101.200.74.83"
//#define  PAY_SERVER_ADDR @"http://182.92.205.236"

//
#define SERVER_ADDR @"http://101.200.74.83:8080"
#define USER_SERVER_ADDR @"http://182.92.205.236"
#define PAY_SERVER_ADDR  @"http://182.92.205.236"


//#define SERVER_ADDR @"http://esp.im-come.com"
//#define USER_SERVER_ADDR @"http://esp.im-come.com"
//#define PAY_SERVER_ADDR  @"http://im-come.com"




#define USER_URL @"/blockcoin/api/user/"
#define COIN_URL @"/api/esportsvc/service/"
#define HONGBAO_URL @"/esports/hongbao/"
#define INFO_URL @"/esports/api/"
#define ORDER_URL @"/esports/api/game/"
#define HTML_URL @"/html/"
#define GAME_URL @"/bot/api/"

//} else {
//#ifdef DEBUG
//
//#else
//
//#endif
//
//#define  USER_SERVICE  [NSString stringWithFormat:@"%@%@",@"http://101.200.74.83",USER_URL]
//#define  GAME_SERVICE  [NSString stringWithFormat:@"%@%@",@"http://101.200.74.83:8077",GAME_URL]
//#define  COIN_SERVICE  [NSString stringWithFormat:@"%@%@",SERVER_ADDR,COIN_URL]
//#define  ORDER_SERVICE [NSString stringWithFormat:@"%@%@",SERVER_ADDR,ORDER_URL]
//#define  INFO_SERVICE  [NSString stringWithFormat:@"%@%@",@"http://101.200.74.83:9021",INFO_URL]
//#define  HTML_SERVICE  [NSString stringWithFormat:@"%@%@",@"http://101.200.74.83",HTML_URL]
//#define  HONGBAO_SERVICE [NSString stringWithFormat:@"%@%@",SERVER_ADDR,HONGBAO_URL]
//#define  TX [NSString stringWithFormat:@"%@%@",@"http://101.200.74.83:9011",COIN_URL]

    #define  USER_SERVICE  [NSString stringWithFormat:@"%@%@",SERVER_ADDR,USER_URL]
    #define  GAME_SERVICE  [NSString stringWithFormat:@"%@%@",SERVER_ADDR,GAME_URL]
    #define  COIN_SERVICE  [NSString stringWithFormat:@"%@%@",SERVER_ADDR,COIN_URL]
    #define  ORDER_SERVICE [NSString stringWithFormat:@"%@%@",SERVER_ADDR,ORDER_URL]
    #define  INFO_SERVICE  [NSString stringWithFormat:@"%@%@",SERVER_ADDR,INFO_URL]
    #define  HTML_SERVICE  [NSString stringWithFormat:@"%@%@",SERVER_ADDR,HTML_URL]
    #define  HONGBAO_SERVICE [NSString stringWithFormat:@"%@%@",SERVER_ADDR,HONGBAO_URL]
    #define  TX [NSString stringWithFormat:@"%@%@",SERVER_ADDR,COIN_URL]






// U盟ID上报
#define PUSH_DEVICEID  [NSString stringWithFormat:@"%@%@",INFO_SERVICE,@"device/save"]
// 更新
#define GET_LEPLAY  [NSString stringWithFormat:@"%@%@",INFO_SERVICE,@"version/update"]
// 配置
#define URL_CONFIGS  [NSString stringWithFormat:@"%@%@",INFO_SERVICE,@"configs"]
// 闪屏
#define URL_SPLASH  [NSString stringWithFormat:@"%@%@",INFO_SERVICE,@"ad/splash"]
// 更新用户昵称
#define USER_NAME_MODIFY  [NSString stringWithFormat:@"%@%@",USER_SERVICE,@"name/modify"]
// 上传用户头象
#define USER_IMG_UPLOAD  [NSString stringWithFormat:@"%@%@",USER_SERVICE,@ "image/upload"]
// 修改用户头象
#define  USER_IMG_MODIFY  [NSString stringWithFormat:@"%@%@",USER_SERVICE,@"icon/modify"]
//用户渠道保存
#define  USER_SAVE  [NSString stringWithFormat:@"%@%@",USER_SERVICE,@"channel/save"]
// 用户同步
#define LETVUSER_FORClIENT  [NSString stringWithFormat:@"%@%@",USER_SERVICE,@"channel/register"]
// 获取用户信息
#define USER_INFO  [NSString stringWithFormat:@"%@%@",USER_SERVICE,@"get"]
// 获取htmltoken
#define  USER_PTTK  [NSString stringWithFormat:@"%@%@",USER_SERVICE,@"pttk/create"]
// 快速登陆
#define  USER_QUICK_LOGIN  [NSString stringWithFormat:@"%@%@",USER_SERVICE,@"quick/login"]
// 登陆
#define USER_LOGIN  [NSString stringWithFormat:@"%@%@",USER_SERVICE,@"login"]
// 注册
#define  USER_REGISTER  [NSString stringWithFormat:@"%@%@",USER_SERVICE,@"register"]
// 获取验证码
#define  GET_VCODE  [NSString stringWithFormat:@"%@%@",USER_SERVICE,@"sendCode"]
// 忘记密码获取验证码
#define  FORGET_GET_VCODE  [NSString stringWithFormat:@"%@%@",USER_SERVICE,@"password/forget/sendCode"]
// 重置密码
#define  FORGET_RESET  [NSString stringWithFormat:@"%@%@",USER_SERVICE,@"password/reset"]
// 获取修改绑定验证码
#define BIND_GET_VCODE  [NSString stringWithFormat:@"%@%@",USER_SERVICE,@"bind/sendCode"]
// 绑定qq或微信
#define  BIND_QQWECHAT  [NSString stringWithFormat:@"%@%@",USER_SERVICE,@"openid/bind"]
// 解绑绑定qq或微信
#define  UBIND_QQWECHAT  [NSString stringWithFormat:@"%@%@",USER_SERVICE,@"openid/unbind"]

// 绑定手机
#define  BIND_PHONE  [NSString stringWithFormat:@"%@%@",USER_SERVICE,@"mobile/bind"]
// 换绑手机
#define  CHANGE_PHONE  [NSString stringWithFormat:@"%@%@",USER_SERVICE,@"mobile/modify"]

//获取乐币
#define USER_LECOIN  [NSString stringWithFormat:@"%@%@",COIN_SERVICE,@"coin/get"]
//查询消费记录
#define  GET_PAY_HISTORY  [NSString stringWithFormat:@"%@%@",COIN_SERVICE,@"coin/record/query"]
//消费
#define  COST_COIN  [NSString stringWithFormat:@"%@%@",COIN_SERVICE,@"consumecoin"]
//帮助中心首页
#define HELP_SERVER  [NSString stringWithFormat:@"%@%@",HTML_SERVICE,@"index.html"]



#endif /* URL_h */
