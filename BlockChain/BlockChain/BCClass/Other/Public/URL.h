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


//线上还是测试 1-测试 0-线上
#define Mode_Value 0

/**  API*/
#if Mode_Value

#define SERVER_ADDR @"http://101.200.74.83:8080"
//#define USER_SERVER_ADDR @"http://182.92.205.236"
//#define PAY_SERVER_ADDR  @"http://182.92.205.236"
#else


#define SERVER_ADDR @"http://caifu.leilook.com" //新线上域名
//#define SERVER_ADDR @"http://esp.im-come.com"
//#define USER_SERVER_ADDR @"http://esp.im-come.com"
//#define PAY_SERVER_ADDR  @"http://im-come.com"

#endif





#define USER_URL  @"/blockcoin/api/user/"
#define COIN_URL  @"/blockcoin/api/token/"
#define HONGBAO_URL @"/blockcoin/hongbao/"
#define INFO_URL @"/blockcoin/api/"
#define ORDER_URL @"/blockcoin/api/game/"
#define HTML_URL @"/html/"
#define TOKEN_URL @"/blockcoin/api/token/"

#define USER_SERVICE [NSString stringWithFormat:@"%@%@",SERVER_ADDR,USER_URL]
#define HTML_SERVICE  [NSString stringWithFormat:@"%@%@",SERVER_ADDR,HTML_URL]
#define INFO_SERVICE   [NSString stringWithFormat:@"%@%@",SERVER_ADDR,INFO_URL]
#define TOKEN_SERVICE  [NSString stringWithFormat:@"%@%@",SERVER_ADDR,TOKEN_URL]
#define COIN_SERVICE   [NSString stringWithFormat:@"%@%@",SERVER_ADDR,COIN_URL]



// 配置
    #define URL_CONFIGS [NSString stringWithFormat:@"%@%@",INFO_SERVICE, @"configs"]  
// 闪屏
    #define URL_SPLASH [NSString stringWithFormat:@"%@%@",INFO_SERVICE,@"ad/splash"]  
// 获取收款码
    #define USER_QRCODE [NSString stringWithFormat:@"%@%@",TOKEN_SERVICE, @"getQrCode"]  

// 更新
    #define GET_LEPLAY [NSString stringWithFormat:@"%@%@",USER_SERVICE,@"version/update"]  
// U盟ID上报
    #define PUSH_DEVICEID [NSString stringWithFormat:@"%@%@",USER_SERVICE,@"device/save"]  
// 更新用户昵称
    #define USER_NAME_MODIFY [NSString stringWithFormat:@"%@%@",USER_SERVICE,@"code/modify"]  
// 上传用户头象
    #define USER_IMG_UPLOAD [NSString stringWithFormat:@"%@%@",USER_SERVICE, @"image/upload"]  
// 修改用户头象
    #define USER_IMG_MODIFY [NSString stringWithFormat:@"%@%@",USER_SERVICE, @"icon/modify"]  
//用户渠道保存
    #define USER_SAVE [NSString stringWithFormat:@"%@%@",USER_SERVICE,@"channel/save"]  
// 获取用户信息
 #define USER_INFO [NSString stringWithFormat:@"%@%@",USER_SERVICE, @"get"]  
// 获取htmltoken
 #define USER_PTTK [NSString stringWithFormat:@"%@%@",USER_SERVICE,@"pttk/create"]  
// 登陆
 #define USER_LOGIN [NSString stringWithFormat:@"%@%@",USER_SERVICE,@"login"]
//用户退出登陆
#define USER_OUTLOGIN [NSString stringWithFormat:@"%@%@",USER_SERVICE,@"logout"]
// 注册
 #define USER_REGISTER [NSString stringWithFormat:@"%@%@",USER_SERVICE,@"register"]  
// 获取验证码
 #define GET_VCODE [NSString stringWithFormat:@"%@%@",USER_SERVICE, @"sendCode"]  
// 获取设置密码验证码
 #define GET_PWD_VCODE [NSString stringWithFormat:@"%@%@",USER_SERVICE, @"password/sendCode"]  
// 重置密码
 #define FORGET_RESET [NSString stringWithFormat:@"%@%@",USER_SERVICE, @"password/save"]  
// 身份认证
 #define AUTH_CARDID [NSString stringWithFormat:@"%@%@",USER_SERVICE,@"saveID"]  
