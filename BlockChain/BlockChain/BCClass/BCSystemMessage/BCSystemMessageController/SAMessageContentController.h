//
//  SAMessageContentController.h
//  SkinAssistant
//
//  Created by 蔡路飞 on 2017/7/13.
//  Copyright © 2017年 LeGame. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SAMessageContentController : UIViewController
@property (strong, nonatomic)NSString *  type;
@property (copy, nonatomic)void(^refreshmianpage)(void);
@end
