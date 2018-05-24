//
//  BCPDCListAlertView.m
//  BlockChain
//
//  Created by Mac on 2018/5/23.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCMePDCListAlertView.h"
#import "BCMePDCListMode.h"

@interface BCMePDCListAlertView()

/** PDC详情名字*/
@property (nonatomic, strong)UILabel *xiangQingLable;

@property (nonatomic, strong)UIView *downView;

/** 项目名字*/
@property (nonatomic, strong)UILabel *mingChengLable;
/** 标语*/
@property (nonatomic, strong)UILabel *biaoYuLable;
/** 项目介绍*/
@property (nonatomic, strong)UILabel *jieShaoLable;
/** 发行*/
@property (nonatomic, strong)UILabel *faXingLable;
/** 发行价格*/
@property (nonatomic, strong)UILabel *faXingPriceLable;
/** 官网*/
@property (nonatomic, strong)UILabel *guanWangLable;
/** 跳转官网*/
@property (nonatomic, strong)UIButton *guanWangBtn;


@end
@implementation BCMePDCListAlertView

#define  TopRowHeight   (SYRealValue(20))  //字体间距

-(UILabel *)xiangQingLable{
    if (!_xiangQingLable) {
        _xiangQingLable =[UILabel LabelWithTextColor:color414754 textFont:FONT(@"PingFangSC-Semibold", SXRealValue(18)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_xiangQingLable];
    }
    return _xiangQingLable;
}
-(UIView *)downView{
    if (!_downView) {
        _downView = [[UIView alloc] init];
        _downView.backgroundColor =naverTextColor;
        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_downView];
    }
    return _downView;
}

-(UILabel *)mingChengLable{
    if (!_mingChengLable) {
        _mingChengLable =[UILabel LabelWithTextColor:color414754 textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_mingChengLable];
    }
    return _mingChengLable;
}

-(UILabel *)biaoYuLable{
    if (!_biaoYuLable) {
        _biaoYuLable =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_biaoYuLable];
    }
    return _biaoYuLable;
}
-(UILabel *)jieShaoLable{
    if (!_jieShaoLable) {
        _jieShaoLable =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentLeft numberOfLines:4];
        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_jieShaoLable];
    }
    return _jieShaoLable;
}
-(UILabel *)faXingLable{
    if (!_faXingLable) {
        _faXingLable =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_faXingLable];
    }
    return _faXingLable;
}
-(UILabel *)faXingPriceLable{
    if (!_faXingPriceLable) {
        _faXingPriceLable =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_faXingPriceLable];
    }
    return _faXingPriceLable;
}
-(UILabel *)guanWangLable{
    if (!_guanWangLable) {
        _guanWangLable =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_guanWangLable];
    }
    return _guanWangLable;
}
-(UIButton *)guanWangBtn{
    if (!_guanWangBtn) {
        _guanWangBtn = [UIButton getButtonTitleColor:color200000 titleFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) backGroundColor:naverTextColor target:self action:@selector(guanWangBtnClick:)];
        _guanWangBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        _guanWangBtn.titleLabel.textColor =color200000;
        [_guanWangBtn  setHitEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -10)];//热区域
        [Util roundBorderView:SXRealValue(2) border:1 color:color2B73EE view:_guanWangBtn];
    }
    return _guanWangBtn;
}
-(UIButton *)sureBtn{
    if (!_sureBtn) {
        _sureBtn = [UIButton getButtonTitleColor:naverTextColor titleFont:FONT(@"PingFangSC-Semibold", SXRealValue(16)) backGroundColor:naverTextColor target:self action:@selector(sureBtnClick:)];
        _sureBtn.backgroundColor =yellowBoderColor;
        _sureBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        //_sureBtn.titleLabel.textColor =naverTextColor;
        [_sureBtn  setHitEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -10)];//热区域
        [Util roundBorderView:SXRealValue(2) border:1 color:color2B73EE view:_sureBtn];
    }
    return _sureBtn;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self =[super initWithFrame:frame]) {
        self.backgroundColor = naverTextColor;
        //顶部
        [self addSubview:self.xiangQingLable];
        [self.downView addSubview:self.mingChengLable];
        [self.downView addSubview:self.biaoYuLable];
        [self.downView addSubview:self.jieShaoLable];
        [self.downView addSubview:self.faXingLable];
        [self.downView addSubview:self.faXingPriceLable];
        [self.downView addSubview:self.guanWangLable];
        [self.downView addSubview:self.guanWangBtn];
        [self addSubview:self.sureBtn];
        [self addSubview:self.downView];

        [self.xiangQingLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).with.offset(SXRealValue(19));
            make.right.mas_equalTo(self.mas_right).with.offset(SXRealValue(-19));
            make.top.mas_equalTo(self.mas_top).with.offset((SYRealValue(26)));
            make.height.mas_equalTo((SYRealValue(25)));
        }];
        [self.downView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).with.offset(SXRealValue(19));
            make.top.mas_equalTo(self.xiangQingLable.mas_bottom).with.offset(TopRowHeight);
            make.right.mas_equalTo(self.mas_right).with.offset(SXRealValue(-19));
