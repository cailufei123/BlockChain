//
//  BCMePDCListCell.m
//  BlockChain
//
//  Created by Mac on 2018/5/29.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCMePDCListDownCell.h"
#import "BCMePDCListMode.h"

@interface BCMePDCListDownCell()
/** 日常领取*/
@property (nonatomic, strong)UILabel *name;
/** 时间*/
@property (nonatomic, strong)UILabel *time;
/** TBC*/
@property (nonatomic, strong)UILabel *type;
/** 钱*/
@property (nonatomic, strong)UILabel *price;
@property(nonatomic,strong)UIView *line;
@end
@implementation BCMePDCListDownCell

-(UILabel *)name{
    if (!_name) {
        _name =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
        //        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_name];
    }
    return _name;
}
-(UILabel *)time{
    if (!_time) {
        _time =[UILabel LabelWithTextColor:color717171 textFont:FONT(@"PingFangSC-Regular", SXRealValue(9)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
        //        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_time];
    }
    return _time;
}
-(UILabel *)type{
    if (!_type) {
        _type =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(14)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
        //        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_type];
    }
    return _type;
}

-(UILabel *)price{
    if (!_price) {
        _price =[UILabel LabelWithTextColor:colorD35353 textFont:FONT(@"PingFangSC-Regular", SXRealValue(14)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
        //        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_price];
    }
    return _price;
}
-(UIView *)line{
    if (!_line) {
        _line= [[UIView alloc] init];
    }
    return _line;
}


+(instancetype)getCellWithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //初始化
    static NSString * DetailArticleID = @"BCMePDCListDownCell";
    BCMePDCListDownCell *cell = [tableView dequeueReusableCellWithIdentifier:DetailArticleID];
    if (!cell) {
        cell = [[BCMePDCListDownCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DetailArticleID];
        //选中颜色
        //[Util selectCellBackgroundColor:cell];
    };
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor =bagColor;
        [self.contentView addSubview:self.name];
        [self.contentView addSubview:self.time];
        [self.contentView addSubview:self.type];
        [self.contentView addSubview:self.price];
        [self.contentView addSubview:self.line];
        
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
        [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(0));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(0));
            make.bottom.mas_equalTo(self.contentView.mas_bottom).with.offset((SYRealValue(-0.6)));
            make.height.mas_equalTo((SYRealValue(0.6)));
        }];
    }
    return self;
}
-(void)setModel:(BCMePDCListMode *)model{
    _model =model;
    if (model!=nil) {
        //假数据
        self.name.text = [NSString stringWithFormat:@"领取%@",model.name];
        NSArray *array = [model.createTime componentsSeparatedByString:@"."]; //从字符A中分隔成2个元素的数组
        if (array.count==2) {
            self.time.text= array[0];
        }else{
            self.time.text = model.createTime;
        }
        self.type.text =model.code;
        if ([model.price floatValue]<0) {//直接显示负数，服务器自动反 - 号
            if(model.price.wby_isPureInt){
                self.price.text=[NSString stringWithFormat:@"%.1f",model.price.floatValue];
            }else{
                self.price.text=model.price;
            }
        }else{//证书
            //整形还是浮点型
            if (model.price.wby_isPureInt) {//整形
                self.price.text=[NSString stringWithFormat:@"+%.1f",model.price.floatValue];
            }else{
                self.price.text=[NSString stringWithFormat:@"+%@",model.price];
            }
        }
        self.line.backgroundColor = colorE5E7E9;
        self.backgroundColor =naverTextColor;
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
