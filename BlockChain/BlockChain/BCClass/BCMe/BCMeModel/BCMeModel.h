//
//  BCMeModel.h
//  BlockChain
//
//  Created by 吴博怡 on 2018/5/22.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BCMeModel : NSObject

//"status" = 0,
//"message" = ok,
//"data" = {
//    "isAuthed" = 1,
//    "realName" = 李白,
//    "mobile" = 18519059080,
//    "maxTask" = 1,
//    "isPayPassSet" = 0,
//    "userId" = 100121138,
//    "token" = 64d6a03fd25ff6ad17fadcf0f41e8703,
//    "icon" = ,
//    "compute" = 5,
//    "level" = 1,
//    "idNo" = 110,
//    "isFeng" = 0,
//    "lastInviteCount" = 10,
//    "authStatus" = 2,
//    "name" = 无与伦比,
//    "shareCode" = jhpmx54y,


@property(nonatomic,strong)NSString * isAuthed;
@property(nonatomic,strong)NSString * realName;//真实名字
@property(nonatomic,strong)NSString * mobile;//电话
@property(nonatomic,strong)NSString * maxTask;
@property(nonatomic,strong)NSString * isPayPassSet;
@property(nonatomic,strong)NSString * userId;
@property(nonatomic,strong)NSString * token;
@property(nonatomic,strong)NSString * icon;
@property(nonatomic,strong)NSString * compute;
@property(nonatomic,strong)NSString * level;
@property(nonatomic,strong)NSString * idNo;
@property(nonatomic,strong)NSString * isFeng;
@property(nonatomic,strong)NSString * lastInviteCount;
@property(nonatomic,strong)NSString * authStatus;
@property(nonatomic,strong)NSString * name;//名字
@property(nonatomic,strong)NSString * shareCode;//code分享码

@property(nonatomic,strong)NSString * coin;
@property(nonatomic,strong)NSArray * list;
@property(nonatomic,strong)NSString * logo;


@end
