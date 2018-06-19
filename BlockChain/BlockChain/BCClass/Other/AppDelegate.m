//
//  AppDelegate.m
//  BlockChain
//
//  Created by 蔡路飞 on 2018/5/21.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "AppDelegate.h"
#import "SATabBarController.h"
#import "DataBase.h"
#import <UMShare/UMShare.h>
#import <UserNotifications/UserNotifications.h>
#import <UMPush/UMessage.h>
#import <UMAnalytics/MobClickGameAnalytics.h>
#import "BCLoginController.h"
#import <UMCommon/UMCommon.h>//统计用框架

@interface AppDelegate ()<UNUserNotificationCenterDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] init];
    self.window.frame = [UIScreen mainScreen].bounds;
    self.window.backgroundColor = [UIColor whiteColor];
    
   [self.window makeKeyAndVisible];
    [LKControllerTool chooseRootViewController];
    

    [self configUSharePlatforms];//分享登陆
    [self uMessageNotificatiodidFinishLaunchingWithOptions:launchOptions];//友盟推送
    [self taskeEveryDay];
    //新增友盟统计
    [self addConfigUMCommon];
    return YES;
}
-(void)addConfigUMCommon{
    //输出可供调试参考的log信息.显示打印的日志，发布产品时必须设置为NO
    [UMConfigure setLogEnabled:NO];//设置打开日志
    //增加统计方法
    [UMConfigure initWithAppkey:@"5b0780deb27b0a78c6000016" channel:nil];
    NSString* deviceID =  [UMConfigure deviceIDForIntegration];
    if ([deviceID isKindOfClass:[NSString class]]) {
        NSLog(@"服务器端成功返回deviceID");
    }
    else{
        NSLog(@"服务器端还没有返回deviceID");
    }
}

-(void)taskeEveryDay{
    NSMutableDictionary * taskeEveryDayDict = diction;
    taskeEveryDayDict[@"token"] = loginToken;
    taskeEveryDayDict[@"taskId"] = @"1012";
    [YWRequestData taskeEveryDayDict:taskeEveryDayDict success:^(id responseObj) {
        
    }];
}

