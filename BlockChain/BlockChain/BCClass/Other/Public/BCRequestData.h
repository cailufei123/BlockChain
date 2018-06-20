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
+(void)get_token_Detail_Dict:(NSDictionary *)dict success:(void (^) (id responseObject))sucess erorr:(void(^)(id error))erorr;
//查询消费记录
+(void)get_candy_List_Dict:(NSDictionary *)dict success:(void (^) (id responseObject))sucess erorr:(void(^)(id error))erorr;
//获取剩额
+(void)get_yuEr_Dict:(NSDictionary *)dict success:(void (^) (id responseObject))sucess passwordError:(void (^) (NSString * message))message noYuEr:(void (^) (NSString * yuer))noYuEr erorr:(void(^)(id error))erorr;
//算力记录
+(void)get_suanLiJiLu_Dict:(NSDictionary *)dict success:(void (^) (id responseObject))sucess erorr:(void(^)(id error))erorr;
//等到分享页面的下载接口
+(void)get_DownUrl_Dict:(NSDictionary *)dict success:(void (^) (id responseObject))sucess erorr:(void(^)(id error))erorr;


@end

