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

+ (void)getRequestTangGuoBaoDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{

    [LFHttpTool post:USER_LOGIN params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        LFLog(@"%@",responseObj);
        [MBManager hideAlert];
        if ([responseObj[@"status"] isEqual:@(0)]) {
            sucess(responseObj);
            
            [MBManager showBriefAlert:@"登录成功"];
        }else{
            [MBManager showBriefAlert:responseObj[@"message"]];}
    } failure:^(NSError *error) {
        [MBManager showBriefAlert:@"网络错误"];
        [MBManager hideAlert];
    }];
}

@end
