//
//  YWRequestData.m
//  PunchTopMasters
//
//  Created by 蔡路飞 on 2018/3/28.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "YWRequestData.h"

@implementation YWRequestData

//#pragma mark - 首页-----
//+ (void)getHomeListWithDict:(NSDictionary *)dict success:(void (^) (id responseObject))sucess{
//    [LFHttpTool post:HOME_PAGE params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//          [MBManager hideAlert];
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//            sucess(responseObj);
//        }else{
//        [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//        [MBManager showBriefAlert:@"网络错误"];
//
//    }];
//
//}
//#pragma mark - 快去进入房间-----
//+ (void)fastEnterRoomDict:(NSDictionary *)dict success:(void (^) (id responseObject))sucess failed:(void(^)( NSError *error))failed{
//    LFLog(@"%@",ROOM_QUERY);
//    [LFHttpTool post:ROOM_QUERY params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//          LFLog(@"%@",responseObj);
//          [MBManager hideAlert];
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//            sucess(responseObj);
//        }else{
//              sucess(responseObj);
//            [MBManager showBriefAlert:@"没有匹配到房间，稍后再试"];}
//    } failure:^(NSError *error) {
//          sucess(error);
//        [MBManager showBriefAlert:@"网络错误"];
//
//    }];
//
//}
//+ (void)createRoomDict:(NSDictionary *)dict success:(void (^) (id responseObject))sucess{
//
//    [LFHttpTool post:CREAT_ROOM params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
//          [MBManager hideAlert];
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//            sucess(responseObj);
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//        [MBManager showBriefAlert:@"网络错误"];
//
//    }];
//}
+ (void)registUserSendcodeDict:(NSDictionary *)dict success:(void (^) (id responseObject))sucess{

    [LFHttpTool post:GET_VCODE params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        LFLog(@"%@",responseObj);

          [MBManager hideAlert];
        if ([responseObj[@"status"] isEqual:@(0)]) {
            sucess(responseObj);
             [MBManager showBriefAlert:@"验证码已发动注意查收"];
        }else{
            [MBManager showBriefAlert:responseObj[@"message"]];}
    } failure:^(NSError *error) {
        [MBManager showBriefAlert:@"网络错误"];
         [MBManager hideAlert];
    }];
