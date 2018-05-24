//
//  BCPDCListAlertView.h
//  BlockChain
//
//  Created by Mac on 2018/5/23.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BCMePDCListMode;

//协议
@protocol BCMePDCListAlertViewDelegate <NSObject>

@optional

-(void)guanWangBtnClick:(BCMePDCListMode *)model;
-(void)sureBtnClick:(BCMePDCListMode *)model;


@end



@interface BCMePDCListAlertView : UIView

@property(nonatomic,strong)BCMePDCListMode *model;
/**知道了按钮*/
@property(nonatomic,strong)UIButton *sureBtn;
@property (nonatomic, weak) id <BCMePDCListAlertViewDelegate> delegate;

@end
