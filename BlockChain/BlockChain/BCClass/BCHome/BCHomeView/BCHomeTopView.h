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
@property(nonatomic,copy)void (^refreshCandyList)(void);

@property(nonatomic,copy)void (^screen)(NSString * );
@property(nonatomic,strong)NSMutableArray * candyLists;
@property(nonatomic,strong)NSMutableArray * lists;

@property (weak, nonatomic) IBOutlet UIButton *purpleStoneBt;
@property (weak, nonatomic) IBOutlet UIButton *playMethodBt;
@property (weak, nonatomic) IBOutlet UIButton *tellowStoneBt;
@end
