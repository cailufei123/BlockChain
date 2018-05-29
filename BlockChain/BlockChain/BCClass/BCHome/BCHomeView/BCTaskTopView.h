//
//  BCTaskTopView.h
//  BlockChain
//
//  Created by 蔡路飞 on 2018/5/23.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCHomeModel.h"
@interface BCTaskTopView : UIView
+(instancetype)loadNameBCTaskTopViewViewXib ;
@property(nonatomic,strong)NSMutableArray * platTaskLogModels;
@property(nonatomic,strong)NSMutableArray * imgs;
@property(nonatomic,copy)void (^skipPage)(PlatTaskLogModel * platTaskLogModel);
@end
