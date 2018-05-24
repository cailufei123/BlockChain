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

@property (weak, nonatomic) IBOutlet UILabel *messageNameLb;

@property (weak, nonatomic) IBOutlet UIView *pointView;
@property (strong, nonatomic)  LFBadgeView *bageView;
@property (weak, nonatomic) IBOutlet UILabel *timeLb;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLyout;

@end
@implementation ATMessageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
   
    
}


-(void)setMessageModel:(SAMessageModel *)messageModel{
     LFLog(@"%@",messageModel.bageVlue);
    if ([messageModel.bageVlue isEqualToString:@"0"]) {
        self.pointView.hidden = NO;
        self.titleLyout.constant = 30;
    }else if ([messageModel.bageVlue isEqualToString:@"1"]){
        self.pointView.hidden = YES;
          self.titleLyout.constant = 16;
    }
    self.timeLb.text = messageModel.timeStr;
    self.messageNameLb.text =messageModel.msg_title;
 
}

@end