- (void)configUSharePlatforms
{
    [[UMSocialManager defaultManager] setUmSocialAppkey:@"5b0780deb27b0a78c6000016"];
    /* 设置微信的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:@"wxcf53e783eaf0ad8e" appSecret:@"7e2b7905372f75f77d68084d4ade2922" redirectURL:@"http://mobile.umeng.com/social"];
    /* 设置微信的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:@"1106856175" appSecret:@"JNy7nIlVr7EimLS3" redirectURL:@"http://mobile.umeng.com/social"];
}
#pragma mark-------------友盟推送--------
-(void)uMessageNotificatiodidFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Push组件基本功能配置
    UMessageRegisterEntity * entity = [[UMessageRegisterEntity alloc] init];
    //type是对推送的几个参数的选择，可以选择一个或者多个。默认是三个全部打开，即：声音，弹窗，角标
    entity.types = UMessageAuthorizationOptionBadge|UMessageAuthorizationOptionSound|UMessageAuthorizationOptionAlert;
    [UNUserNotificationCenter currentNotificationCenter].delegate=self;
    [UMessage registerForRemoteNotificationsWithLaunchOptions:launchOptions Entity:entity     completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if (granted) {
        }else{
        }
    }];
    
    
}


- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    // 1.2.7版本开始不需要用户再手动注册devicetoken，SDK会自动注册
    //[UMessage registerDeviceToken:deviceToken];
    NSString *devicToken = [[[[deviceToken description] stringByReplacingOccurrencesOfString: @"<" withString: @""]
                             stringByReplacingOccurrencesOfString: @">" withString: @""]
                            stringByReplacingOccurrencesOfString: @" " withString: @""];
    NSUserDefaults * userdevice = [NSUserDefaults standardUserDefaults];
    [userdevice setObject:devicToken forKey:userdevicToken];
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    dict[@"deviceId"] = devicToken;
    dict[@"token"] = loginToken;
    dict[@"type"] = @"1";
    LFLog(@"%@",devicToken);
    LFLog(@"%@",login.userId);
    [LFHttpTool post:PUSH_DEVICEID params:dict progress:^(id downloadProgress) {
        
    } success:^(id responseObj) {
    } failure:^(NSError *error) {
        
    }];
    
    
    
}



//iOS10以下使用这个方法接收通知
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    
    [UMessage didReceiveRemoteNotification:userInfo];
    
   
    
}



// 支持所有iOS系统
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
}





- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
}






//iOS10新增：处理前台收到通知的代理方法
-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler{
    NSDictionary * userInfo = notification.request.content.userInfo;
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {

        //应用处于前台时的远程推送接受
        [UMessage setAutoAlert:NO];
        //必须加这句代码
        [UMessage didReceiveRemoteNotification:userInfo];
        LFLog(@"%@",userInfo);
        LFLog(@"%@",[userInfo[@"custom"] mj_JSONObject ]);
        NSString * msg_id = [self currentTimeStr];
        SAMessageModel * messageModel = [SAMessageModel mj_objectWithKeyValues:[userInfo[@"aps"][@"custom"] mj_JSONObject ]];
        messageModel.bageVlue = @"0";
           messageModel.msg_id = msg_id;
        NSDate * data  =[NSDate date];
        NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
        fmt.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
        fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        NSString *dateStr = [fmt stringFromDate:data];
        messageModel.timeStr = dateStr;
        [[DataBase sharedDataBase] addMessage:messageModel];
        // [[NSNotificationCenter defaultCenter] postNotificationName:pushRefresh object:nil];
    }else{
        
        //应用处于前台时的本地推送接受
    }
    //当应用处于前台时提示设置，需要哪个可以设置哪一个
    completionHandler(UNNotificationPresentationOptionSound|UNNotificationPresentationOptionBadge|UNNotificationPresentationOptionAlert);
}
- (NSString *)currentTimeStr{
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];//获取当前时间0秒后的时间
    NSTimeInterval time=[date timeIntervalSince1970]*1000;// *1000 是精确到毫秒，不乘就是精确到秒
    NSString *timeString = [NSString stringWithFormat:@"%.0f", time];
    return timeString;
}

//iOS10新增：处理后台点击通知的代理方法
-(void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler{
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [UMessage setAutoAlert:NO];
        [UMessage didReceiveRemoteNotification:userInfo];
        
        //        [nvc pushViewController:orderListCtrl animated:YES];
        if ([UIApplication sharedApplication].applicationState == UIApplicationStateActive) {//应用处于前台
            
//            SATabBarController * tabar =  (SATabBarController * )self.window.rootViewController;
//            tabar.selectedIndex = 0;
        }else{
            LFLog(@"%@",userInfo);
               NSString * msg_id = [self currentTimeStr];
            SAMessageModel * messageModel = [SAMessageModel mj_objectWithKeyValues:[userInfo[@"aps"][@"custom"] mj_JSONObject ]];
            
            NSArray * allarray = [[DataBase sharedDataBase] getAllMessage];
            for ( SAMessageModel * messageMode  in allarray) {
                if ([messageMode. msg_id isEqualToString:messageModel.msg_id]) {
                    return;
                }
            }
           
            messageModel.bageVlue = @"0";
            messageModel.msg_id = msg_id;
            NSDate * data  =[NSDate date];
            NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
            fmt.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
            fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
            NSString *dateStr = [fmt stringFromDate:data];
            messageModel.timeStr = dateStr;
            [[DataBase sharedDataBase] addMessage:messageModel];
 
            
            
         
        }
        
        
        
        
        
        
        
        
    }else{
        //应用处于后台时的本地推送接受
        
    }
    
}





- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
