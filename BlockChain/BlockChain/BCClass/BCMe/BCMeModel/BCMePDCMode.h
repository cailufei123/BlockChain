//
//  BCMePDCMode.h
//  BlockChain
//
//  Created by Mac on 2018/5/28.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BCMePDCUpMode.h"

@interface BCMePDCMode : NSObject
//"status" = 0,
//"message" = ok,
//"data" = {
//    "partner" = {
//        "projectName" = 点点币,
//        "brief" = DDcoin，有人称作“点点币”，诞生于2013年12月8日，基于Scrypt算法，是国际上用户数仅次于比特币的第二大虚拟货币 [1]  。
//        数字货币是民间发起的全球通用货币，不属于某个国家，是属于全人类，具有全球转帐速度快的优点，如几秒内就可以把钱由国内汇到美国，且费用低廉，并且总量不会像法币一样随意增发，总量相对稳定。,
//        "partnerId" = 10010,
//        "mobile" = 10000000007,
//        "contact" = 寂寞,
//        "slogan" = 点点用户数仅次于比特币的第二大虚拟货币,
//        "code" = DDC,
//        "price" = 8,
//        "icon" = https://gss3.bdstatic.com/7Po3dSag_xI4khGkpoWK1HF6hhy/baike/w%3D268%3Bg%3D0/sign=7496d27dcdfc1e17fdbf8b3772ab913e/d4628535e5dde711a7d0269da5efce1b9d16615e.jpg,
//        "createTime" = 1527047537000,
//        "tel" = 10000000007,
//        "site" = www.xoin.com,
//        "email" = 8@163.cn,
//        "name" = jimo,
//        "pubCount" = 10000000,
//    },
//    "ucl" = 1 (
//               {
//                   "id" = 186,
//                   "opType" = 7,
//                   "partnerId" = 10010,
//                   "code" = DDC,
//                   "createTime" = 2018-05-28 15:53:44.0,
//                   "price" = 2,
//                   "userId" = 100121138,
//                   "ethService" = 0,
//                   "coinType" = 2,
//                   "remark" = <null>,
//                   "relatedId" = 10,
//                   "name" = 糖果,
//               },
//               ),
//    "uci" = {
//        "userId" = 100121138,
//        "id" = 46,
//        "code" = DDC,
//        "partnerId" = 10010,
//        "coin" = 2,
//        "rmb" = 80000,
//        "type" = 2,
//        "icon" = <null>,
//        "ethCoinRatio" = 8,
//    },
//},
//}

@property(nonatomic,strong)BCMePDCUpMode * partner;
@property(nonatomic,strong)NSArray * ucl;
@property(nonatomic,strong)BCMePDCUpMode * uci;

@property(nonatomic,assign)CGFloat upViewHeight;

@end
