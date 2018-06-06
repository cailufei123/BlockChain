//
//  BCHomeDetailUpCell.m
//  BlockChain
//
//  Created by Mac on 2018/5/25.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCHomeDetailUpCell.h"
#import "BCHomeDetailModel.h"

@interface BCHomeDetailUpCell()
//WSDC
@property (nonatomic, strong)UILabel *codeLable;
@property (nonatomic, strong)UIView *line;

/** 我的图片*/
@property (nonatomic, strong)UIImageView *BIcon;
/** 数量*/
@property (nonatomic, strong)UILabel *numberLable;
/** 时间*/
@property (nonatomic, strong)UILabel *timeLable;
/** 进行中*/
@property (nonatomic, strong)UILabel *jiXingLable;
/** 项目名字*/
@property (nonatomic, strong)UILabel *xiangMuLable;
/** 比特币*/
@property (nonatomic, strong)UILabel *biTeLable;
/** 介绍*/
@property (nonatomic, strong)UILabel *jieShaoLable;
/** 介绍内容*/
@property (nonatomic, strong)UILabel *jieShao;

@end
@implementation BCHomeDetailUpCell


-(UILabel *)codeLable{
    if (!_codeLable) {
        _codeLable =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Semibold", SXRealValue(24)) textAlignment:NSTextAlignmentCenter numberOfLines:1];
//                [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_codeLable];
    }
    return _codeLable;
}
-(UIView *)line{
    if (!_line) {
        _line = [UIView getViewUserEnabled:NO backGroundColor:nil tag:0 target:nil action:nil];
        //[Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_line1];
    }
    return _line;
}
-(UIImageView *)BIcon{
    if (!_BIcon) {
        _BIcon = [[UIImageView alloc] init];
        //_myIcon.contentMode = UIViewContentModeScaleAspectFill;
        [Util roundBorderView:SXRealValue(66/2) border:0 color:[UIColor blackColor] view:_BIcon];
    }
    return _BIcon;
}
-(UILabel *)numberLable{
    if (!_numberLable) {
        _numberLable =[UILabel LabelWithTextColor:color484848 textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_numberLable];
    }
    return _numberLable;
}
-(UILabel *)timeLable{
    if (!_timeLable) {
        _timeLable =[UILabel LabelWithTextColor:color484848 textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_timeLable];
    }
    return _timeLable;
}
-(UILabel *)jiXingLable{
    if (!_jiXingLable) {
        _jiXingLable =[UILabel LabelWithTextColor:color504C53 textFont:FONT(@"PingFangSC-Regular", SXRealValue(11)) textAlignment:NSTextAlignmentRight numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_jiXingLable];
    }
    return _jiXingLable;
}
-(UILabel *)xiangMuLable{
    if (!_xiangMuLable) {
        _xiangMuLable =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(15)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_xiangMuLable];
    }
    return _xiangMuLable;
}
-(UILabel *)biTeLable{
    if (!_biTeLable) {
        _biTeLable =[UILabel LabelWithTextColor:color484848 textFont:FONT(@"PingFangSC-Regular", SXRealValue(15)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_biTeLable];
    }
    return _biTeLable;
}
-(UILabel *)jieShaoLable{
    if (!_jieShaoLable) {
        _jieShaoLable =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(15)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_jieShaoLable];
    }
    return _jieShaoLable;
}
-(UILabel *)jieShao{
    if (!_jieShao) {
        _jieShao =[UILabel LabelWithTextColor:color636161 textFont:FONT(@"PingFangSC-Regular", SXRealValue(12)) textAlignment:NSTextAlignmentLeft numberOfLines:0];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_jieShao];
    }
    return _jieShao;
}


