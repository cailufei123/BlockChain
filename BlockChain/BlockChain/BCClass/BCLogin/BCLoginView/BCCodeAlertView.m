//
//  BCCodeAlertView.m
//  BlockChain
//
//  Created by 蔡路飞 on 2018/5/23.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCCodeAlertView.h"

@implementation BCCodeAlertView
-(void)awakeFromNib{
    [super awakeFromNib];
    self.autoresizesSubviews = NO;
    self.autoresizingMask = NO;
   
}

- (IBAction)colseBtClick:(id)sender {
    [GKCover hide];
}

+(instancetype)loadNameBCCodeAlertViewXib {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}
@end
