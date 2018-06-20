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
       LFLog(@"====%@",USER_INFO);
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
        //NSLog(@"%@",MY_TOKEN_LIST);
        
        //[responseObj writeToFile:@"/Users/mac/Desktop/plist/abc.plist" atomically:YES];
        //LFLog(@"==%@",responseObj);
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
    //NSLog(@"%@",TOKEN_DETAIL);
    [LFHttpTool post:TOKEN_DETAIL params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        //[responseObj writeToFile:@"/Users/mac/Desktop/plist/aaa.plist" atomically:YES];
        //LFLog(@"==%@",responseObj);
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

//获取剩额
+(void)get_yuEr_Dict:(NSDictionary *)dict success:(void (^) (id responseObject))sucess passwordError:(void (^) (NSString * message))message noYuEr:(void (^) (NSString * yuer))noYuEr erorr:(void(^)(id error))erorr {
    
    [LFHttpTool post:CASH_COIN params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        //[responseObj writeToFile:@"/Users/mac/Desktop/plist/kkk.plist" atomically:YES];
        [MBManager hideAlert];
        if ([responseObj[@"status"] isEqual:@(0)]) {
            if ([responseObj[@"message"] containsString:@"密码错误"]) {
                [MBManager showBriefAlert:@"密码错误,请重新输入"];
                message(responseObj[@"message"]);
            }else if(([responseObj[@"message"] containsString:@"余额不够"])){
                noYuEr(responseObj[@"message"]);
            }else{//成功
                sucess(responseObj);//成功
                [MBManager showBriefAlert:@"转账成功"];
            }
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
//算力记录
+(void)get_suanLiJiLu_Dict:(NSDictionary *)dict success:(void (^) (id responseObject))sucess erorr:(void(^)(id error))erorr {
    
    [LFHttpTool post:COMPUTE_POWER params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        
        //[responseObj writeToFile:@"/Users/mac/Desktop/plist/kkk.plist" atomically:YES];
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
//等到分享页下载地址
+(void)get_DownUrl_Dict:(NSDictionary *)dict success:(void (^) (id responseObject))sucess erorr:(void(^)(id error))erorr {
    
    [LFHttpTool post:INVITE_PARAMS params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        
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
