//
//  BCMeChangeMoneyController.h
//  BlockChain
//
//  Created by Mac on 2018/5/24.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>




@interface BCMeChangeMoneyController : UIViewController
@property(nonatomic,strong)NSString *code;

@property(nonatomic,strong)NSString *coin;//最大金额



//是否返回刷新block
@property(nonatomic,copy)void (^refreshAllData)(BOOL isRefresh);

@property(nonatomic,copy)void (^backBlock)(BOOL back);

@end
