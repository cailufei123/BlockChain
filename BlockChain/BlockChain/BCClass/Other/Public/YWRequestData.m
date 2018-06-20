//
//  YWRequestData.m
//  PunchTopMasters
//
//  Created by 蔡路飞 on 2018/3/28.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "YWRequestData.h"

@implementation YWRequestData


+ (void)registUserSendcodeDict:(NSDictionary *)dict success:(void (^) (id responseObject))sucess{

    [LFHttpTool post:GET_VCODE params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        //LFLog(@"%@",responseObj);

          [MBManager hideAlert];
         sucess(responseObj);
        if ([responseObj[@"status"] isEqual:@(0)]) {
          
             [MBManager showBriefAlert:@"验证码已发动注意查收"];
        }else{
            [MBManager showBriefAlert:responseObj[@"message"]];}
    } failure:^(NSError *error) {
        [MBManager showBriefAlert:@"网络错误"];
         [MBManager hideAlert];
    }];
}
#pragma mark - 注册用户-----
+ (void)registUserDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
    [LFHttpTool post:USER_REGISTER params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
          //LFLog(@"%@",responseObj);
          [MBManager hideAlert];
        if ([responseObj[@"status"] isEqual:@(0)]) {
            sucess(responseObj);
            [MBManager showBriefAlert:@"注册成功"];
        }else{
            [MBManager showBriefAlert:responseObj[@"message"]];}
    } failure:^(NSError *error) {
        [MBManager showBriefAlert:@"网络错误"];
         [MBManager hideAlert];
    }];
}

#pragma mark - 用户登录-----
+ (void)userLoginDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{

    [LFHttpTool post:USER_LOGIN params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        //LFLog(@"%@",responseObj);
          [MBManager hideAlert];
        if ([responseObj[@"status"] isEqual:@(0)]) {
            sucess(responseObj);
           
            [MBManager showBriefAlert:@"登录成功"];
        }else{
            [MBManager showBriefAlert:responseObj[@"message"]];}
    } failure:^(NSError *error) {
//        [MBManager showBriefAlert:@"网络错误"];
         [MBManager hideAlert];
    }];
}

// - 首页糖果记录-----
+ (void)homeCandyListDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess erorr:(void(^)(id error))erorr{

    NSLog(@"%@",CANDY_LIST);
    [LFHttpTool post:CANDY_LIST params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        //LFLog(@"%@",responseObj);
        [MBManager hideAlert];
        if ([responseObj[@"status"] isEqual:@(0)]) {
            sucess(responseObj);
        }else{
            [MBManager showBriefAlert:responseObj[@"message"]];}
    } failure:^(NSError *error) {
           erorr(error);
        [MBManager showBriefAlert:@"网络错误"];
        [MBManager hideAlert];
    }];
}

// - 领取糖果-----
+ (void)candycainDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess yiLingQu:(void (^) (id message))yiLingQu{
    [LFHttpTool post:CANDY_GAIN params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        //LFLog(@"%@",responseObj);
        [MBManager hideAlert];
        if ([responseObj[@"status"] isEqual:@(1)]) {
            sucess(responseObj);
        }else if([responseObj[@"status"] isEqual:@(101)]){
            yiLingQu(responseObj[@"message"]);//已领取过糖果
        }else{
            [MBManager showBriefAlert:responseObj[@"message"]];
        }
    } failure:^(NSError *error) {
        [MBManager showBriefAlert:@"网络错误"];
        [MBManager hideAlert];
    }];
}
// - 实名认证-----
+ (void)realNameIDDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
    [LFHttpTool post:AUTH_CARDID params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        //LFLog(@"%@",responseObj);
        [MBManager hideAlert];
        if ([responseObj[@"status"] isEqual:@(0)]) {
            sucess(responseObj);
            
            
        }else{
            [MBManager showBriefAlert:responseObj[@"message"]];}
    } failure:^(NSError *error) {
        [MBManager showBriefAlert:@"网络错误"];
        [MBManager hideAlert];
    }];
}

// -首页bamner -----
+ (void)homePageDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
    [LFHttpTool post:HOME_PAGE params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        //LFLog(@"%@",responseObj);
        [MBManager hideAlert];
        if ([responseObj[@"status"] isEqual:@(0)]) {
            sucess(responseObj);
            
            
        }else{
            [MBManager showBriefAlert:responseObj[@"message"]];}
    } failure:^(NSError *error) {
       
        [MBManager hideAlert];
    }];
}
// 中奖人列表 -----
+ (void)winPeopleDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
    [LFHttpTool post:PRODUCT_WINS params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
//        LFLog(@"%@",responseObj);
        [MBManager hideAlert];
        if ([responseObj[@"status"] isEqual:@(0)]) {
            sucess(responseObj);
            
            
        }else{
            [MBManager showBriefAlert:responseObj[@"message"]];}
    } failure:^(NSError *error) {
//        [MBManager showBriefAlert:@"网络错误"];
        [MBManager hideAlert];
    }];
}
// 领取紫钻的接口-----
+ (void)gainPurpleStoneDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
    [LFHttpTool post:GAIN_DIAMOND params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        //LFLog(@"%@",responseObj);
        [MBManager hideAlert];
        if ([responseObj[@"status"] isEqual:@(0)]) {
            sucess(responseObj);
            
            
        }else{
            [MBManager showBriefAlert:responseObj[@"desc"]];}
    } failure:^(NSError *error) {
        [MBManager showBriefAlert:@"网络错误"];
        [MBManager hideAlert];
    }];
}
 //算力 和记录
