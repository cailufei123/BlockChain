//
//  BCMeSurePayView.m
//  BlockChain
//
//  Created by Mac on 2018/5/30.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCMeSurePayView.h"
#import "BCMeChangeMoneyMode.h"

@interface BCMeSurePayView()

@property(nonatomic,strong)UIButton *backBtn;
@property(nonatomic,strong)UILabel *sureLable;//确认收款
@property(nonatomic,strong)UILabel *dizhiLable;//收款地址
@property(nonatomic,strong)UILabel *BTC;//收款地址
@property(nonatomic,strong)UILabel *dizhi;
@property(nonatomic,strong)UIView *line;
@property(nonatomic,strong)UIView *line1;
@property(nonatomic,strong)UIView *line2;
@property(nonatomic,strong)UIView *line3;
@property(nonatomic,strong)UIView *line4;
@property(nonatomic,strong)UILabel *zhuanZhangPrice;//转账金额地址
@property(nonatomic,strong)UILabel *zhuanZhang;
@property(nonatomic,strong)UILabel *tiXianLable;
@property(nonatomic,strong)UILabel *tiXian;
@property(nonatomic,strong)UILabel *ETH;
@property(nonatomic,strong)UILabel *beiZhuLable;
@property(nonatomic,strong)UILabel *beiZhu;

@property(nonatomic,strong)UIButton *toPayBtn;



@end

@implementation BCMeSurePayView

-(UILabel *)sureLable{
    if (!_sureLable) {
        _sureLable =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(15)) textAlignment:NSTextAlignmentCenter numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_sureLable];
    }
    return _sureLable;
}

-(UILabel *)dizhiLable{
    if (!_dizhiLable) {
        _dizhiLable =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//                [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_dizhiLable];
    }
    return _dizhiLable;
}
-(UILabel *)dizhi{
    if (!_dizhi) {
        _dizhi =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentLeft numberOfLines:0];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_dizhiLable];
    }
    return _dizhi;
}

-(UILabel *)zhuanZhangPrice{
    if (!_zhuanZhangPrice) {
        _zhuanZhangPrice =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//                [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_zhuanZhangPrice];
    }
    return _zhuanZhangPrice;
}
-(UILabel *)zhuanZhang{
    if (!_zhuanZhang) {
        _zhuanZhang =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_zhuanZhang];
    }
    return _zhuanZhang;
}
-(UILabel *)tiXianLable{
    if (!_tiXianLable) {
        _tiXianLable =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_tiXianLable];
    }
    return _tiXianLable;
}
-(UILabel *)tiXian{
    if (!_tiXian) {
        _tiXian =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_tiXian];
    }
    return _tiXian;
}

-(UIView *)line{
    if (!_line) {
        _line = [UIView getViewUserEnabled:NO backGroundColor:colorE5E7E9 tag:0 target:nil action:nil];
        //[Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_line1];
    }
    return _line;
}
-(UIView *)line1{
    if (!_line1) {
        _line1 = [UIView getViewUserEnabled:NO backGroundColor:colorE5E7E9 tag:0 target:nil action:nil];
        //[Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_line1];
    }
    return _line1;
}
-(UIView *)line2{
    if (!_line2) {
        _line2 = [UIView getViewUserEnabled:NO backGroundColor:colorE5E7E9 tag:0 target:nil action:nil];
        //[Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_line1];
    }
    return _line2;
}
-(UIView *)line3{
    if (!_line3) {
        _line3 = [UIView getViewUserEnabled:NO backGroundColor:colorE5E7E9 tag:0 target:nil action:nil];
        //[Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_line1];
    }
    return _line3;
}
-(UIView *)line4{
    if (!_line4) {
        _line4 = [UIView getViewUserEnabled:NO backGroundColor:colorE5E7E9 tag:0 target:nil action:nil];
        //[Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_line1];
    }
    return _line4;
}
-(UILabel *)beiZhuLable{
    if (!_beiZhuLable) {
        _beiZhuLable =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//                [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_beiZhuLable];
    }
    return _beiZhuLable;
}
-(UILabel *)beiZhu{
    if (!_beiZhu) {
        _beiZhu =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//                [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_beiZhu];
    }
    return _beiZhu;
}
-(UILabel *)BTC{
    if (!_BTC) {
        _BTC =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Medium", SXRealValue(13)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
        //        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_beiZhuLable];
    }
    return _BTC;
}
-(UILabel *)ETH{
    if (!_ETH) {
        _ETH =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Medium", SXRealValue(13)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
        //        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_beiZhuLable];
    }
    return _ETH;
}
-(UIButton *)toPayBtn{
    if (!_toPayBtn) {
        _toPayBtn = [UIButton getButtonTitleColor:naverTextColor titleFont:FONT(@"PingFangSC-Semibold", SXRealValue(16)) backGroundColor:colorB378D5 target:self action:@selector(toPayClick:)];
        [_toPayBtn  setHitEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -10)];//热区域
//        [Util roundBorderView:0 border:1 color:blackBColor view:_toPayBtn];
    }
    return _toPayBtn;
}
-(UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn = [UIButton getButtonTitleColor:naverTextColor titleFont:FONT(@"PingFangSC-Semibold", SXRealValue(16)) backGroundColor:nil target:self action:@selector(backClick:)];
        [_backBtn  setHitEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -10)];//热区域
