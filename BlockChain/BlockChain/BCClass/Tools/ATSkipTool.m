//
//  ATSkipTool.m
//  Auction
//
//  Created by 蔡路飞 on 2017/11/3.
//  Copyright © 2017年 Cailufei. All rights reserved.
//

#import "ATSkipTool.h"

#import "BCLoginController.h"
static id _instance;
@interface ATSkipTool()<UIWebViewDelegate>

@property(nonatomic,strong)UIViewController * controller;

@end
@implementation ATSkipTool
+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}






- (void)loginAction:(UIViewController * )controller{
    BCLoginController * registVc = [[BCLoginController alloc] init];
    SALoginRegistNavController *naVc = [[SALoginRegistNavController alloc] initWithRootViewController:registVc];
    [controller presentViewController:naVc animated:YES completion:nil];
    return;
    
}



-(void)pushToViewControllerWithClassName:(NSString *)className ViewController:(UIViewController * )controller {
    if (className != nil) {
        id myObj = [[NSClassFromString(className) alloc] init];
        @try {
            [controller.navigationController pushViewController:myObj animated:YES];
        }
        @catch (NSException *exception) {
            // 捕获到的异常exception
        }
        @finally {
            // 结果处理
        }
    }
}

-(void)shareObjectWithTitle:(NSString *)title
                      descr:(NSString *)descr
                  thumImage:(id)thumImage
                 webpageUrl:(NSString *)Url
currentViewController:(id)currentViewController
{
//    Domain=UMSocialPlatformErrorDomain Code=2003 "(null)" UserInfo={message=传入的参数currentViewController应该是nil或者是继承UIViewController的子类}*********

    //配置上面需求的参数
    [UMSocialUIManager setPreDefinePlatforms:@[@(UMSocialPlatformType_QQ),@(UMSocialPlatformType_WechatSession),@(UMSocialPlatformType_WechatTimeLine),]];
    [UMSocialShareUIConfig shareInstance].shareTitleViewConfig.isShow = YES;
    [UMSocialShareUIConfig shareInstance].sharePageGroupViewConfig.sharePageGroupViewPostionType = UMSocialSharePageGroupViewPositionType_Bottom;
    [UMSocialShareUIConfig shareInstance].sharePageScrollViewConfig.shareScrollViewPageMaxRowCountForLandscapeAndBottom = 1;
    [UMSocialShareUIConfig shareInstance].sharePageScrollViewConfig.shareScrollViewPageMaxColumnCountForLandscapeAndBottom = 1;
    [UMSocialShareUIConfig shareInstance].sharePageScrollViewConfig.shareScrollViewPageMaxRowCountForPortraitAndBottom = 1;
    [UMSocialShareUIConfig shareInstance].sharePageScrollViewConfig.shareScrollViewPageMaxColumnCountForLandscapeAndBottom = 3;
    [UMSocialShareUIConfig shareInstance].sharePageScrollViewConfig.shareScrollViewPageMaxColumnCountForPortraitAndMid = 3;
    [UMSocialShareUIConfig shareInstance].sharePageScrollViewConfig.shareScrollViewPageMaxColumnCountForPortraitAndBottom = 3;
    [UMSocialShareUIConfig shareInstance].sharePageScrollViewConfig.shareScrollViewPageMaxColumnCountForLandscapeAndMid = 3;
    
    //    [UMSocialShareUIConfig shareInstance].shareCancelControlConfig.isShow = NO;
    //    [UMSocialShareUIConfig shareInstance].sharePageScrollViewConfig.shareScrollViewBackgroundColor = [UIColor redColor];
    //    //每页的背景颜色为黄色
    //    [UMSocialShareUIConfig shareInstance].sharePageScrollViewConfig.shareScrollViewPageBGColor = [UIColor yellowColor];
    //去掉毛玻璃效果
    [UMSocialShareUIConfig shareInstance].shareContainerConfig.isShareContainerHaveGradient = NO;
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        // 根据获取的platformType确定所选平台进行下一步操作
        [self shareImageAndTextToPlatformType:platformType shareObjectWithTitle:title descr:descr thumImage:thumImage webpageUrl:Url currentViewController:currentViewController];
    }];
    
    
}
- (void)shareImageAndTextToPlatformType:(UMSocialPlatformType)platformType
                                   shareObjectWithTitle:(NSString *)title
                                   descr:(NSString *)descr
                                    thumImage:(id)thumImage
                                 webpageUrl:(NSString *)Url
             currentViewController:(id)currentViewController
{
    
    UIImage *image = nil;
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
  
   
    NSDictionary *infoPlist = [[NSBundle mainBundle] infoDictionary];
    NSString *icon = [[infoPlist valueForKeyPath:@"CFBundleIcons.CFBundlePrimaryIcon.CFBundleIconFiles"] lastObject];
    image = [UIImage imageNamed:icon];
    if (!thumImage) {
        thumImage = image;
    }
    //创建网页内容对象
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle: title descr:descr thumImage:thumImage];//（UIImage或者NSData类型，或者image_url）
    //设置网页地址
    shareObject.webpageUrl =Url;
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:currentViewController completion:^(id data, NSError *error) {
        if (error) {
            NSLog(@"************Share fail with error %@*********",error);
        }else{
            NSLog(@"response data is %@",data);
        }
    }];
}



@end
