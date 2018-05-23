//
//  BCMeTangGuoJiLuCell.m
//  BlockChain
//
//  Created by Mac on 2018/5/23.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCMeTangGuoJiLuCell.h"
#import "BCMeTangGuoJiLuMode.h"

@interface BCMeTangGuoJiLuCell()
/** 日常领取*/
@property (nonatomic, strong)UILabel *name;
/** 时间*/
@property (nonatomic, strong)UILabel *time;
/** TBC*/
@property (nonatomic, strong)UILabel *type;
/** 钱*/
@property (nonatomic, strong)UILabel *price;
@end
@implementation BCMeTangGuoJiLuCell

-(UILabel *)name{
    if (!_name) {
        _name =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(14)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_name];
    }
    return _name;
}
-(UILabel *)time{
    if (!_time) {
        _time =[UILabel LabelWithTextColor:color717171 textFont:FONT(@"PingFangSC-Regular", SXRealValue(10)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_time];
    }
    return _time;
}
-(UILabel *)type{
    if (!_type) {
        _type =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(15)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_type];
    }
    return _type;
}

-(UILabel *)price{
    if (!_price) {
        _price =[UILabel LabelWithTextColor:colorD35353 textFont:FONT(@"PingFangSC-Regular", SXRealValue(15)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_price];
    }
    return _price;
}



+(instancetype)getCellWithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //初始化
    static NSString * DetailArticleID = @"BCMeTableViewCell";
    BCMeTangGuoJiLuCell *cell = [tableView dequeueReusableCellWithIdentifier:DetailArticleID];
    if (!cell) {
        cell = [[BCMeTangGuoJiLuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DetailArticleID];
        //选中颜色
        //[Util selectCellBackgroundColor:cell];
    };
    
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.name];
        [self.contentView addSubview:self.time];
        [self.contentView addSubview:self.type];
        [self.contentView addSubview:self.price];

        
        [self.type mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView.mas_centerX);
            make.centerY.equalTo(self.contentView.mas_centerY);
        }];
    
        [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(16));
            make.right.mas_equalTo(self.type.mas_left).with.offset(SXRealValue(-10));
            make.bottom.mas_equalTo(self.contentView.mas_centerY).with.offset(-1);
        }];
        [self.time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(16));
            make.right.mas_equalTo(self.type.mas_left).with.offset(SXRealValue(-10));
            make.top.mas_equalTo(self.contentView.mas_centerY).with.offset(1);
        }];
        [self.price mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-15));
            make.centerY.equalTo(self.contentView.mas_centerY);
        }];
    }
    return self;
}
-(void)setModel:(BCMeTangGuoJiLuMode *)model{
    _model =model;
    if (model!=nil) {

    }else{
        //假数据
        self.name.text = @"日常领取";
        self.time.text= @"2018-14-15 14:22";
        self.type.text =@"TBC";
        self.price.text=[NSString stringWithFormat:@"%.6f",0.1111123123];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end