//                [Util roundBorderView:0 border:1 color:blackBColor view:_backBtn];
    }
    return _backBtn;
}



-(instancetype)initWithFrame:(CGRect)frame{
    if (self =[super initWithFrame:frame]) {
        self.backgroundColor = naverTextColor;
        //self.userInteractionEnabled =YES;
        //顶部
        [self addSubview:self.backBtn];
        [self addSubview:self.sureLable];
        [self addSubview:self.dizhiLable];
        [self addSubview:self.dizhi];
        [self addSubview:self.line];
        [self addSubview:self.line1];
        [self addSubview:self.line2];
        [self addSubview:self.line3];
        [self addSubview:self.line4];
        [self addSubview:self.zhuanZhangPrice];
        [self addSubview:self.zhuanZhang];
        [self addSubview:self.tiXianLable];
        [self addSubview:self.tiXian];
        [self addSubview:self.beiZhuLable];
        [self addSubview:self.beiZhu];
        [self addSubview:self.toPayBtn];

        
        [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).with.offset(SXRealValue(15));
            make.top.mas_equalTo(self.mas_top).with.offset((SYRealValue(15)));
            make.width.mas_equalTo((SXRealValue(25)));
            make.height.mas_equalTo((SXRealValue(25)));
        }];
        [self.sureLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.backBtn.mas_right).with.offset(SXRealValue(10));
            make.top.mas_equalTo(self.mas_top).with.offset((SYRealValue(15)));
            make.right.mas_equalTo(self.mas_right).with.offset(SXRealValue(-35));
            make.height.mas_equalTo((SYRealValue(25)));
        }];
        [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).with.offset(SXRealValue(0));
            make.right.mas_equalTo(self.mas_right).with.offset(SXRealValue(0));
            make.top.mas_equalTo(self.sureLable.mas_bottom).with.offset((SYRealValue(15)));
            make.height.mas_equalTo((SYRealValue(0.6)));
        }];

        [self.dizhiLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).with.offset(SXRealValue(16));
            make.right.mas_equalTo(self.mas_right).with.offset(SXRealValue(-16));
            make.top.mas_equalTo(self.line.mas_bottom).with.offset((SYRealValue(15)));
            make.height.mas_equalTo((SYRealValue(25)));
        }];
        
        [self.dizhi mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).with.offset(SXRealValue(16));
            make.top.mas_equalTo(self.dizhiLable.mas_bottom).with.offset(SXRealValue(5));
            make.right.mas_equalTo(self.mas_right).with.offset(SXRealValue(-16));
            //make.height.mas_equalTo((SYRealValue(20)));
        }];
        [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).with.offset(SXRealValue(0));
            make.right.mas_equalTo(self.mas_right).with.offset(SXRealValue(0));
            make.top.mas_equalTo(self.dizhi.mas_bottom).with.offset((SYRealValue(0)));
            make.height.mas_equalTo((SYRealValue(0.6)));
        }];
        
        [self.zhuanZhangPrice mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).with.offset(SXRealValue(16));
            make.top.mas_equalTo(self.line1.mas_bottom).with.offset((SYRealValue(15)));
            make.width.mas_equalTo((SYRealValue(60)));
            make.height.mas_equalTo((SYRealValue(25)));
        }];
        [self.zhuanZhang mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.zhuanZhangPrice.mas_right).with.offset(SXRealValue(15));
            make.right.mas_equalTo(self.mas_right).with.offset(SXRealValue(-5));
            make.bottom.mas_equalTo(self.zhuanZhangPrice.mas_bottom).with.offset((SYRealValue(0)));
            make.height.mas_equalTo((SYRealValue(20)));
        }];
        
        [self.line2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).with.offset(SXRealValue(0));
            make.right.mas_equalTo(self.mas_right).with.offset(SXRealValue(0));
            make.top.mas_equalTo(self.zhuanZhangPrice.mas_bottom).with.offset((SYRealValue(15)));
            make.height.mas_equalTo((SYRealValue(0.6)));
        }];
        
        [self.tiXianLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).with.offset(SXRealValue(16));
            make.top.mas_equalTo(self.line2.mas_bottom).with.offset((SYRealValue(15)));
            make.width.mas_equalTo((SYRealValue(60)));
            make.height.mas_equalTo((SYRealValue(25)));
        }];
        [self.tiXian mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.tiXianLable.mas_right).with.offset(SXRealValue(15));
            make.right.mas_equalTo(self.mas_right).with.offset(SXRealValue(-5));
            make.bottom.mas_equalTo(self.tiXianLable.mas_bottom).with.offset((SYRealValue(0)));
            make.height.mas_equalTo((SYRealValue(20)));
        }];
        [self.line3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).with.offset(SXRealValue(0));
            make.right.mas_equalTo(self.mas_right).with.offset(SXRealValue(0));
            make.top.mas_equalTo(self.tiXianLable.mas_bottom).with.offset((SYRealValue(15)));
            make.height.mas_equalTo((SYRealValue(0.6)));
        }];
        
        [self.beiZhuLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).with.offset(SXRealValue(16));
            make.top.mas_equalTo(self.line3.mas_bottom).with.offset((SYRealValue(15)));
            make.width.mas_equalTo((SYRealValue(60)));
            make.height.mas_equalTo((SYRealValue(25)));
        }];
        [self.beiZhu mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.beiZhuLable.mas_right).with.offset(SXRealValue(15));
            make.right.mas_equalTo(self.mas_right).with.offset(SXRealValue(-5));
            make.bottom.mas_equalTo(self.beiZhuLable.mas_bottom).with.offset((SYRealValue(0)));
            make.height.mas_equalTo((SYRealValue(20)));
        }];
        [self.line4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).with.offset(SXRealValue(0));
            make.right.mas_equalTo(self.mas_right).with.offset(SXRealValue(0));
            make.top.mas_equalTo(self.beiZhuLable.mas_bottom).with.offset((SYRealValue(15)));
            make.height.mas_equalTo((SYRealValue(0.6)));
        }];
        [self.toPayBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.line4.mas_bottom).with.offset((SYRealValue(15)));
            make.left.mas_equalTo(self.mas_left).with.offset(SXRealValue(15));
            make.right.mas_equalTo(self.mas_right).with.offset(SXRealValue(-15));
            make.height.mas_equalTo((SCREEN_WIDTH-(SXRealValue(30)))*40/343);
