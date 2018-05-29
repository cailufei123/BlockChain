//
//  BCHomeModel.h
//  BlockChain
//
//  Created by 蔡路飞 on 2018/5/28.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BCHomeModel : NSObject

@end

@interface HomeCandyListModel : NSObject
@property(nonatomic,strong)NSString * status;//0：不可领取,1:可以领取 ,
@property(nonatomic,strong)NSString * ID; //
@property(nonatomic,strong)NSString * collectTime; //
@property(nonatomic,strong)NSString * createTime; //
@property(nonatomic,strong)NSString * userId; //
@property(nonatomic,strong)NSString * drill; //
@end
@interface WinPeopleModel : NSObject
@property(nonatomic,strong)NSString * content ; //
@property(nonatomic,strong)NSString * ID; //
@property(nonatomic,strong)NSString * type; //

@end
@interface CandyListModel : NSObject
@property(nonatomic,strong)NSString * canGain; //0：不可领取,1:可以领取 ,
@property(nonatomic,strong)NSString * candyId ; //
@property(nonatomic,strong)NSString * code; //
@property(nonatomic,strong)NSString * cost ; //
@property(nonatomic,strong)NSString * count ; // 发放的总份数 ,
@property(nonatomic,strong)NSString * createTime ; //
@property(nonatomic,strong)NSString * eachCoin ; // 每份领取糖果的数量 ,
@property(nonatomic,strong)NSString * eachCost ; //
@property(nonatomic,strong)NSString * endTime; //
@property(nonatomic,strong)NSString * getCount; //已经领取的分数 ,
@property(nonatomic,strong)NSString * icon; //
@property(nonatomic,strong)NSString * ID; //
@property(nonatomic,strong)NSString * partnerId ; //
@property(nonatomic,strong)NSString * slogan ; // 项目方的标语 ,
@property(nonatomic,strong)NSString * status ; //
@property(nonatomic,strong)NSString * totalCoin ; //
@end
@interface PlatTaskLogModel : NSObject
@property(nonatomic,strong)NSString *createTime;
@property(nonatomic,strong)NSString * doneTimes;
@property(nonatomic,strong)NSString * ID;//唯一标识
@property(nonatomic,strong)NSString * prizeCompute;
@property(nonatomic,strong)NSString * requireTimes;
@property(nonatomic,strong)NSString * skipType;//跳转 0：不跳 1：跳分享
@property(nonatomic,strong)NSString * status;//0时没完成任务，1 时完成任务
@property(nonatomic,strong)NSString * taskDesc;//描述
@property(nonatomic,strong)NSString * taskId;
@property(nonatomic,strong)NSString * taskName;//名称
@property(nonatomic,strong)NSString * type;
@property(nonatomic,strong)NSString * updateTime;
@property(nonatomic,strong)NSString * userId;

@end
@interface TaskInfoModel : NSObject
@property(nonatomic,strong)NSString * code ;//
@property(nonatomic,strong)NSString * compute ;//
@property(nonatomic,strong)NSString * count ;// 任务的发放份数 ,
@property(nonatomic,strong)NSString * createTime ;//
@property(nonatomic,strong)NSString * doneCount ;// 完成的份数 ,
@property(nonatomic,strong)NSString * doneNum ;//该用户已经完成的任务数量 ,
@property(nonatomic,strong)NSString * eachCoin ;//奖励的币的数量 ,
@property(nonatomic,strong)NSString * endTime ;//
@property(nonatomic,strong)NSString * failReason ;//
@property(nonatomic,strong)NSString * ID ;//
@property(nonatomic,strong)NSString * max ;//该用户最大可以完成的任务数量 ,
@property(nonatomic,strong)NSString * modifyTime ;//
@property(nonatomic,strong)NSString * name ;//
@property(nonatomic,strong)NSString * opNum ;// 分享几次才算完成一次任务 ,
@property(nonatomic,strong)NSString * partnerId ;//
@property(nonatomic,strong)NSString * status ;//
@property(nonatomic,strong)NSString * taskDesc;//
@property(nonatomic,strong)NSString * totalCoin ;// 任务的发放份数
@property(nonatomic,assign)CGFloat cellHeight ;// 任务的发放份数
//"id" = 1,
//"partnerId" = 10000,
//"count" = 15,
//"totalCoin" = 45,
//"max" = 1,
//"failReason" = 发的数量太少,
//"taskDesc" = 多多分享，领取糖果,
//"code" = HOC,
//"eachCoin" = 3,
//"opNum" = 3,
//"createTime" = 1527057673000,
//"doneNum" = 0,
//"modifyTime" = 1527057672000,
//"compute" = 0.5,
//"doneCount" = 1,
//"name" = 多多分享，领取糖果,
//"status" = 2,
@end