//
}
//#pragma mark - 注册用户-----
//+ (void)registUserDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
//    [LFHttpTool post:USER_REGISTER params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
//          [MBManager hideAlert];
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//            sucess(responseObj);
//            [MBManager showBriefAlert:@"注册成功"];
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//        [MBManager showBriefAlert:@"网络错误"];
//         [MBManager hideAlert];
//    }];
//}
//#pragma mark - 用户登录-----
//+ (void)userLoginDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
//
//    [LFHttpTool post:USER_LOGIN params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
//          [MBManager hideAlert];
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//            sucess(responseObj);
//
//            [MBManager showBriefAlert:@"登录成功"];
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//        [MBManager showBriefAlert:@"网络错误"];
//         [MBManager hideAlert];
//    }];
//}
//#pragma mark - 查询房间信息-----
//
//+ (void)getRoomDetailsDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
//[LFHttpTool post:GET_ROOM_INFO params:dict progress:^(id downloadProgress) {
//} success:^(id responseObj) {
//    LFLog(@"%@",responseObj);
//      [MBManager hideAlert];
//    if ([responseObj[@"status"] isEqual:@(0)]) {
//        sucess(responseObj);
////        [MBManager showBriefAlert:@""];
//    }else{
//        [MBManager showBriefAlert:responseObj[@"message"]];}
//} failure:^(NSError *error) {
//    [MBManager showBriefAlert:@"网络错误"];
//     [MBManager hideAlert];
//}];
//}
//#pragma mark - 进入房间----
//+ (void)enterRoomDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
//    [LFHttpTool post:ENTER_ROOM params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
//          [MBManager hideAlert];
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//            sucess(responseObj);
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//        [MBManager showBriefAlert:@"网络错误"];
//         [MBManager hideAlert];
//    }];
//}
//#pragma mark - 我在那个房间----
//+ (void)myRoomDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
//
//    [LFHttpTool post:USER_MYROOM params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
//          [MBManager hideAlert];
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//            sucess(responseObj);
//
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//        [MBManager showBriefAlert:@"网络错误"];
//         [MBManager hideAlert];
//    }];
//
//}
//#pragma mark - 踢人----
//+ (void)leaveRoomDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
//    [MBManager showWaitingWithTitle:@"稍后.."];
//    [LFHttpTool post:DELETE_PERSON params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
//          [MBManager hideAlert];
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//            sucess(responseObj);
//
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//        [MBManager showBriefAlert:@"网络错误"];
//         [MBManager hideAlert];
//    }];
//
//}
//#pragma mark - 免费加氟队列---
//+ (void)freeJionQueueDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
//    [MBManager showWaitingWithTitle:@"稍后.."];
//    [LFHttpTool post:JOIN_Q_FREE params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
//         [MBManager hideAlert];
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//            sucess(responseObj);
//            [MBManager hideAlert];
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//         [MBManager hideAlert];
//        [MBManager showBriefAlert:@"网络错误"];
//
//    }];
//
//}
//
//#pragma mark - 删除房间---
//+ (void)deleRoomDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
//    [MBManager showWaitingWithTitle:@"稍后.."];
//    [LFHttpTool post:DELETE_ROOM params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//            sucess(responseObj);
//            [MBManager hideAlert];
////            [MBManager showBriefAlert:@"解散成功"];
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//        [MBManager hideAlert];
//        [MBManager showBriefAlert:@"网络错误"];
//
//    }];
//}
//#pragma mark -用户主页---
//+ (void)userHomePageDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
//
//    [LFHttpTool post:USER_HOMEPAGE params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
//
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//            sucess(responseObj);
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//
//        [MBManager showBriefAlert:@"网络错误"];
//
//    }];
//}
//+ (void)quitQueueeDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
//    [LFHttpTool post:QUIT_Q params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//            sucess(responseObj);
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//
//        [MBManager showBriefAlert:@"网络错误"];
//
//    }];
//}
////用户退出队列
//+ (void)isEnterRoomWhitUserId:(NSString *)roomId  enterSuccess:(void (^) (BOOL isEnter ,BOOL isMe, YWMyRoomModel * myRoomModel) )entersuccess{
//      NSMutableDictionary *  getRoomDict = diction;getRoomDict[@"id"] =  roomId;
//    [YWRequestData getRoomDetailsDict:getRoomDict success:^(id responseObj) {
//
//       YWRoomModel * roomModel = [YWRoomModel mj_objectWithKeyValues:responseObj[@"data"]];
//
//
//        if ([roomModel.roomInfo.status isEqualToString:@"-1"]) {
//              [MBManager showBriefAlert:@"房间已经解散"];
//            return ;
//        }
//        if ( roomModel.result.length) {
//
//
//            NSMutableDictionary *  myRoomDict = diction;myRoomDict[@"token"] =  loginToken;
//            [YWRequestData myRoomDict:myRoomDict success:^(id responseObj) {
//                YWMyRoomModel * myRoomModel = [YWMyRoomModel mj_objectWithKeyValues:responseObj[@"data"]];
//                if (myRoomModel.roomId.length) {//在房间
//
//
//                    if ([myRoomModel.isInQueue isEqualToString:@"0"]) {//不在队列
//                        entersuccess(YES,NO,myRoomModel);
//                    }else{//在队列
//
//                        if ([myRoomModel.userId isEqualToString:loginUid]) {//我自己创建的房间
//
//                            if ([roomModel.roomInfo.roomId isEqualToString:myRoomModel.roomId]) {
//                                 entersuccess(YES,NO,myRoomModel);
//                            }else{
//                                 entersuccess(NO,YES,myRoomModel);
//                            }
//                            return ;
//                        }
//
//
//                        if([roomId isEqualToString:myRoomModel.roomId]){
//                            entersuccess(YES,NO,myRoomModel);
//                        }else{
//                            [MBManager showBriefAlert:@"您已近在队列中，不能加入新房间"];
//                        }
//                    }
//
//                }else{
//                    entersuccess(YES,NO,myRoomModel);
//                }
//
//
//            }];
//
//
//
//        }else{
//            [MBManager showBriefAlert:@"没有此房间"];
//            return ;
//        }
//    }];
//
//
//
//}
//
//
//#pragma mark --减少一个队列
//+ (void)quitSubOneQueueDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
//
//    [LFHttpTool post:QUIT_SUB params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//            sucess(responseObj);
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//
//        [MBManager showBriefAlert:@"网络错误"];
//
//    }];
//}
////
//#pragma mark -增加一个队列
//+ (void)quitAddOneQueueDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
//
//    [LFHttpTool post:QUIT_ADD params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//            sucess(responseObj);
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//
//        [MBManager showBriefAlert:@"网络错误"];
//
//    }];
//}
//#pragma mark -是否关注用户
//+ (void)followExitDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
//    [LFHttpTool post:FOLLOW_EXIST params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
////        {
////            "status" = 0,
////            "message" = ok,
////            "data" = 0,
////        }
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//            sucess(responseObj);
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//
//        [MBManager showBriefAlert:@"网络错误"];
//
//    }];
//}
//
//#pragma mark -关注用户
//+ (void)followUserDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
//    [LFHttpTool post:FOLLOW params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
//
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//            sucess(responseObj);
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//
//        [MBManager showBriefAlert:@"网络错误"];
//
//    }];
//
//}
//#pragma mark -剔除队列
//+ (void)kickQueueDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
//    [LFHttpTool post:KICK_Q params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
//
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//            sucess(responseObj);
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//
//        [MBManager showBriefAlert:@"网络错误"];
//
//    }];
//
//}
//#pragma mark -房间踢人
//+ (void)delPersonRoomDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
//    [LFHttpTool post:DELETE_PERSON params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
//
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//            sucess(responseObj);
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//
//        [MBManager showBriefAlert:@"网络错误"];
//
//    }];
//
//}
//#pragma mark -开始游戏
//+ (void)startGameDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
//    [LFHttpTool post:HOST_START params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
//
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//            sucess(responseObj);
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//
//        [MBManager showBriefAlert:@"网络错误"];
//
//    }];
//
//}
//#pragma mark - 检测微信、QQ是否绑定客服
//+ (void)checkCustomerServiceDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
//    [LFHttpTool post:HECK_CUSSERVICE params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
//
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//            sucess(responseObj);
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//
//        [MBManager showBriefAlert:@"网络错误"];
//
//    }];
//
//}
//#pragma mark - 解绑qq或微信
//+ (void)unBindQQWXDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
//
//    [LFHttpTool post:UNBIND_QQWECHAT params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
//
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//            sucess(responseObj);
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//
//        [MBManager showBriefAlert:@"网络错误"];
//
//    }];
//
//}
//
//#pragma mark -  获取绑定客服
//+ (void)getUserBotInfoDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
//
//    [LFHttpTool post:GET_USERBOT params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
//
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//            sucess(responseObj);
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//
//        [MBManager showBriefAlert:@"网络错误"];
//
//    }];
//
//}
//#pragma mark -  验证绑定客服信息
//+ (void)verifynfoDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
//
//    [LFHttpTool post:TO_VERIFY params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
//
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//              [MBManager showBriefAlert:@"绑定成功"];
//            sucess(responseObj);
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//
//        [MBManager showBriefAlert:@"网络错误"];
//
//    }];
//
//}
//#pragma mark -  绑定QQ或者微信
//+ (void)bingQQorWechatDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
//
//    [LFHttpTool post:BIND_QQWECHAT params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
//
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//            sucess(responseObj);
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//
//        [MBManager showBriefAlert:@"网络错误"];
//
//    }];
//
//}
//
//#pragma mark -  解绑定QQ或者微信
//+ (void)unBingQQorWechatNumberDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
//
//    [LFHttpTool post:UBIND_QQWECHAT params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
//
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//            sucess(responseObj);
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//
//        [MBManager showBriefAlert:@"网络错误"];
//
//    }];
//
//}
//#pragma mark -  房主点击结束游戏
//+ (void)roomMasterEndGameDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
//
//    [LFHttpTool post:HOST_END params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
//
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//            sucess(responseObj);
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//
//        [MBManager showBriefAlert:@"网络错误"];
//
//    }];
//
//}
//#pragma mark - 是否是MVP--AA房
//+ (void)saveMVPDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
//    [LFHttpTool post:MVP_SAVE params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//            sucess(responseObj);
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//
//        [MBManager showBriefAlert:@"网络错误"];
//
//    }];
//
//}
//#pragma mark - 认可房主这局比赛---撒币
//+ (void)confirmInningsDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
//    [LFHttpTool post:CONFIRM_SAVE params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//            sucess(responseObj);
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//
//        [MBManager showBriefAlert:@"网络错误"];
//
//    }];
//}
//#pragma mark - 不认可房主这局比赛举报--撒币
//+ (void)reportInningsDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
//    [LFHttpTool post:REPORT_SAVE params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//            sucess(responseObj);
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//
//        [MBManager showBriefAlert:@"网络错误"];
//
//    }];
//}
//#pragma mark - 这局是否赢了--悬赏
//+ (void)winInningsDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
//    [LFHttpTool post:WIN_SAVE params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//            sucess(responseObj);
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//
//        [MBManager showBriefAlert:@"网络错误"];
//
//    }];
//}
//#pragma mark -我的开黑记录
//+ (void)playGameRecordDict:(NSDictionary *)dict success:(void (^) (YWPlayGameRecordModel * playGameRecordModel))sucess{
//    [LFHttpTool post:GET_FLOWID params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//
//        LFLog(@"%@",responseObj);
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//             YWPlayGameRecordModel * playGameRecordModel = [YWPlayGameRecordModel mj_objectWithKeyValues:responseObj[@"data"]];
//            sucess(playGameRecordModel);
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//
//        [MBManager showBriefAlert:@"网络错误"];
//
//    }];
//}
//
//#pragma mark - 获取虚拟币
//+ (void)getCoinDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
//    [LFHttpTool post:USER_LECOIN params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//            sucess(responseObj);
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//
//        [MBManager showBriefAlert:@"网络错误"];
//
//    }];
//}
//#pragma mark -所有的代金券
//+ (void)allCouponsDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
//    [LFHttpTool post:COUPON_USER params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//            sucess(responseObj);
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//
//        [MBManager showBriefAlert:@"网络错误"];
//
//    }];
//}
//#pragma mark -消费余额
//+ (void)costCoinDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
//    LFLog(@"%@",COST_COIN);
//    [LFHttpTool post:COST_COIN params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//
//            sucess(responseObj);
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//
//        [MBManager showBriefAlert:@"网络错误"];
//
//    }];
//}
//#pragma mark -开黑记录列表--------
//+ (void)playRecordListDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
//    [LFHttpTool post:PAYORDER_MYLIST params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//
//            sucess(responseObj);
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//
//        [MBManager showBriefAlert:@"网络错误"];
//
//    }];
//}
//#pragma mark -开黑记录详情--------
//+ (void)playRecordDetailstDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
//    [LFHttpTool post:GET_ORDER_DETAIL params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//
//            sucess(responseObj);
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//
//        [MBManager showBriefAlert:@"网络错误"];
//
//    }];
//}
//+ (void)praiseDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
//    [LFHttpTool post:ORDER_COMMENT params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//
//            sucess(responseObj);
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//
//        [MBManager showBriefAlert:@"网络错误"];
//
//    }];
//}
//// 提现
//+ (void)userTxDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
////    USER_TX
//    LFLog(@"%@",USER_TX);
//    [LFHttpTool post:USER_TX params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//
//            sucess(responseObj);
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//
//        [MBManager showBriefAlert:@"暂不支持提现"];
//
//    }];
//
//}
//
//// 提现记录列表
//
//+ (void)userTxListDict:(NSDictionary *)dict  token:(NSString * )token success:(void (^) (id responseObj))sucess{
//
//    [LFHttpTool post:USER_TXLIST params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//            sucess(responseObj);
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//        [MBManager showBriefAlert:@"网络错误"];
//    }];
////    [LFHttpTool get:[NSString stringWithFormat:@"%@?token=%@",USER_TXLIST,token]  params:nil progress:^(id downloadProgress) {
////
////    } success:^(id responseObj) {
////        LFLog(@"%@",responseObj);
////        if ([responseObj[@"status"] isEqual:@(0)]) {
////            sucess(responseObj);
////        }else{
////            [MBManager showBriefAlert:responseObj[@"message"]];}
////    } failure:^(NSError *error) {
////  [MBManager showBriefAlert:@"网络错误"];
////    }];
//
//}
//// 问题反馈
//+ (void)faedBackDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
//    //    USER_TX
//     LFLog(@"%@",FEEDBACK);
//    [LFHttpTool post:FEEDBACK params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//
//            sucess(responseObj);
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//
//        [MBManager showBriefAlert:@"网络错误"];
//
//    }];
//
//}
////关注列表
//+ (void)followListDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
//    //    USER_TX
//    LFLog(@"%@",FEEDBACK);
//    [LFHttpTool post:FOLLOW_LIST params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//
//            sucess(responseObj);
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//
//        [MBManager showBriefAlert:@"网络错误"];
//
//    }];
//
//}
////粉丝列表
//+ (void)fanListDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
//    //    USER_TX
//    LFLog(@"%@",FEEDBACK);
//    [LFHttpTool post:FAN_LIST params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//
//            sucess(responseObj);
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//
//        [MBManager showBriefAlert:@"网络错误"];
//
//    }];
//
//}
////从启动到开始游戏
//+ (void)kaishiyouxiDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
//    //    USER_TX
//    LFLog(@"%@",FEEDBACK);
//    [LFHttpTool post:KAISHIYOUXI params:dict progress:^(id downloadProgress) {
//    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
//        if ([responseObj[@"status"] isEqual:@(0)]) {
//
//            sucess(responseObj);
//        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];}
//    } failure:^(NSError *error) {
//
//        [MBManager showBriefAlert:@"网络错误"];
//
//    }];

//}

@end
