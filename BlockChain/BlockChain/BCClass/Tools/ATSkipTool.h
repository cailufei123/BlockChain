//
//  ATSkipTool.h
//  Auction
//
//  Created by 蔡路飞 on 2017/11/3.
//  Copyright © 2017年 Cailufei. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,UMShareType)
{
    //预定义的平台
    UMShareType_WeiXinType             = 1, //微信聊天
    UMShareType_WeiXinPengyouQuan        = 2,//微信朋友圈
    UMShareType_QQ                      = 3,//QQ聊天页面
    UMShareType_QQKongJian              = 4,//qq空间
};


@interface ATSkipTool : NSObject

+ (instancetype)sharedInstance;
- (void)loginAction:(UIViewController * )controller;

-(void)pushToViewControllerWithClassName:(NSString *)className ViewController:(UIViewController * )controller ;

-(void)shareObjectWithTitle:(NSString *)title
                      descr:(NSString *)descr
                  thumImage:(id)thumImage
                 webpageUrl:(NSString *)Url
currentViewController:(id)currentViewController
                    success:(void (^) (void))sucess;



//图片分享
-(void)shareImageAndTextWithText:(NSString *)text
                       thumImage:(id)thumImage
                      shareImage:(id)shareImage
                       shareType:(UMShareType)shareType
           currentViewController:(id)currentViewController
                         success:(void (^) (void))sucess;

@end
