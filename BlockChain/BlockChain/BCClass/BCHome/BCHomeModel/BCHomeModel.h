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
