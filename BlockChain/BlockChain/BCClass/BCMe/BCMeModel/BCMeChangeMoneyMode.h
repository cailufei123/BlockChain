//
//  BCMeChangeMoneyMode.h
//  BlockChain
//
//  Created by Mac on 2018/5/24.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BCMeChangeMoneyMode : NSObject
@property(nonatomic,copy)NSString *dizhi;//地址
@property(nonatomic,copy)NSString *zhuanZhangPrice;//转账金额
@property(nonatomic,copy)NSString *tiXianPrice;//体现金额
@property(nonatomic,copy)NSString *beiZhu;//备注
@property(nonatomic,copy)NSString *code;//类型
@property(nonatomic,copy)NSString *ETH;
@property(nonatomic,copy)NSString *passWord;//密码


@end
