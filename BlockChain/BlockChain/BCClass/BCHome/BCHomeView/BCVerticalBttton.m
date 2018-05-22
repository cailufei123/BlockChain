//
//  BCVerticalBttton.m
//  BlockChain
//
//  Created by 蔡路飞 on 2018/5/22.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCVerticalBttton.h"

@implementation BCVerticalBttton

-(void)setup {
//    self.imageView.backgroundColor = [SVGloble colorWithHexString:@"#404652"];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

-(void)layoutSubviews {
    [super layoutSubviews];
    //调整图片
    self.imageView.clf_x = 0;
    self.imageView.clf_y = 0;
    self.imageView.clf_width = 26;
    self.imageView.clf_height = 40;
    self.imageView.clf_centerX = self.clf_width/2;
  
    
    //调整文字
    self.titleLabel.clf_x = 0;
    self.titleLabel.clf_y = self.imageView.clf_bottom;
    self.titleLabel.clf_width = self.clf_width;
    self.titleLabel.clf_height = 20;
    self.titleLabel.clf_centerX = self.clf_width/2;
  
}

@end

