//
//  BCMeQRCodeController.h
//  BlockChain
//
//  Created by Mac on 2018/5/23.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BCMeModel;
//二维码界面
@interface BCMeQRCodeController : UIViewController

@property(nonatomic,assign)BOOL isShouKuan;//是否从收款界面跳转来的
@property(nonatomic,strong)BCMeModel *meModel;
@end
