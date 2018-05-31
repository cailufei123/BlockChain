//
//  SYPasswordView.h
//  PasswordDemo
//
//  Created by aDu on 2017/2/6.
//  Copyright © 2017年 DuKaiShun. All rights reserved.
//

#import <UIKit/UIKit.h>

//协议
@protocol SYPasswordViewDelegate <NSObject>

@optional

-(void)forgetBtnClick;//忘记密码

-(void)backBtnClick;//返回

-(void)getPassWord:(NSString *)passWord;//返回


@end


@interface SYPasswordView : UIView<UITextFieldDelegate>
@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, weak) id <SYPasswordViewDelegate> delegate;

/**
 *  清除密码
 */
- (void)clearUpPassword;

@end
