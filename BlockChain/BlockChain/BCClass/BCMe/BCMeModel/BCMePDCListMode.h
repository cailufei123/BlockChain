//
//  BCMePDCListMode.h
//  BlockChain
//
//  Created by Mac on 2018/5/23.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BCMePDCListMode : NSObject



////"id" = 186,
////"opType" = 7,
////"partnerId" = 10010,
////"code" = DDC,
////"createTime" = 2018-05-28 15:53:44.0,
////"price" = 2,
////"userId" = 100121138,
////"ethService" = 0,
////"coinType" = 2,
////"remark" = <null>,
////"relatedId" = 10,
////"name" = 糖果,
//
@property(nonatomic,copy)NSString * ID;
@property(nonatomic,copy)NSString * opType;
@property(nonatomic,copy)NSString * partnerId;
@property(nonatomic,copy)NSString * code;
@property(nonatomic,copy)NSString * createTime;
@property(nonatomic,copy)NSString * price;
@property(nonatomic,copy)NSString * userId;
@property(nonatomic,copy)NSString * ethService;
@property(nonatomic,copy)NSString * coinType;
@property(nonatomic,copy)NSString * remark;
@property(nonatomic,copy)NSString * relatedId;
@property(nonatomic,copy)NSString * name;





@end
