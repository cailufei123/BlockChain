//
//  SAVourcherHeartView.m
//  SkinAssistant
//
//  Created by 蔡路飞 on 2017/8/22.
//  Copyright © 2017年 LeGame. All rights reserved.
//

#import "SAVourcherHeartView.h"

@implementation SAVourcherHeartView
-(void)awakeFromNib {
    [super awakeFromNib];
    
    self.autoresizesSubviews = NO;
    
   }

+(instancetype)vourcherHeartView {
    
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}


@end
