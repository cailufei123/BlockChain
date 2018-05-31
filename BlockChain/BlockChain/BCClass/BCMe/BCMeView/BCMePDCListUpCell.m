//
//  BCMeTangGuoJiLuUpCell.m
//  BlockChain
//
//  Created by Mac on 2018/5/29.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCMePDCListUpCell.h"
#import "BCMePDCMode.h"


@interface BCMePDCListUpCell()
//@property (nonatomic, strong)UIView *upview1;
//@property (nonatomic, strong)UIButton *backBtn;
@property (nonatomic, strong)UIView *bigView;
@property (nonatomic, strong)UIView *upBigView;
/** PDC总数*/
@property (nonatomic, strong)UILabel *price;
/** 与等于总数*/
@property (nonatomic, strong)UILabel *yuePrice;
/** view*/
@property (nonatomic, strong)UIView *smallBgView;
@property (nonatomic, strong)UIView *downView;


@property (nonatomic, strong)UILabel *label1;//简介
@property (nonatomic, strong)UILabel *label2;//项目名称
@property (nonatomic, strong)UILabel *label3;//标语
@property (nonatomic, strong)UILabel *label4;//项目介绍
@property(nonatomic,strong)UIView *line;

@property (nonatomic, strong)UIButton *xiaQingBtn;

@property(nonatomic,strong)CAGradientLayer *gradientLayer;

@end

@implementation BCMePDCListUpCell
//最大高度
#define HeaderViewHeight   ((SYRealValue(67+33+23))+kTopHeight+(SYRealValue(235)))  //顶部view高度
//顶部总体高度
#define upBigViewHeight   ((SYRealValue(67+33+23)))

-(UIView *)bigView{
    if (!_bigView) {
        _bigView = [[UIView alloc] init];
        //_upBigView.backgroundColor =[UIColor redColor];
        //        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_bigView];
    }
    return _bigView;
}
-(UIView *)upBigView{
    if (!_upBigView) {
        _upBigView = [[UIView alloc] init];
        
        //_upBigView.backgroundColor =[UIColor redColor];
        //          [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_upBigView];
    }
    return _upBigView;
}

-(UILabel *)price{
    if (!_price) {
        _price =[UILabel LabelWithTextColor:naverTextColor textFont:FONT(@"PingFangSC-Medium", SXRealValue(47)) textAlignment:NSTextAlignmentCenter numberOfLines:1];
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
-(UIView *)smallBgView{
    if (!_smallBgView) {
        _smallBgView = [[UIView alloc] init];
        //_smallBgView.backgroundColor =colorB0ADFC;
        [Util roundBorderView:SXRealValue(3) border:0 color:[UIColor blackColor] view:_smallBgView];
    }
    return _smallBgView;
}

-(UILabel *)yuePrice{
    if (!_yuePrice) {
        _yuePrice =[UILabel LabelWithTextColor:naverTextColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(19)) textAlignment:NSTextAlignmentCenter numberOfLines:1];
        //        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_yuePrice];
    }
    return _yuePrice;
}
-(UIView *)downView{
    if (!_downView) {
        _downView = [[UIView alloc] init];
    
        //        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_downView];
    }
    return _downView;
}

-(UILabel *)label1{
    if (!_label1) {
        _label1 =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(15)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
        //        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_label1];
    }
    return _label1;
}
-(UILabel *)label2{
    if (!_label2) {
        _label2 =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
        //        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_label2];
    }
    return _label2;
}

-(UILabel *)label3{
    if (!_label3) {
        _label3 =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
        //        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_label3];
    }
    return _label3;
}
-(UILabel *)label4{
    if (!_label4) {
        _label4 =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentLeft numberOfLines:0];
        //        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_label4];
    }
    return _label4;
}

-(UIButton *)xiaQingBtn{
    if (!_xiaQingBtn) {
        _xiaQingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _xiaQingBtn.titleLabel.font = FONT(@"PingFangSC-Medium", SXRealValue(12));
        _xiaQingBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        _xiaQingBtn.titleLabel.textColor=color2B73EE;
        [_xiaQingBtn setTitleColor:color2B73EE forState:UIControlStateNormal];
        //[_xiaQingBtn setBackgroundColor:color9164D6];
        [_xiaQingBtn  setHitEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -10)];//热区域
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_xiaQingBtn];
    }
    return _xiaQingBtn;
}

