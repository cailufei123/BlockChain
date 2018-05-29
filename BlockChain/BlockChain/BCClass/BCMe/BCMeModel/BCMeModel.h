//
//  BCMeModel.h
//  BlockChain
//
//  Created by 吴博怡 on 2018/5/22.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>

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


@property(nonatomic,copy)NSString * isAuthed;
@property(nonatomic,copy)NSString * realName;//真实名字
@property(nonatomic,copy)NSString * mobile;//电话
@property(nonatomic,copy)NSString * maxTask;
@property(nonatomic,copy)NSString * isPayPassSet;
@property(nonatomic,copy)NSString * userId;
@property(nonatomic,copy)NSString * token;
@property(nonatomic,copy)NSString * icon;
@property(nonatomic,copy)NSString * compute;
@property(nonatomic,copy)NSString * level;
@property(nonatomic,copy)NSString * idNo;
@property(nonatomic,copy)NSString * isFeng;
@property(nonatomic,copy)NSString * lastInviteCount;
@property(nonatomic,copy)NSString * authStatus;
@property(nonatomic,copy)NSString * name;//名字
@property(nonatomic,copy)NSString * shareCode;//code分享码

@property(nonatomic,copy)NSString * coin;
@property(nonatomic,strong)NSArray * list;
@property(nonatomic,copy)NSString * logo;

@property(nonatomic,strong)UIImage *Qimage;

@end