+(instancetype)getCellWithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //初始化
    static NSString * DetailArticleID = @"BCHomeDetailUpCell";
    BCHomeDetailUpCell *cell = [tableView dequeueReusableCellWithIdentifier:DetailArticleID];
    if (!cell) {
        cell = [[BCHomeDetailUpCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DetailArticleID];
        //选中颜色
        //[Util selectCellBackgroundColor:cell];
    };
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = naverTextColor;
        //顶部
        [self.contentView addSubview:self.codeLable];
        [self.contentView addSubview:self.line];
        [self.contentView addSubview:self.BIcon];
        [self.contentView addSubview:self.numberLable];
        [self.contentView addSubview:self.timeLable];
        [self.contentView addSubview:self.jiXingLable];
        [self.contentView addSubview:self.xiangMuLable];
        [self.contentView addSubview:self.biTeLable];
        [self.contentView addSubview:self.jieShaoLable];
        [self.contentView addSubview:self.jieShao];
        
        [self.codeLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.contentView.mas_top).with.offset((SYRealValue(6)));
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(0));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(0));
        }];
        [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.codeLable.mas_bottom).with.offset((SYRealValue(7)));
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(0));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(0));
            make.height.mas_equalTo((SYRealValue(0.6)));
        }];
        [self.BIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.line.mas_bottom).with.offset((SYRealValue(8)));
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(10));
            make.width.mas_equalTo((SXRealValue(66)));
            make.height.mas_equalTo((SXRealValue(66)));
        }];
        [self.numberLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.BIcon.mas_centerY).with.offset((SYRealValue(-1)));
            make.left.mas_equalTo(self.BIcon.mas_right).with.offset(SXRealValue(8));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset((SXRealValue(-51)));
        }];
        [self.timeLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.BIcon.mas_centerY).with.offset((SYRealValue(1)));
            make.left.mas_equalTo(self.BIcon.mas_right).with.offset(SXRealValue(8));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-51));
        }];
        [self.jiXingLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-13));
            make.centerY.mas_equalTo(self.BIcon.mas_centerY);
        }];
        [self.xiangMuLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.BIcon.mas_bottom).with.offset((SYRealValue(10)));
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(17));
            make.width.mas_equalTo((SXRealValue(70)));
            make.height.mas_equalTo((SYRealValue(23)));
        }];
        [self.biTeLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.xiangMuLable.mas_centerY);
            make.left.mas_equalTo(self.xiangMuLable.mas_right).with.offset(SXRealValue(26));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-17));
        }];
        [self.jieShaoLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.xiangMuLable.mas_bottom).with.offset((SYRealValue(22)));
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(17));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-17));
            make.height.mas_equalTo((SYRealValue(23)));
        }];
        [self.jieShao mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.jieShaoLable.mas_bottom).with.offset((SYRealValue(13)));
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(17));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-17));
            make.bottom.mas_equalTo(self.contentView.mas_bottom).with.offset((SYRealValue(-10)));
        }];
        
    }
    return self;
}

-(void)setModel:(BCHomeDetailModel *)model{
    _model =model;
    if (_model!=nil) {
        self.codeLable.text =model.candyProcess.code;
        //假数据
        [self.BIcon sd_setImageWithURL:[NSURL URLWithString:model.candyProcess.icon] placeholderImage:nil] ;
        self.numberLable.text = [NSString stringWithFormat:@"发放数量: %@  剩余: %ld",model.candyProcess.count,[model.candyProcess.count integerValue]-[model.candyProcess.getCount integerValue]];
        self.timeLable.text = [NSString stringWithFormat:@"发放时间: %@",model.candyProcess.createTime];
        if ([model.candyProcess.status isEqualToString:@"0"]) {
            self.jiXingLable.text = @"进行中";
        }else{
            self.jiXingLable.text = @"已结束";
        }
        
        self.xiangMuLable.text =@"项目名称";
        self.biTeLable.text =model.partnerInfo.projectName;
        self.jieShaoLable.text =@"项目介绍";
        self.jieShao.text =model.partnerInfo.brief;
        _line.backgroundColor =colorE5E7E9;

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
