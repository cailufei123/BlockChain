//
//  BCRequestData.h
//  BlockChain
//
//  Created by 蔡路飞 on 2018/5/28.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//


#import <Foundation/Foundation.h>
@interface BCRequestData : NSObject

//获取用户信息
+(void)getUser_InfoDict:(NSDictionary *)dict success:(void (^) (id responseObject))sucess erorr:(void(^)(id error))erorr;
//查询消费记录
+(void)get_Token_List_Dict:(NSDictionary *)dict success:(void (^) (id responseObject))sucess erorr:(void(^)(id error))erorr;
//糖果详情
+(void)get_candy_Detail_Dict:(NSDictionary *)dict success:(void (^) (id responseObject))sucess erorr:(void(^)(id error))erorr;

@end

