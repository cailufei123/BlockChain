//
//  BCMeQRCodeView.h
//  BlockChain
//
//  Created by Mac on 2018/5/23.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BCQRCodeMode;

@interface BCMeQRCodeView : UIView

/** 二维码*/
@property (nonatomic, strong)UILabel *QRCode;
/** 复制二维码*/
@property (nonatomic, strong)UIButton *QRCodeBtn1;
/** 二维码下划线*/
@property (nonatomic, strong)UIButton *QRCodeBtn2;

@property (nonatomic, strong)BCQRCodeMode *model;

@end
