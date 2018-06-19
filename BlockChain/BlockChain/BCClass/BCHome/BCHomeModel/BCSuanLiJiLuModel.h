//
//  BCSuanLiJiLuModel.h
//  BlockChain
//
//  Created by Mac on 2018/5/25.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BCSuanLiJiLuModel : NSObject
//"data" = {
//    "compute" = 70,
//    "computeLogs" = 5 (
//                       {
//                           "userId" = 100121138,
//                           "relatedId" = 1012,
//                           "remark" = 每日登录,
//                           "id" = 116,
//                           "compute" = 5,
//                           "type" = 2,
//                           "createTime" = 2018-05-31 10:02:19.0,
//                       },
//                       {
//                           "userId" = 100121138,
//                           "relatedId" = 1012,
//                           "remark" = 每日登录,
//                           "id" = 63,
//                           "compute" = 5,
//                           "type" = 2,
//                           "createTime" = 2018-05-30 09:47:54.0,
//                       },

@property(nonatomic,copy)NSString *compute;
@property(nonatomic,copy)NSArray *computeLogs;

@property(nonatomic,assign)CGFloat UpBigHeight;//高度

@end

@interface BCSuanLiJiLuListModel : NSObject


@property(nonatomic,copy)NSString *userId;
@property(nonatomic,copy)NSString *relatedId;
@property(nonatomic,copy)NSString *remark;
@property(nonatomic,copy)NSString *ID;
@property(nonatomic,copy)NSString *compute;
@property(nonatomic,copy)NSString *type;
@property(nonatomic,copy)NSString *createTime;


@end