//            make.bottom.mas_equalTo(self.mas_bottom).with.offset((SYRealValue(-5)));
        }];
        
        
    }
    return self;
}

-(void)setModel:(BCMeChangeMoneyMode *)model{
    _model =model;
    [self.backBtn setImage:[UIImage imageNamed:@"alertview_close"] forState:UIControlStateNormal];
    self.sureLable.text=@"确认信息";
    self.dizhiLable.text=@"收款人钱包地址";
    self.dizhi.text=[NSString stringWithFormat:@"%@",model.dizhi];
    self.zhuanZhangPrice.text=@"转账金额";
    self.zhuanZhang.text=[NSString stringWithFormat:@"%@ %@",model.zhuanZhangPrice,model.code];
    self.tiXianLable.text = @"提现费用";
    self.tiXian.text =[NSString stringWithFormat:@"%@ Ether",model.tiXianPrice];
    self.beiZhuLable.text =@"备注";
    self.beiZhu.text = model.beiZhu;
    [self.toPayBtn setTitle:@"立即付款" forState:UIControlStateNormal];
    self.toPayBtn.titleLabel.text =@"立即付款";
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    CGFloat cgFloat = self.toPayBtn.xmg_bottom;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(changeHeight:)]) {
        [self.delegate changeHeight:cgFloat];
    }
    
//    //    NSLog(@"xiangQingLable==%f",self.xiangQingLable.xmg_bottom);
//    //    NSLog(@"guanWangLable==%f",self.guanWangLable.xmg_bottom);
//    //    CGFloat height = self.xiangQingLable.xmg_bottom+TopRowHeight+self.guanWangLable.xmg_bottom;
//    CGFloat height = self.guanWangLable.xmg_bottom+(SYRealValue(10));
//    self.bigScrollView.contentSize = CGSizeMake(SCREEN_WIDTH-(SXRealValue(32+38)),height);
}



#pragma mark -立刻支付
-(void)toPayClick:(UIButton *)button{
    if (self.delegate && [self.delegate respondsToSelector:@selector(maskToPay)]) {
        [self.delegate maskToPay];
    }
}

-(void)backClick:(UIButton *)button{
        if (self.delegate && [self.delegate respondsToSelector:@selector(backClick)]) {
            [self.delegate backClick];
        }
}

@end