+(instancetype)getCellWithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //初始化
    static NSString * DetailArticleID = @"BCMePDCListUpCell";
    BCMePDCListUpCell *cell = [tableView dequeueReusableCellWithIdentifier:DetailArticleID];
    if (!cell) {
        cell = [[BCMePDCListUpCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DetailArticleID];
        //选中颜色
    };
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor =bagColor;
        //顶部
//        self.bigView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
//        self.upBigView.frame = CGRectMake(0, kTopHeight, SCREENWIDTH, upBigViewHeight);
        [self.upBigView addSubview:self.price];
        [self.upBigView addSubview:self.smallBgView];
        
        [self.smallBgView addSubview:self.yuePrice];
        [self.contentView addSubview:self.bigView];
        [self.contentView addSubview:self.upBigView];
        [self.contentView addSubview:self.downView];
        [self.contentView insertSubview:self.downView aboveSubview:self.upBigView];
        [self.downView addSubview:self.label1];
        [self.downView addSubview:self.line];
        [self.downView addSubview:self.label2];
        [self.downView addSubview:self.label3];
        [self.downView addSubview:self.label4];
        [self.downView addSubview:self.xiaQingBtn];
        
        
        [self.bigView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
        }];
        [self.upBigView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.contentView.mas_top).with.offset(kTopHeight);
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(0);
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(0);
            make.height.mas_equalTo(upBigViewHeight);
        }];
        [self.price mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.upBigView.mas_top).with.offset(0);
            make.centerX.equalTo(self.upBigView.mas_centerX);
            make.width.mas_equalTo(SCREENWIDTH);
            make.height.mas_equalTo((SYRealValue(67)));
        }];
        
        [self.smallBgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.price.mas_bottom).with.offset(0);
            make.centerX.equalTo(self.upBigView.mas_centerX);
            make.height.mas_equalTo((SYRealValue(33)));
        }];
        [self.yuePrice mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.smallBgView.mas_left).with.offset(SXRealValue(18));
            make.right.mas_equalTo(self.smallBgView.mas_right).with.offset(SXRealValue(-17));
            make.centerY.equalTo(self.smallBgView.mas_centerY);
            make.height.mas_equalTo((SYRealValue(28)));
        }];
        [self.downView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(0);
            make.top.mas_equalTo(self.upBigView.mas_bottom).with.offset(0);
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(0);
            make.bottom.mas_equalTo(self.contentView.mas_bottom).with.offset(0);
        }];
        
        [self.label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.downView.mas_left).with.offset(SXRealValue(18));
            make.right.mas_equalTo(self.downView.mas_right).with.offset(SXRealValue(-18));
            make.top.mas_equalTo(self.downView.mas_top).with.offset((SYRealValue(5)));
            make.height.mas_equalTo((SYRealValue(44)));
        }];
        [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.downView.mas_left).with.offset(SXRealValue(0));
            make.right.mas_equalTo(self.downView.mas_right).with.offset(SXRealValue(0));
            make.top.mas_equalTo(self.label1.mas_bottom).with.offset((SYRealValue(0)));
            make.height.mas_equalTo((SYRealValue(0.6)));
        }];
        [self.label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.downView.mas_left).with.offset(SXRealValue(18));
            make.right.mas_equalTo(self.downView.mas_right).with.offset(SXRealValue(-18));
            make.top.mas_equalTo(self.label1.mas_bottom).with.offset((SYRealValue(15)));
            make.height.mas_equalTo((SYRealValue(25)));
        }];
        [self.label3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.downView.mas_left).with.offset(SXRealValue(18));
            make.right.mas_equalTo(self.downView.mas_right).with.offset(SXRealValue(-18));
            make.top.mas_equalTo(self.label2.mas_bottom).with.offset((SYRealValue(15)));
            make.height.mas_equalTo((SYRealValue(25)));
        }];
        [self.label4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.downView.mas_left).with.offset(SXRealValue(18));
            make.right.mas_equalTo(self.downView.mas_right).with.offset(SXRealValue(-18));
            make.top.mas_equalTo(self.label3.mas_bottom).with.offset((SYRealValue(15)));
        }];
        [self.xiaQingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.downView.mas_left).with.offset(SXRealValue(12));
            make.top.mas_equalTo(self.label4.mas_bottom).with.offset((SYRealValue(5)));
            make.bottom.mas_equalTo(self.downView.mas_bottom).with.offset((SYRealValue(-2)));
            make.width.mas_equalTo((SYRealValue(40)));
            make.height.mas_equalTo((SYRealValue(20)));
        }];
         //初始化CAGradientlayer对象，使它的大小为UIView的大小
    }
    return self;
}

-(void)setModel:(BCMePDCMode *)model{
    _model =model;
    if (model!=nil) {
        if (model.partner!=nil) {
            self.price.text=[NSString stringWithFormat:@"%.1f",[model.uci.coin floatValue]];
            self.yuePrice.text=[NSString stringWithFormat:@"≈ ¥%.1f",model.uci.rmb.floatValue];
            self.label1.text=[NSString stringWithFormat:@"%@简介",model.partner.code];
            self.label2.text=[NSString stringWithFormat:@"项目名称:%@",model.partner.projectName];
            self.label3.text=[NSString stringWithFormat:@"标语:%@",model.partner.slogan];
            self.label4.text=[NSString stringWithFormat:@"项目介绍:%@",model.partner.brief];
            [self.xiaQingBtn setTitle:@"详情" forState:UIControlStateNormal];
            //        _xiaQingBtn.titleLabel.textColor=color2B73EE;
            //        [_xiaQingBtn setTitleColor:color2B73EE forState:UIControlStateNormal];
            [self setlABLE];
            [self.contentView layoutIfNeeded];
            [self.bigView gradientFreme:CGRectMake(0, 0, SCREENWIDTH, self.bigView.xmg_height) startColor:color5E4FC9 endColor:colorC483FB];
            self.smallBgView.backgroundColor = [colorB0ADFC colorWithAlphaComponent:0.5];
            self.line.backgroundColor = colorE5E7E9;
            self.downView.backgroundColor =naverTextColor;
        }
    }
}

-(void)setlABLE{
    //给button添加下划线
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:@"详情"];
    NSRange titleRange = {0,[title length]};
    [title addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:titleRange];
    [_xiaQingBtn setAttributedTitle:title
                           forState:UIControlStateNormal];
    [_xiaQingBtn setTitleColor:color2B73EE forState:UIControlStateNormal];
    [_xiaQingBtn addTarget:self action:@selector(xiaQingBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [Util roundBorderView:SXRealValue(2) border:0 color:color2B73EE view:_xiaQingBtn];
}
#pragma 点击项目介绍详情
-(void)xiaQingBtnClick{
    if (self.delegate && [self.delegate respondsToSelector:@selector(xiaQingBtnClickWithModel:)]) {
        [self.delegate xiaQingBtnClickWithModel:self.model];
    }
}



//顶部总体高度
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
