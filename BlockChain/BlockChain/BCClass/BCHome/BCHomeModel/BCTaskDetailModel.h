//
//  BCTaskDetailModel.h
//  BlockChain
//
//  Created by Mac on 2018/5/24.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface TaskInfo : NSObject
@property(nonatomic,strong)NSString *ID;// = 3,
@property(nonatomic,strong)NSString *partnerId;// = 10002,
@property(nonatomic,strong)NSString *count;// = 10,
@property(nonatomic,strong)NSString *totalCoin;// = 30,
@property(nonatomic,strong)NSString *max;// = 1,
@property(nonatomic,strong)NSString *taskDesc;// = 多多分享，领取糖果,
@property(nonatomic,strong)NSString *code;// = GGC,
@property(nonatomic,strong)NSString *eachCoin;//= 3,
@property(nonatomic,strong)NSString *opNum;// = 3,
@property(nonatomic,strong)NSString *createTime;// = 1527501463000,
@property(nonatomic,strong)NSString *doneNum;//= 0,
@property(nonatomic,strong)NSString *modifyTime;//= 1527501468000,
@property(nonatomic,strong)NSString *compute;// = 0.5,
@property(nonatomic,strong)NSString *doneCount;// = 0,
@property(nonatomic,strong)NSString *name ;// 多多分享，领取糖果,
@property(nonatomic,strong)NSString *status;//= 2,}}
@end
@interface PartnerInfo : NSObject
@property(nonatomic,strong)NSString *projectName;// = 狗狗币,
@property(nonatomic,strong)NSString *brief;// = Dogecoin，有人称作“狗狗币/狗币”，诞生于2013年12月8日，基于Scrypt算法，是国际上用户数仅次于比特币的第二大虚拟货币 [1]  。数字货币是民间发起的全球通用货币，不属于某个国家，是属于全人类，具有全球转帐速度快的优点，如几秒内就可以把钱由国内汇到美国，且费用低廉，并且总量不会像法币一样随意增发，总量相对稳定。,
@property(nonatomic,strong)NSString *partnerId;//
@property(nonatomic,strong)NSString *mobile;// = 13426163058,
@property(nonatomic,strong)NSString *contact;// = 王小国,
@property(nonatomic,strong)NSString *slogan;//= 国际上用户数仅次于比特币的第二大虚拟货币,
@property(nonatomic,strong)NSString *code;// = GGC,
@property(nonatomic,strong)NSString *price;//= 3,
@property(nonatomic,strong)NSString *icon;// = http://101.200.74.83/upload/images/a8b4ec48-fa01-406f-9f89-fa1cdb16141b.jpg,
@property(nonatomic,strong)NSString *createTime;// = 1527491009000,
@property(nonatomic,strong)NSString *tel;// = 13426163058,
@property(nonatomic,strong)NSString *site;// = www.xoin.com,
@property(nonatomic,strong)NSString *email;// = 13426163058@11.cn,
@property(nonatomic,strong)NSString *name;// = wzg,
@property(nonatomic,strong)NSString *pubCount;// = 10000000,
@end
@interface UserInfo : NSObject
@property(nonatomic,strong)NSString *isAuthed;// = 2,
@property(nonatomic,strong)NSString *realName;// = 蔡鲁飞,
@property(nonatomic,strong)NSString *mobile;// = 15801658134,
@property(nonatomic,strong)NSString *maxTask;// = 1,
@property(nonatomic,strong)NSString *isPayPassSet;// = 1,
@property(nonatomic,strong)NSString *userId;// = 100121139,
@property(nonatomic,strong)NSString *token;// = cc215a30137a5a3dec49fb519c7fb7eb,
@property(nonatomic,strong)NSString *icon;// = ,
@property(nonatomic,strong)NSString *compute;// = 55,
@property(nonatomic,strong)NSString *level;//= 2,
@property(nonatomic,strong)NSString *idNo;// = 3479****8996,
@property(nonatomic,strong)NSString *isFeng;// = 0,
@property(nonatomic,strong)NSString *lastInviteCount;// = 10,
@property(nonatomic,strong)NSString *authStatus;// = 2,
@property(nonatomic,strong)NSString *name;// = 蔡鲁飞,
@property(nonatomic,strong)NSString *shareCode;// = jhpoesxq,
@end
@interface BCTaskDetailModel : NSObject

@property(nonatomic,strong)NSString * finish;
@property(nonatomic,strong)TaskInfo * taskInfo;
@property(nonatomic,strong)NSString * doTask;
@property(nonatomic,strong)PartnerInfo * partnerInfo;
@property(nonatomic,strong)NSString * shareUrl;
@property(nonatomic,strong)NSString * max;
@property(nonatomic,strong)UserInfo * userInfo;
//        {
//            "status" = 0,
//            "message" = ok,
//            "data" = {
//                "finish" = 0,
//                "taskInfo" = {
//                    "id" = 3,
//                    "partnerId" = 10002,
//                    "count" = 10,
//                    "totalCoin" = 30,
//                    "max" = 1,
//                    "taskDesc" = 多多分享，领取糖果,
//                    "code" = GGC,
//                    "eachCoin" = 3,
//                    "opNum" = 3,
//                    "createTime" = 1527501463000,
//                    "doneNum" = 0,
//                    "modifyTime" = 1527501468000,
//                    "compute" = 0.5,
//                    "doneCount" = 0,
//                    "name" = 多多分享，领取糖果,
//                    "status" = 2,
//                },
//                "doTask" = <null>,
//                "partnerInfo" = {
//                    "projectName" = 狗狗币,
//                    "brief" = Dogecoin，有人称作“狗狗币/狗币”，诞生于2013年12月8日，基于Scrypt算法，是国际上用户数仅次于比特币的第二大虚拟货币 [1]  。
//                    数字货币是民间发起的全球通用货币，不属于某个国家，是属于全人类，具有全球转帐速度快的优点，如几秒内就可以把钱由国内汇到美国，且费用低廉，并且总量不会像法币一样随意增发，总量相对稳定。,
//                    "partnerId" = 10002,
//                    "mobile" = 13426163058,
//                    "contact" = 王小国,
//                    "slogan" = 国际上用户数仅次于比特币的第二大虚拟货币,
//                    "code" = GGC,
//                    "price" = 3,
//                    "icon" = http://101.200.74.83/upload/images/a8b4ec48-fa01-406f-9f89-fa1cdb16141b.jpg,
//                    "createTime" = 1527491009000,
//                    "tel" = 13426163058,
//                    "site" = www.xoin.com,
//                    "email" = 13426163058@11.cn,
//                    "name" = wzg,
//                    "pubCount" = 10000000,
//                },
//                "shareUrl" = http://101.200.74.83:8080/html/share.html?taskId=3,
//                "max" = 1,
//                "userInfo" = {
//                    "isAuthed" = 2,
//                    "realName" = 蔡鲁飞,
//                    "mobile" = 15801658134,
//                    "maxTask" = 1,
//                    "isPayPassSet" = 1,
//                    "userId" = 100121139,
//                    "token" = cc215a30137a5a3dec49fb519c7fb7eb,
//                    "icon" = ,
//                    "compute" = 55,
//                    "level" = 2,
//                    "idNo" = 3479****8996,
//                    "isFeng" = 0,
//                    "lastInviteCount" = 10,
//                    "authStatus" = 2,
//                    "name" = 蔡鲁飞,
//                    "shareCode" = jhpoesxq,
//                },
//            },
//        }
@end
