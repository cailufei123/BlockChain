//
//  BCMeSurePayView.h
//  BlockChain
//
//  Created by Mac on 2018/5/30.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BCMeChangeMoneyMode;
//协议
@protocol BCMeSurePayViewDelegate <NSObject>

@optional

-(void)maskToPay;//去支付密码界面

-(void)backClick;//返回

-(void)changeHeight:(CGFloat )height;

@end

@interface BCMeSurePayView : UIView

@property(nonatomic,strong)BCMeChangeMoneyMode *model;
@property (nonatomic, weak) id <BCMeSurePayViewDelegate> delegate;
@end
