//
//  BCHomeTopView.h
//  BlockChain
//
//  Created by 蔡路飞 on 2018/5/22.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BCHomeTopView : UIView
+(instancetype)loadNameBCHomeTopViewXib ;
@property(nonatomic,copy)void (^hideSquare)(void);
@property(nonatomic,copy)void (^calculation)(void);
@property(nonatomic,copy)void (^more)(void);
@property(nonatomic,copy)void (^purpleStone)(void);
@property(nonatomic,copy)void (^yellowStoneBt)(void);
@end
