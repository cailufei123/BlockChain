//
//  BCTaskTableViewCell.m
//  BlockChain
//
//  Created by 蔡路飞 on 2018/5/23.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCTaskTableViewCell.h"
@interface BCTaskTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *timeLb;
@property (weak, nonatomic) IBOutlet UILabel *statusLb;

@property (weak, nonatomic) IBOutlet UILabel *nameLb;
@property (weak, nonatomic) IBOutlet UILabel *decLb;
@property (weak, nonatomic) IBOutlet UILabel *faxinLb;
@property (weak, nonatomic) IBOutlet UILabel *powerLb;
@end
@implementation BCTaskTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

-(void)setTaskInfoModel:(TaskInfoModel *)taskInfoModel{
  
    self.timeLb.text = taskInfoModel.createTime;
    
    if ([taskInfoModel.status isEqualToString:@"2"]) {
           self.statusLb.text = @"进行中";
        self.statusLb.textColor = [SVGloble colorWithHexString:@"#40A32F"];
        self.powerLb.backgroundColor = [SVGloble colorWithHexString:@"#D35353"];
        
    }else{
           self.statusLb.text = @"已完成";
          self.statusLb.textColor = [SVGloble colorWithHexString:@"#7A7A7A"];
         self.powerLb.backgroundColor = [SVGloble colorWithHexString:@"#A9A9A9"];
    }
       self.powerLb.text = [NSString stringWithFormat:@"+%@算力",taskInfoModel.compute];
    self.nameLb.text = taskInfoModel.name;
    self.decLb.text = taskInfoModel.taskDesc;
      self.faxinLb.text = [NSString stringWithFormat:@"计划发行：%@%@     奖励%@%@",taskInfoModel.totalCoin,taskInfoModel.code,taskInfoModel.eachCoin,taskInfoModel.code];
   
}

@end
