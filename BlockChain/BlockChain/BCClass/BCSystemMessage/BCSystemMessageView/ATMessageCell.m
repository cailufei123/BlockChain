//
//  ATMessageCell.m
//  Auction
//
//  Created by 蔡路飞 on 2017/11/9.
//  Copyright © 2017年 Cailufei. All rights reserved.
//

#import "ATMessageCell.h"

#import "LFBadgeView.h"

@interface ATMessageCell()
@property (weak, nonatomic) IBOutlet UIImageView *ativeImageVew;
@property (weak, nonatomic) IBOutlet UILabel *messageNameLb;
@property (weak, nonatomic) IBOutlet UILabel *meaageContent;
@property (strong, nonatomic)  LFBadgeView *bageView;

@end
@implementation ATMessageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
   
    
}
- (LFBadgeView *)bageView
{
    if (_bageView == nil) {
        self.bageView = [[LFBadgeView alloc] init];
        [self.contentView addSubview:self.bageView];
    }
    return _bageView;
}
-(void)layoutSubviews{
    
    [super layoutSubviews];
    self.bageView.clf_x = LFscreenW-70;
    self.bageView.clf_centerY = 28;
}
-(void)setMessageModel:(SAMessageModel *)messageModel{
    if ([messageModel.msg_type isEqualToString:@"0"]) {
        if ([messageModel.bageVlue integerValue]>0) {
             self.bageView.hidden = NO;
            self.bageView.badgeValue = messageModel.bageVlue;
            self.ativeImageVew.image = [UIImage imageNamed:@"message_systemmessage_iocn"];
        }else{
            self.bageView.hidden = YES;
        }
        
        self.messageNameLb.text = @"活动";
        self.meaageContent.text = messageModel.msg_content;
        
    }else if ([messageModel.msg_type isEqualToString:@"1"]){
        if ([messageModel.bageVlue integerValue]>0) {
            self.bageView.hidden = NO;
            self.bageView.badgeValue = messageModel.bageVlue;
            self.ativeImageVew.image = [UIImage imageNamed:@"message_winningremind_iocn"];
        }else{
            self.bageView.hidden = YES;
        }
        
        self.messageNameLb.text = @"消息";
        self.meaageContent.text = messageModel.msg_content;
        
    }else if ([messageModel.msg_type isEqualToString:@"2"]){
        if ([messageModel.bageVlue integerValue]>0) {
            self.bageView.hidden = NO;
            self.bageView.badgeValue = messageModel.bageVlue;
            self.ativeImageVew.image = [UIImage imageNamed:@"message_newactivity_iocn"];
        }else{
            self.bageView.hidden = YES;
        }
        
        self.messageNameLb.text = @"通知";
        self.meaageContent.text = messageModel.msg_content;
        
    }
    
}

@end

