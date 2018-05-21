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
//#define SERVER_ADDR @"http://101.200.74.83"
//#define USER_SERVER_ADDR @"http://182.92.205.236"
//#define PAY_SERVER_ADDR  @"http://182.92.205.236"


#define SERVER_ADDR @"http://esp.im-come.com"
#define USER_SERVER_ADDR @"http://esp.im-come.com"
#define PAY_SERVER_ADDR  @"http://im-come.com"




#define USER_URL @"/esports/user/"
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




// 解绑qq或微信
#define UNBIND_QQWECHAT  [NSString stringWithFormat:@"%@%@",GAME_SERVICE,@"unBind"]
// 获取绑定客服
#define GET_USERBOT  [NSString stringWithFormat:@"%@%@",GAME_SERVICE,@"getUserBotInfo"]
// 获取绑定客服信息
#define HECK_CUSSERVICE  [NSString stringWithFormat:@"%@%@",GAME_SERVICE,@"checkCustomerService"]
// 验证绑定客服信息
#define TO_VERIFY  [NSString stringWithFormat:@"%@%@",GAME_SERVICE,@"verify"]


//首页数据
#define HOME_PAGE [NSString stringWithFormat:@"%@%@",INFO_SERVICE,@"index"]
//创建房间
#define CREAT_ROOM  [NSString stringWithFormat:@"%@%@",INFO_SERVICE,@"room/create"]
//房间列表
#define ROOM_QUERY  [NSString stringWithFormat:@"%@%@",INFO_SERVICE,@"room/query"]
//获取分享人数
#define INVITEINDEX  [NSString stringWithFormat:@"%@%@",INFO_SERVICE,@ "sharedownload/inviteIndex"]
//下单
#define PAY  [NSString stringWithFormat:@"%@%@",INFO_SERVICE,@"order/buy"]
// 意见反馈
#define FEEDBACK  [NSString stringWithFormat:@"%@%@",USER_SERVICE,@"feedback/add"]

//评价 点赞
#define ORDER_COMMENT  [NSString stringWithFormat:@"%@%@",ORDER_SERVICE,@"flow/comment/add"]
//订单
#define PAYORDER_MYLIST  [NSString stringWithFormat:@"%@%@",ORDER_SERVICE,@"flow/my/list"]
//查询userGameFlowId
#define GET_FLOWID  [NSString stringWithFormat:@"%@%@",ORDER_SERVICE,@"flow/my/record"]
//获取订单数量
#define USER_ORDER_NUM  [NSString stringWithFormat:@"%@%@",ORDER_SERVICE,@"my/stat"]
//订单详情
#define GET_ORDER_DETAIL  [NSString stringWithFormat:@"%@%@",ORDER_SERVICE,@"flow/detail"]
//汇报战绩
#define MVP_SAVE  [NSString stringWithFormat:@"%@%@",ORDER_SERVICE,@"flow/mvp/save"]
//确认战绩  撒币  认可?不认可
#define CONFIRM_SAVE  [NSString stringWithFormat:@"%@%@",ORDER_SERVICE,@"flow/confirm/save"]
//不认可
#define REPORT_SAVE  [NSString stringWithFormat:@"%@%@",ORDER_SERVICE,@"flow/report/save"]
//确认战绩  悬赏  胜利?失败
#define WIN_SAVE  [NSString stringWithFormat:@"%@%@",ORDER_SERVICE,@"flow/win/save"]
//房主点击开始游戏
#define HOST_START  [NSString stringWithFormat:@"%@%@",ORDER_SERVICE,@"flow/start"]
//房主点击结束游戏
#define HOST_END  [NSString stringWithFormat:@"%@%@",ORDER_SERVICE,@"flow/end"]



//领取新人红包
#define INFO_GIFTBAG  [NSString stringWithFormat:@"%@%@",HONGBAO_SERVICE,@"grant/firstlogin"]
//新人红包列表
#define INFO_GIFTBAG_LIST  [NSString stringWithFormat:@"%@%@",HONGBAO_SERVICE,@"firstlogin/views"]
//获取用户在某一个商品下可用的购物卷
#define COUPON_GOOD  [NSString stringWithFormat:@"%@%@",HONGBAO_SERVICE,@"user/able/coupons"]
//未查看红包数量，小红点
#define COUPON_UNCHECK  [NSString stringWithFormat:@"%@%@",HONGBAO_SERVICE,@"user/couponCount"]
//用户所有代金券
#define COUPON_USER  [NSString stringWithFormat:@"%@%@",HONGBAO_SERVICE,@"user/coupons"]
//购物劵使用规则
#define COUPOON_SERVER  [NSString stringWithFormat:@"%@%@",HTML_SERVICE,@"coupon.html"]
//余额使用规则
#define BALANCE_SERVER  [NSString stringWithFormat:@"%@%@",HTML_SERVICE,@"silver_rule.html"]
//分享规则
#define SHARE_SERVER  [NSString stringWithFormat:@"%@%@",HTML_SERVICE,@"share.html"]
//用户协议
#define COMSTUM_SERVER  [NSString stringWithFormat:@"%@%@",HTML_SERVICE,@"service_agreement.html"]
//帮助中心首页
#define HELP_SERVER  [NSString stringWithFormat:@"%@%@",HTML_SERVICE,@"index.html"]
//关于我们
#define HTML_ABOUT  [NSString stringWithFormat:@"%@%@",HTML_SERVICE,@"about_us.html"]

