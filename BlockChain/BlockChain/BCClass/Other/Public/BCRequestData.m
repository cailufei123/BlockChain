//
//  BCRequestData.m
//  BlockChain
//
//  Created by 蔡路飞 on 2018/5/28.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCRequestData.h"

@implementation BCRequestData

#pragma mark - 糖果包详情-----

+(void)getUser_InfoDict:(NSDictionary *)dict success:(void (^) (id responseObject))sucess erorr:(void(^)(id error))erorr {
    
    [LFHttpTool post:USER_INFO params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        
        //LFLog(@"====%@",responseObj);
        [MBManager hideAlert];
        if ([responseObj[@"status"] isEqual:@(0)]) {
            sucess(responseObj);
            //[MBManager showBriefAlert:@"请求成功"];
        }else{
            erorr(responseObj);
            [MBManager showBriefAlert:responseObj[@"message"]];
        }
    } failure:^(NSError *error) {
        erorr(error);
        [MBManager showBriefAlert:@"网络错误"];
        [MBManager hideAlert];
    }];
}
+(void)get_Token_List_Dict:(NSDictionary *)dict success:(void (^) (id responseObject))sucess erorr:(void(^)(id error))erorr {
    
    [LFHttpTool post:MY_TOKEN_LIST params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        
        //[responseObj writeToFile:@"/Users/mac/Desktop/plist/abc.plist" atomically:YES];
        LFLog(@"==%@",responseObj);
        [MBManager hideAlert];
        if ([responseObj[@"status"] isEqual:@(0)]) {
            sucess(responseObj);
            //[MBManager showBriefAlert:@"请求成功"];
        }else{
            erorr(responseObj);
            [MBManager showBriefAlert:responseObj[@"message"]];
        }
    } failure:^(NSError *error) {
        erorr(error);
        [MBManager showBriefAlert:@"网络错误"];
        [MBManager hideAlert];
    }];
}
+(void)get_token_Detail_Dict:(NSDictionary *)dict success:(void (^) (id responseObject))sucess erorr:(void(^)(id error))erorr {
    
    [LFHttpTool post:TOKEN_DETAIL params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        
        [responseObj writeToFile:@"/Users/mac/Desktop/plist/aaa.plist" atomically:YES];
        LFLog(@"==%@",responseObj);
        [MBManager hideAlert];
        if ([responseObj[@"status"] isEqual:@(0)]) {
            sucess(responseObj);
            //[MBManager showBriefAlert:@"请求成功"];
        }else{
            erorr(responseObj);
            [MBManager showBriefAlert:responseObj[@"message"]];
        }
    } failure:^(NSError *error) {
        erorr(error);
        [MBManager showBriefAlert:@"网络错误"];
        [MBManager hideAlert];
    }];
}
//糖果总数
+(void)get_candy_List_Dict:(NSDictionary *)dict success:(void (^) (id responseObject))sucess erorr:(void(^)(id error))erorr {
    
    [LFHttpTool post:GET_CANDY_HISTORY params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        
        //[responseObj writeToFile:@"/Users/mac/Desktop/plist/kkk.plist" atomically:YES];
        LFLog(@"==%@",responseObj);
        [MBManager hideAlert];
        if ([responseObj[@"status"] isEqual:@(0)]) {
            sucess(responseObj);
            //[MBManager showBriefAlert:@"请求成功"];
        }else{
            erorr(responseObj);
            [MBManager showBriefAlert:responseObj[@"message"]];
        }
    } failure:^(NSError *error) {
        erorr(error);
        [MBManager showBriefAlert:@"网络错误"];
        [MBManager hideAlert];
    }];
}



@end
