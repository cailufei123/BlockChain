//
//  YWRequestData.h
//  PunchTopMasters
//
//  Created by 蔡路飞 on 2018/3/28.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface YWRequestData : NSObject
////- 首页-----
//+ (void)getHomeListWithDict:(NSDictionary *)dict success:(void (^) (id responseObject))sucess;
////- 快去进入房间-----
//+ (void)fastEnterRoomDict:(NSDictionary *)dict success:(void (^) (id responseObject))sucess failed:(void(^)( NSError *error))failed;
//// - 创建房间-----
//+ (void)createRoomDict:(NSDictionary *)dict success:(void (^) (id responseObject))sucess;
//// - 注册用户发送验证码-----
+ (void)registUserSendcodeDict:(NSDictionary *)dict success:(void (^) (id responseObject))sucess;
//// - 注册用户-----
//+ (void)registUserDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
//// - 用户登录-----
//+ (void)userLoginDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
////- 查询房间信息-----
//+ (void)getRoomDetailsDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
//// - 进入房间----
//+ (void)enterRoomDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
////- 我在那个房间----
//+ (void)myRoomDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
//// -踢人-----
//+ (void)leaveRoomDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
////- 免费加氟队列---
//+ (void)freeJionQueueDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
////- 删除房间---
//+ (void)deleRoomDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
////-用户主页---
//+ (void)userHomePageDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
////用户退出队列
//+ (void)quitQueueeDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
////减少一个队列
//+ (void)quitSubOneQueueDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
////增加一个队列
//+ (void)quitAddOneQueueDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
////用户退出队列
//+ (void)isEnterRoomWhitUserId:(NSString *)roomId  enterSuccess:(void (^) (BOOL isEnter ,BOOL isMe, YWMyRoomModel * myRoomModel))entersuccess;
////是否关注用户
//+ (void)followExitDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
////关注用户
//+ (void)followUserDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
////剔除队列
//+ (void)kickQueueDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
////房间踢人
//+ (void)delPersonRoomDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
////开始游戏
//+ (void)startGameDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
//
////检测微信、QQ是否绑定客服
//+ (void)checkCustomerServiceDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
////解绑qq或微信
//+ (void)unBindQQWXDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
//// 获取绑定客服
//+ (void)getUserBotInfoDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
////  验证绑定客服信息
//+ (void)verifynfoDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
////   绑定QQ或者微信
//+ (void)bingQQorWechatDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
//// 解绑定QQ或者微信
//+ (void)unBingQQorWechatNumberDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
////房主点击结束游戏
//+ (void)roomMasterEndGameDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
////是否是MVP
//+ (void)saveMVPDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
////认可房主这局比赛
//+ (void)confirmInningsDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
////不认可房主这局比赛--举报
//+ (void)reportInningsDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
//// 这局是否赢了--悬赏
//+ (void)winInningsDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
//// 我的开黑记录
//+ (void)playGameRecordDict:(NSDictionary *)dict success:(void (^) (YWPlayGameRecordModel * playGameRecordModel))sucess;
//// 获取虚拟币
//+ (void)getCoinDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
//// 所有的代金券
//+ (void)allCouponsDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
//// 消费余额
//+ (void)costCoinDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
//// 开黑记录列表
//+ (void)playRecordListDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
//// 开黑记录详情
//+ (void)playRecordDetailstDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
////点赞
//+ (void)praiseDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
//// 提现
//+ (void)userTxDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
//// 提现记录列表
////+ (void)userTxListDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
//
//+ (void)userTxListDict:(NSDictionary *)dict  token:(NSString * )token success:(void (^) (id responseObj))sucess;
//// 问题反馈
//+ (void)faedBackDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
////关注列表
//+ (void)followListDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
//  
////粉丝列表
//+ (void)fanListDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;
////从启动到开始游戏
//+ (void)kaishiyouxiDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess;

@end