// 意见反馈
 #define FEEDBACK [NSString stringWithFormat:@"%@%@",USER_SERVICE, @"feedback/add"]  

//提现
 #define CASH_COIN [NSString stringWithFormat:@"%@%@",COIN_SERVICE, @"transfer"]  
//获取余额
 #define USER_LECOIN [NSString stringWithFormat:@"%@%@",COIN_SERVICE, @"coin/get"]  
//查询消费记录
 #define GET_CANDY_HISTORY [NSString stringWithFormat:@"%@%@",TOKEN_SERVICE, @"getCandyList"]  


//首页数据  header
 #define HOME_PAGE [NSString stringWithFormat:@"%@%@",USER_SERVICE, @"drill/getUserDrills"]  
//领取紫钻
 #define GAIN_DIAMOND [NSString stringWithFormat:@"%@%@",USER_SERVICE,@"drill/grantUserDrill"]  
//首页糖果列
 #define CANDY_LIST [NSString stringWithFormat:@"%@%@",INFO_SERVICE,@"candy/list"]
//领取糖果
 #define CANDY_GAIN [NSString stringWithFormat:@"%@%@",INFO_SERVICE,@"candy/user/gain"]  
//糖果详情
 #define CANDY_DETAIL [NSString stringWithFormat:@"%@%@",INFO_SERVICE, @"candy/detail"]
//算力 和记录
 #define COMPUTE_POWER [NSString stringWithFormat:@"%@%@",USER_SERVICE, @"compute/getComputeLogs"]
//邀请页分享码
#define INVITE_PARAMS [NSString stringWithFormat:@"%@%@",USER_SERVICE, @"inviteParams"]
//TOKEN 详情页
 #define TOKEN_DETAIL [NSString stringWithFormat:@"%@%@",TOKEN_SERVICE, @"getTokenInfo"]  

//获取分享人数
 #define INVITEINDEX [NSString stringWithFormat:@"%@%@",INFO_SERVICE,@"sharedownload/inviteIndex"]  
//中奖公告
 #define PRODUCT_WINS [NSString stringWithFormat:@"%@%@",INFO_SERVICE, @"notice/list"]  


//用户协议
 #define COMSTUM_SERVER [NSString stringWithFormat:@"%@%@",HTML_SERVICE,@"user_agreement.html"]  
//玩法攻
 #define GAME_PLAY [NSString stringWithFormat:@"%@%@",HTML_SERVICE, @"strategy.html"]  
//关于我
 #define ABOUT_US [NSString stringWithFormat:@"%@%@",HTML_SERVICE,@"about_us.html"]  


//查询提现记录
 #define GET_CASH_HISTORY [NSString stringWithFormat:@"%@%@",HTML_SERVICE,@"/api/duobaopayment/ali/queryTof"]  

//获取各种token余额（获取用户糖果包详情）
 #define MY_TOKEN_LIST [NSString stringWithFormat:@"%@%@",TOKEN_SERVICE,@"getUserCoin"]  

//任务
//普通任务列表
 #define TASK_LIST [NSString stringWithFormat:@"%@%@",INFO_SERVICE,@"task/list"]  
//普通任务详情
 #define TASK_DETAIL [NSString stringWithFormat:@"%@%@",INFO_SERVICE, @"task/detail"]  
//普通任务上报（做了一次任务）
 #define TASK_DO_ONCE [NSString stringWithFormat:@"%@%@",INFO_SERVICE,@"task/user/do"]  
//原力任务列表
 #define USER_TASK_LIST [NSString stringWithFormat:@"%@%@",USER_SERVICE,@"task/list"]  
//原力任务上报（收取紫钻）
 #define USER_TASK_REPORT_PIRPLE [NSString stringWithFormat:@"%@%@",USER_SERVICE,@"task/grantDrill"]  
//原力任务上报（邀请任务）
 #define USER_TASK_REPORT_INVITE [NSString stringWithFormat:@"%@%@",USER_SERVICE,@"task/invite"]  
//原力任务上报（每日app）
 #define USER_TASK_REPORT_EVERYDAY [NSString stringWithFormat:@"%@%@",USER_SERVICE,@"task/useApp"]  

//// 错误日志收集
// #define ERROR_FEEDBACK [NSString stringWithFormat:@"%@%@",SERVER_ADDR,HTML_URL] "";


#endif /* URL_h */
