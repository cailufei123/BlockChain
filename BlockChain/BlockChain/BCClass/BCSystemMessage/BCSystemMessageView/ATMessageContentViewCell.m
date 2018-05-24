//
//  ATMessageContentViewCell.m
//  Auction
//
//  Created by 蔡路飞 on 2017/11/9.
//  Copyright © 2017年 Cailufei. All rights reserved.
//

#import "ATMessageContentViewCell.h"

@implementation ATMessageContentViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self layercornerRadius:2];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
-(void)setFrame:(CGRect)frame{
    frame.origin.x = 13;
    frame.size.width = LFscreenW-26;
    [super setFrame:frame];
}

@end
