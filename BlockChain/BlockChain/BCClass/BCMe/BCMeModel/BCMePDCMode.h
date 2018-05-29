//
//  BCMePDCMode.h
//  BlockChain
//
//  Created by Mac on 2018/5/28.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BCMePDCMode : NSObject

//"id" = 186,
//"opType" = 7,
//"partnerId" = 10010,
//"code" = DDC,
//"createTime" = 2018-05-28 15:53:44.0,
//"price" = 2,
//"userId" = 100121138,
//"ethService" = 0,
//"coinType" = 2,
//"remark" = <null>,
//"relatedId" = 10,
//"name" = 糖果,

@property(nonatomic,strong)NSString * ID;
@property(nonatomic,strong)NSString * opType;
@property(nonatomic,strong)NSString * partnerId;
@property(nonatomic,strong)NSString * code;
@property(nonatomic,strong)NSString * createTime;
@property(nonatomic,strong)NSString * price;
@property(nonatomic,strong)NSString * userId;
@property(nonatomic,strong)NSString * ethService;
@property(nonatomic,strong)NSString * coinType;
@property(nonatomic,strong)NSString * remark;
@property(nonatomic,strong)NSString * relatedId;
@property(nonatomic,strong)NSString * name;




@end
