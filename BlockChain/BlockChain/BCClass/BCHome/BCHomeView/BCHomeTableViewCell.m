//
//  BCHomeTableViewCell.m
//  BlockChain
//
//  Created by 蔡路飞 on 2018/5/22.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCHomeTableViewCell.h"
@interface BCHomeTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *nameLb;
@property (weak, nonatomic) IBOutlet UILabel *contentLb;
@property (weak, nonatomic) IBOutlet UIButton *statusBt;

@property (weak, nonatomic) IBOutlet UILabel *atatusLb;
@end
@implementation BCHomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

-(void)setCandyListModel:(CandyListModel *)candyListModel{
    [self.img sd_setImageWithURL:[NSURL URLWithString:candyListModel.icon] placeholderImage:nil];
    self.nameLb.text = candyListModel.code;
    self.contentLb.text = candyListModel.slogan;
    if ([candyListModel.canGain isEqualToString:@"0"]) {
        [self.statusBt setBackgroundColor:[SVGloble colorWithHexString:@"#9A9A9A"]];
        self.statusBt.userInteractionEnabled = NO;
        [self.statusBt setTitle:@"已领取" forState:UIControlStateNormal];
        
        if ([candyListModel.status isEqualToString:@"0"]) {
            [self.statusBt setBackgroundColor:[SVGloble colorWithHexString:@"#9A9A9A"]];
            self.statusBt.userInteractionEnabled = NO;
            
            self.atatusLb.text = @"进行中";
        }else{
            [self.statusBt setBackgroundColor:[SVGloble colorWithHexString:@"#9A9A9A"]];
            self.statusBt.userInteractionEnabled = NO;
            
            self.atatusLb.text = @"已结束";
        }
    }else if ([candyListModel.canGain isEqualToString:@"1"]){
        [self.statusBt setBackgroundColor:[SVGloble colorWithHexString:@"#C8AACC"]];
        self.statusBt.userInteractionEnabled = YES;
        [self.statusBt setTitle:@"领取" forState:UIControlStateNormal];
        if ([candyListModel.status isEqualToString:@"0"]) {
           [self.statusBt setBackgroundColor:[SVGloble colorWithHexString:@"#C8AACC"]];
            self.statusBt.userInteractionEnabled = YES;
            
            self.atatusLb.text = @"进行中";
        }else{
            [self.statusBt setBackgroundColor:[SVGloble colorWithHexString:@"#9A9A9A"]];
            self.statusBt.userInteractionEnabled = NO;
            
            self.atatusLb.text = @"已结束";
        }
    }
    
   
    [self.statusBt addTarget:self action:@selector(statusBtClick:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}
-(void)statusBtClick:(UIButton *)button{
    
    if (self.receiveCandy) {
        self.receiveCandy(button);
    }
}
@end
