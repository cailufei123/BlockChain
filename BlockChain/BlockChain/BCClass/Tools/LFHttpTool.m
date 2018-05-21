//
//  LFHttpTool.m
//  LF百思不得姐
//
//  Created by 蔡路飞 on 16/6/17.
//  Copyright © 2016年 pecoo. All rights reserved.
//

#import "LFHttpTool.h"
#import "AFNetworking.h"
#import "AFHTTPSessionManager.h"
#import <UIKit/UIKitDefines.h>
@implementation LFHttpTool
+ (void)get:(NSString *)url params:(NSDictionary *)params progress:(void (^)(id))progress success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    // 1.获得请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
       // 2.发送GET请求
    [mgr GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        if (downloadProgress) {
             progress(downloadProgress);
        }
       
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
             success(responseObject);
        }

       
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
           failure(error);
        }
        

    }];
    
}

+ (void)post:(NSString *)url params:(NSDictionary *)params progress:(void (^)(id))progress success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    // 1.获得请求管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    NSString *idfv = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
//    NSString *uuid = [[NSUUID UUID] UUIDString];
    // 开始设置请求头
//    NSString *oldVersion = [LFHttpTool getAppVersion];
    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
    NSString *minorVersion = [infoDict objectForKey:@"CFBundleShortVersionString"];
    NSString * oldVersionNmb = [minorVersion stringByReplacingOccurrencesOfString:@"." withString:@""];
    

//    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [manager.requestSerializer setValue:idfv forHTTPHeaderField:@"uid"];
//    [manager.requestSerializer setValue:oldVersionNmb forHTTPHeaderField:@"vc"];
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    CFShow((__bridge CFTypeRef)(infoDictionary));
    // app名称
//    NSString *app_Name = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    // app版本
//    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
//    // app build版本
//    NSString *app_build = [infoDictionary objectForKey:@"CFBundleVersion"];
//    
//    NSLog(@"当前应用版本号码fd111111：%@",app_Name);
//    NSLog(@"当前应用版本号码33333333ff3：%@",app_Version);
//
//     NSLog(@"当前应用版本号码33ffvc3333333：%@",app_build);
//    //手机序列号
////    NSString* identifierNumber = [[UIDevice currentDevice] uniqueIdentifier];
////    NSLog(@"手机序列号: %@",identifierNumber);
//    //手机别名： 用户定义的名称
//    NSString* userPhoneName = [[UIDevice currentDevice] name];
//    NSLog(@"手机别名: %@", userPhoneName);
//    //设备名称
//    NSString* deviceName = [[UIDevice currentDevice] systemName];
//    NSLog(@"设备名称: %@",deviceName );
//    //手机系统版本
//    NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
//    NSLog(@"手机系统版本: %@", phoneVersion);
//    //手机型号
//    NSString* phoneModel = [[UIDevice currentDevice] model];
//    NSLog(@"手机型号: %@",phoneModel );
//    //地方型号  （国际化区域名称）
//    NSString* localPhoneModel = [[UIDevice currentDevice] localizedModel];
//    NSLog(@"国际化区域名称: %@",localPhoneModel );
//    
////    NSDictionary * infoDiction = [[NSBundle mainBundle] infoDictionary];
//    // 当前应用名称
//    NSString *appCurName = [infoDictionary objectForKey:@"CFBundleDisplayName"];
//    NSLog(@"当前应用名称：%@",appCurName);
//    // 当前应用软件版本  比如：1.0.1
//    NSString *appCurVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
//    NSLog(@"当前应用软件版本:%@",appCurVersion);
//    // 当前应用版本号码   int类型
//    NSString *appCurVersionNum = [infoDictionary objectForKey:@"CFBundleVersion"];
//    NSLog(@"当前应用版本号码：%@",appCurVersionNum);
//    
//   
//    //广告
////      NSString *adId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
//    NSLog(@"当前应用版本号码1111111：%@",idfv);
//    NSLog(@"当前应用版本号码333333333：%@",uuid);
//    // uid是每个用户对应的ID  cipherText是密码
//    NSString * part1 = [NSString stringWithFormat:@"%@:%@",@"222",@"sss"];
//    // 通过 ID ：密码 的格式，用Basic 的方式拼接成字符串
//  NSString * authorization = [NSString stringWithFormat:@"Basic %@",[part1 base64Encode]];
    // 设置Authorization的方法设置header
//    [manager.requestSerializer setValue:authorization forHTTPHeaderField:@"part1"];
    // 或者直接调用AF的方法进行设置      // 2.发送GET请求
    [manager POST:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        if (downloadProgress) {
            progress(downloadProgress);
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (error) {
            failure(error);
        }

    }];
}

//
//- (void)viewDidLoadxxx {
//   
//    // Do any additional setup after loading the view, typically from a nib.
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager POST:@"http://itunes.apple.com/lookup?id=414478124" parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
//        NSArray *array = responseObject[@"results"];
//        NSDictionary *dict = [array lastObject];
//        NSLog(@"当前版本为：%@", dict[@"version"]);
//    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
//        [SVProgressHUD showErrorWithStatus:@"请求失败！" ];
//    }];
//}



@end
