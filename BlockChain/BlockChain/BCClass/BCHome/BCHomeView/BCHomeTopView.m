//
//  BCHomeTopView.m
//  BlockChain
//
//  Created by 蔡路飞 on 2018/5/22.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCHomeTopView.h"

@implementation BCHomeTopView

-(void)awakeFromNib{
    [super awakeFromNib];
  
}

+(instancetype)loadNameBCHomeTopViewXib {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}

@end
