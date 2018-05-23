//
//  BCPDCListAlertView.h
//  BlockChain
//
//  Created by Mac on 2018/5/23.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BCMePDCListMode;

@interface BCMePDCListAlertView : UIView

@property(nonatomic,strong)BCMePDCListMode *model;
/**知道了按钮*/
@property(nonatomic,strong)UIButton *sureBtn;
@end