+ (void)computePowerDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
    [LFHttpTool post:COMPUTE_POWER params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        //LFLog(@"%@",responseObj);
        [MBManager hideAlert];
        if ([responseObj[@"status"] isEqual:@(0)]) {
            sucess(responseObj);
            
            
        }else{
            [MBManager showBriefAlert:responseObj[@"message"]];}
    } failure:^(NSError *error) {
        [MBManager showBriefAlert:@"网络错误"];
        [MBManager hideAlert];
    }];
}
//原力任务列表
+ (void)userTaskListDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
    [LFHttpTool post:USER_TASK_LIST params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        //LFLog(@"%@",responseObj);
        [MBManager hideAlert];
        if ([responseObj[@"status"] isEqual:@(0)]) {
            sucess(responseObj);
            
            
        }else{
            [MBManager showBriefAlert:responseObj[@"message"]];}
    } failure:^(NSError *error) {
        [MBManager showBriefAlert:@"网络错误"];
        [MBManager hideAlert];
    }];
}
//普通任务列表
+ (void)taskListDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
    [LFHttpTool post:TASK_LIST params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        //LFLog(@"%@",responseObj);
        [MBManager hideAlert];
        if ([responseObj[@"status"] isEqual:@(0)]) {
            sucess(responseObj);
            
            
        }else{
            [MBManager showBriefAlert:responseObj[@"message"]];}
    } failure:^(NSError *error) {
        [MBManager showBriefAlert:@"网络错误"];
        [MBManager hideAlert];
    }];
}
// 获取设置密码验证码

+ (void)getpswdVcodeDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
    [LFHttpTool post:GET_PWD_VCODE params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        //LFLog(@"%@",responseObj);
        [MBManager hideAlert];
        if ([responseObj[@"status"] isEqual:@(0)]) {
            sucess(responseObj);
            
            
        }else{
            [MBManager showBriefAlert:responseObj[@"message"]];}
    } failure:^(NSError *error) {
        [MBManager showBriefAlert:@"网络错误"];
        [MBManager hideAlert];
    }];
}

// 重置密码

+ (void)forgetResetDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
    [LFHttpTool post:FORGET_RESET params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        //LFLog(@"%@",responseObj);
        [MBManager hideAlert];
        if ([responseObj[@"status"] isEqual:@(0)]) {
            sucess(responseObj);
            
            
        }else{
            [MBManager showBriefAlert:responseObj[@"message"]];}
    } failure:^(NSError *error) {
        [MBManager showBriefAlert:@"网络错误"];
        [MBManager hideAlert];
    }];
}
// //原力任务上报（每日app）

+ (void)taskeEveryDayDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
    [LFHttpTool post:USER_TASK_REPORT_EVERYDAY params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        //LFLog(@"%@",responseObj);
        [MBManager hideAlert];
        if ([responseObj[@"status"] isEqual:@(0)]) {
            sucess(responseObj);
            
            
        }else{
//            [MBManager showBriefAlert:responseObj[@"message"]];
            
        }
    } failure:^(NSError *error) {
      
        [MBManager hideAlert];
    }];
}
//普通任务详情
+ (void)taskeDetailDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
    [LFHttpTool post:TASK_DETAIL params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        //LFLog(@"%@",responseObj);
        [MBManager hideAlert];
        if ([responseObj[@"status"] isEqual:@(0)]) {
            sucess(responseObj);
            
            
        }else{
            [MBManager showBriefAlert:responseObj[@"message"]];}
    } failure:^(NSError *error) {
        
        [MBManager hideAlert];
    }];
}
//普通任务上报（做了一次任务）
+ (void)taskeDoonceDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
    [LFHttpTool post:TASK_DO_ONCE params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        //LFLog(@"%@",responseObj);
        [MBManager hideAlert];
        if ([responseObj[@"status"] isEqual:@(0)]) {
            sucess(responseObj);
            
            
        }else{
            [MBManager showBriefAlert:responseObj[@"message"]];}
    } failure:^(NSError *error) {
        
        [MBManager hideAlert];
    }];
}
////糖果详情
+ (void)candy_detail_Dict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess erorr:(void(^)(id error))erorr{
    [LFHttpTool post:CANDY_DETAIL params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        //LFLog(@"%@",responseObj);
        [MBManager hideAlert];
        if ([responseObj[@"status"] isEqual:@(0)]) {
            sucess(responseObj);
            

        }else{
            [MBManager showBriefAlert:responseObj[@"message"]];}
    } failure:^(NSError *error) {
        erorr(error);
        [MBManager hideAlert];
    }];
}
// 更新
+ (void)getplayDict:(NSDictionary *)dict success:(void (^) (id responseObj))sucess{
    [LFHttpTool post:GET_LEPLAY params:dict progress:^(id downloadProgress) {
    } success:^(id responseObj) {
        //LFLog(@"%@",responseObj);
        [MBManager hideAlert];
        if ([responseObj[@"status"] isEqual:@(0)]) {
            sucess(responseObj);
        }else{
            [MBManager showBriefAlert:responseObj[@"message"]];}
    } failure:^(NSError *error) {
        
        [MBManager hideAlert];
    }];
}


@end