//            make.width.mas_equalTo((SYRealValue(309)));
//            make.height.mas_equalTo((SYRealValue(330)));
        }];
        [self.mingChengLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.downView.mas_left).with.offset(SXRealValue(0));
            make.right.mas_equalTo(self.downView.mas_right).with.offset(SXRealValue(0));
            make.top.mas_equalTo(self.downView.mas_top).with.offset((SYRealValue(0)));
            make.height.mas_equalTo((SYRealValue(25)));
        }];
        [self.biaoYuLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.downView.mas_left).with.offset(SXRealValue(0));
            make.right.mas_equalTo(self.downView.mas_right).with.offset(SXRealValue(0));
            make.top.mas_equalTo(self.mingChengLable.mas_bottom).with.offset(TopRowHeight);
            make.height.mas_equalTo((SYRealValue(25)));
        }];
        [self.jieShaoLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.downView.mas_left).with.offset(SXRealValue(0));
            make.right.mas_equalTo(self.downView.mas_right).with.offset(SXRealValue(0));
            make.top.mas_equalTo(self.biaoYuLable.mas_bottom).with.offset(TopRowHeight);
        }];
        [self.faXingLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.downView.mas_left).with.offset(SXRealValue(0));
            make.right.mas_equalTo(self.downView.mas_right).with.offset(SXRealValue(0));
            make.top.mas_equalTo(self.jieShaoLable.mas_bottom).with.offset(TopRowHeight);
            make.height.mas_equalTo((SYRealValue(25)));
        }];
        [self.faXingPriceLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.downView.mas_left).with.offset(SXRealValue(0));
            make.right.mas_equalTo(self.downView.mas_right).with.offset(SXRealValue(0));
            make.top.mas_equalTo(self.faXingLable.mas_bottom).with.offset(TopRowHeight);
            make.height.mas_equalTo((SYRealValue(25)));
        }];
        [self.guanWangLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.downView.mas_left).with.offset(SXRealValue(0));
            make.top.mas_equalTo(self.faXingPriceLable.mas_bottom).with.offset(TopRowHeight);
            make.height.mas_equalTo((SYRealValue(25)));
        }];
        [self.guanWangBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.guanWangLable.mas_right).with.offset(SXRealValue(5));
            make.centerY.equalTo(self.guanWangLable.mas_centerY);
            make.width.mas_equalTo((SYRealValue(200)));
            make.height.mas_equalTo((SYRealValue(25)));
        }];
        [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).with.offset(SXRealValue(17));
            make.right.mas_equalTo(self.mas_right).with.offset(SXRealValue(-17));
            make.top.mas_equalTo(self.downView.mas_bottom).with.offset((SYRealValue(10)));
            make.bottom.mas_equalTo(self.mas_bottom).with.offset((SYRealValue(-19)));
            make.height.mas_equalTo((SCREENWIDTH-(SXRealValue(34)))*40/309);
        }];
     
    }
    return self;
}

-(void)setModel:(BCMePDCListMode *)model{
    _model =model;
    self.xiangQingLable.text=@"PDC简介";
    self.mingChengLable.text=[NSString stringWithFormat:@"项目名称:%@",@"雷鹿财富"];
    self.biaoYuLable.text=[NSString stringWithFormat:@"标语:%@",@"雷鹿财富"];
    self.jieShaoLable.text=[NSString stringWithFormat:@"项目介绍:%@",@"雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财"];
    self.faXingLable.text =[NSString stringWithFormat:@"发行总量:%@",@"1000000000000000"];
    self.faXingPriceLable.text =[NSString stringWithFormat:@"发行价格:%@",@"2ES DFA SDF"];
    self.guanWangLable.text=@"官网";
    [self.guanWangBtn setTitle:@"money.leilook.com" forState:UIControlStateNormal];
    [self.sureBtn setTitle:@"知道了" forState:UIControlStateNormal];

}

#pragma mark - 官网加载按钮
-(void)guanWangBtnClick:(UIButton *)button{
    if (self.delegate && [self.delegate respondsToSelector:@selector(guanWangBtnClick:)]) {
        [self.delegate guanWangBtnClick:self.model];
    }
}
#pragma mark - 弹框知道了按钮
-(void)sureBtnClick:(UIButton *)button{
    if (self.delegate && [self.delegate respondsToSelector:@selector(sureBtnClick:)]) {
        [self.delegate sureBtnClick:self.model];
    }
}

@end