//提现规则
#define  WITHDRAW_DEPOSIT  [NSString stringWithFormat:@"%@%@",HTML_SERVICE,@"withdraw_deposit.html"]
//进入不去游戏说明
#define  CANNOT_ENTER  [NSString stringWithFormat:@"%@%@",HTML_SERVICE,@"can_not_enter.html"]
//微信支付
#define PAY_WX  [NSString stringWithFormat:@"%@%@",PAY_SERVER_ADDR,@"/api/duobaopayment/wxpayByH5By3"]
//微信支付
#define PAY_WX_QUERY  [NSString stringWithFormat:@"%@%@",PAY_SERVER_ADDR,@ "/api/duobaopayment/payorder/query"] //微信支付结果查询
//自定义支付宝支付
#define PAY_Ali  [NSString stringWithFormat:@"%@%@",PAY_SERVER_ADDR,@"/api/duobaopayment/ali/pay"]  //ali支付
#define PAY_Ali_QUERY  [NSString stringWithFormat:@"%@%@",PAY_SERVER_ADDR,@"/api/duobaopayment/ali/aliorder/query"]  //ali支付回调
//房间
//房间进入
#define ENTER_ROOM  [NSString stringWithFormat:@"%@%@",INFO_SERVICE,@"room/addPerson"]
//进入队列
#define ENTER_Q  [NSString stringWithFormat:@"%@%@",INFO_SERVICE,@"room/addQueue"]
//创建房间
#define CREATE_ROOM  [NSString stringWithFormat:@"%@%@",INFO_SERVICE,@"room/create"]
//删除房间
#define DELETE_ROOM  [NSString stringWithFormat:@"%@%@",INFO_SERVICE,@"room/del"]
//踢人
#define DELETE_PERSON  [NSString stringWithFormat:@"%@%@",INFO_SERVICE,@"room/delPerson"]
//离开队列
#define DELETE_Q  [NSString stringWithFormat:@"%@%@",INFO_SERVICE,@"room/delQueue"]
//查询房间信息
#define GET_ROOM_INFO  [NSString stringWithFormat:@"%@%@",INFO_SERVICE,@"room/get"]
//获取房间人数
#define GET_ROOM_PEOPLE_NUM  [NSString stringWithFormat:@"%@%@",INFO_SERVICE,@"room/personNum"]
//发送消息
#define SEND_MSG  [NSString stringWithFormat:@"%@%@",INFO_SERVICE,@"room/sendMsg"]
//修改房间状态
#define UPDATE_ROOM_STATUS  [NSString stringWithFormat:@"%@%@",INFO_SERVICE,@"room/updateRoomStatus"]
//加入队列(免费)
#define JOIN_Q_FREE  [NSString stringWithFormat:@"%@%@",INFO_SERVICE,@"game/queue/join/free"]
//踢出队列
#define KICK_Q  [NSString stringWithFormat:@"%@%@",INFO_SERVICE,@"game/queue/kick"]
//退出队列
#define QUIT_Q  [NSString stringWithFormat:@"%@%@",INFO_SERVICE,@"game/queue/quit"]
//减少一个队列
#define QUIT_SUB  [NSString stringWithFormat:@"%@%@",INFO_SERVICE,@"game/queue/sub"]
//减少一个队列
#define QUIT_ADD  [NSString stringWithFormat:@"%@%@",INFO_SERVICE,@"game/queue/add"]
//查询多用户的环信状态
#define GET_MULTI_USERS_STATUS  [NSString stringWithFormat:@"%@%@",INFO_SERVICE,@"mul/huan/status"]
//关注
#define FOLLOW  [NSString stringWithFormat:@"%@%@",INFO_SERVICE,@"user/follow/add"]
//是否关注
#define FOLLOW_EXIST  [NSString stringWithFormat:@"%@%@",INFO_SERVICE,@"user/follow/exist"]
//关注列表
#define FOLLOW_LIST  [NSString stringWithFormat:@"%@%@",INFO_SERVICE,@"user/follow/list"]
//粉丝列表
#define FAN_LIST  [NSString stringWithFormat:@"%@%@",INFO_SERVICE,@"user/fan/list"]
//用户主页
#define USER_HOMEPAGE  [NSString stringWithFormat:@"%@%@",INFO_SERVICE,@"user/preface"]
//获取我的当前房间
#define USER_MYROOM  [NSString stringWithFormat:@"%@%@",INFO_SERVICE,@"user/my/room"]

// 错误日志收集
#define ERROR_FEEDBACK  [NSString stringWithFormat:@"%@%@",,@""]

//用户退出登陆
#define USER_OUTLOGIN [NSString stringWithFormat:@"%@%@",USER_SERVICE,@"logout"]
//用户提现
#define USER_TX  [NSString stringWithFormat:@"%@%@",TX,@"cash/apply"]
//提现记录
#define USER_TXLIST  [NSString stringWithFormat:@"%@%@",TX,@"cash/list"]
//从启动到开始游戏
#define KAISHIYOUXI  [NSString stringWithFormat:@"%@%@",GAME_SERVICE,@"ios/toPlay"]

#endif /* URL_h */
