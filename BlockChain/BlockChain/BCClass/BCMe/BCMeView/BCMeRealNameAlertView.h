//
//  BCMeRealNameAlertView.h
//  BlockChain
//
//  Created by Mac on 2018/5/24.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>


//协议
@protocol BCMeRealNameAlertViewDelegate <NSObject>
@optional
-(void)goBtnClick;
-(void)cancelBtnClick;
@end


//弹出实名认证view
@interface BCMeRealNameAlertView : UIView
/** 官网*/
@property (nonatomic, strong)UILabel *message;

@property (nonatomic, weak) id <BCMeRealNameAlertViewDelegate> delegate;

-(void)setUpMessage;

@end
