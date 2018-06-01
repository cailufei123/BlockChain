//
//  BCPDCListAlertView.h
//  BlockChain
//
//  Created by Mac on 2018/5/23.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BCMePDCMode;

//协议
@protocol BCMePDCListAlertViewDelegate <NSObject>

@optional

-(void)guanWangBtnClick:(BCMePDCMode *)model;
-(void)sureBtnClick:(BCMePDCMode *)model;


@end



@interface BCMePDCListAlertView : UIView

@property(nonatomic,strong)BCMePDCMode *model;
/**知道了按钮*/
@property(nonatomic,strong)UIButton *sureBtn;
/** 跳转官网*/
//@property (nonatomic, strong)UIButton *guanWangBtn;
@property (nonatomic, strong)UILabel *guanWangBtn;

@property (nonatomic, weak) id <BCMePDCListAlertViewDelegate> delegate;

@end
