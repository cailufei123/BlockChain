//
//  BCPDCListAlertView.m
//  BlockChain
//
//  Created by Mac on 2018/5/23.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCMePDCListAlertView.h"
#import "BCMePDCMode.h"

@interface BCMePDCListAlertView()

/** PDC详情名字*/
@property (nonatomic, strong)UILabel *xiangQingLable;

@property (nonatomic, strong)UIView *downView;

@property (nonatomic, strong)UIScrollView *bigScrollView;

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



@end
@implementation BCMePDCListAlertView

#define  TopRowHeight   (SYRealValue(20))  //字体间距

- (UIScrollView *)bigScrollView {
    if (!_bigScrollView) {
        _bigScrollView = [[UIScrollView alloc]init];
        //_bigScrollView.pagingEnabled = YES;
        _bigScrollView.userInteractionEnabled =YES;
        _bigScrollView.showsVerticalScrollIndicator = NO;
        _bigScrollView.showsHorizontalScrollIndicator = NO;
        //_bigScrollView.delegate = self;
//    [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_bigScrollView];

    }
    return _bigScrollView;
}

-(UILabel *)xiangQingLable{
    if (!_xiangQingLable) {
        _xiangQingLable =[UILabel LabelWithTextColor:color414754 textFont:FONT(@"PingFangSC-Semibold", SXRealValue(18)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_xiangQingLable];
    }
    return _xiangQingLable;
}
-(UIView *)downView{
    if (!_downView) {
        _downView = [[UIView alloc] init];
        _downView.userInteractionEnabled =YES;
        _downView.backgroundColor =naverTextColor;
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_downView];
    }
    return _downView;
}

-(UILabel *)mingChengLable{
    if (!_mingChengLable) {
        _mingChengLable =[UILabel LabelWithTextColor:color414754 textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_mingChengLable];
    }
    return _mingChengLable;
}

-(UILabel *)biaoYuLable{
    if (!_biaoYuLable) {
        _biaoYuLable =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentLeft numberOfLines:2];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_biaoYuLable];
    }
    return _biaoYuLable;
}
-(UILabel *)jieShaoLable{
    if (!_jieShaoLable) {
        _jieShaoLable =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentLeft numberOfLines:0];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_jieShaoLable];
    }
    return _jieShaoLable;
}
-(UILabel *)faXingLable{
    if (!_faXingLable) {
        _faXingLable =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentLeft numberOfLines:0];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_faXingLable];
    }
    return _faXingLable;
}
-(UILabel *)faXingPriceLable{
    if (!_faXingPriceLable) {
        _faXingPriceLable =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentLeft numberOfLines:0];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_faXingPriceLable];
    }
    return _faXingPriceLable;
}
-(UILabel *)guanWangLable{
    if (!_guanWangLable) {
        _guanWangLable =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentLeft numberOfLines:0];
        _guanWangLable.userInteractionEnabled =YES;
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_guanWangLable];
    }
    return _guanWangLable;
}
-(UIButton *)guanWangBtn{
    if (!_guanWangBtn) {
        _guanWangBtn = [UIButton getButtonTitleColor:color2B73EE titleFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) backGroundColor:naverTextColor target:self action:@selector(guanWangBtnClick:)];
        _guanWangBtn.userInteractionEnabled= YES;
        _guanWangBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
        [_guanWangBtn  setHitEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -10)];//热区域
        [Util roundBorderView:SXRealValue(2) border:0 color:color2B73EE view:_guanWangBtn];
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
        [Util roundBorderView:SXRealValue(2) border:0 color:color2B73EE view:_sureBtn];
    }
    return _sureBtn;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self =[super initWithFrame:frame]) {
        self.backgroundColor = naverTextColor;
//        self.userInteractionEnabled =YES;
        //顶部
        [self addSubview:self.xiangQingLable];
        [self addSubview:self.bigScrollView];
        [self.downView addSubview:self.mingChengLable];
        [self.downView addSubview:self.biaoYuLable];
        [self.downView addSubview:self.jieShaoLable];
        [self.downView addSubview:self.faXingLable];
        [self.downView addSubview:self.faXingPriceLable];
        [self.downView addSubview:self.guanWangLable];
        [self.downView addSubview:self.guanWangBtn];
        [self.bigScrollView addSubview:self.downView];
        [self addSubview:self.sureBtn];
        [self insertSubview:self.sureBtn aboveSubview:self.downView];
        
        //self.frame = CGRectMake(0, 0, SXRealValue(343), (SYRealValue(467)));
        [self.xiangQingLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).with.offset(SXRealValue(19));
            make.right.mas_equalTo(self.mas_right).with.offset(SXRealValue(-19));
            make.top.mas_equalTo(self.mas_top).with.offset((SYRealValue(26)));
            make.height.mas_equalTo((SYRealValue(25)));
        }];
       
        [self.bigScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).with.offset(SXRealValue(19));
            make.top.mas_equalTo(self.xiangQingLable.mas_bottom).with.offset(TopRowHeight);
//            make.width.mas_equalTo(SCREENWIDTH-(SXRealValue(32+38)));
            make.right.mas_equalTo(self.mas_right).with.offset(SXRealValue(-19));
            make.bottom.mas_equalTo(self.sureBtn.mas_top).with.offset(0);
        }];
        [self.downView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.bigScrollView.mas_left).with.offset(0);
            make.top.mas_equalTo(self.bigScrollView.mas_top).with.offset(0);
//            make.right.mas_equalTo(self.bigScrollView.mas_right).with.offset(SXRealValue(0));
            make.width.mas_equalTo(SCREEN_WIDTH-(SXRealValue(32+38)));
            // make.height.mas_equalTo((SYRealValue(330)));
        }];
        
        [self.mingChengLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.downView.mas_left).with.offset(SXRealValue(0));
            make.right.mas_equalTo(self.downView.mas_right).with.offset(SXRealValue(0));
            make.top.mas_equalTo(self.downView.mas_top).with.offset((SYRealValue(0)));
            make.height.mas_equalTo((SYRealValue(25)));
//            make.width.mas_equalTo(SCREENWIDTH-SXRealValue(32+38));

        }];
        [self.biaoYuLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.downView.mas_left).with.offset(SXRealValue(0));
            make.right.mas_equalTo(self.downView.mas_right).with.offset(SXRealValue(0));
            make.top.mas_equalTo(self.mingChengLable.mas_bottom).with.offset(TopRowHeight);
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
            make.bottom.mas_equalTo(self.downView.mas_bottom).with.offset(0);
        }];
        [self.guanWangBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.guanWangLable.mas_right).with.offset(SXRealValue(5));
            make.centerY.equalTo(self.guanWangLable.mas_centerY);
            make.width.mas_equalTo((SXRealValue(130)));
            make.height.mas_equalTo((SYRealValue(25)));
            //make.bottom.mas_equalTo(self.bigScrollView.mas_bo).with.offset((SYRealValue(26)));
        }];
        [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).with.offset(SXRealValue(17));
            make.right.mas_equalTo(self.mas_right).with.offset(SXRealValue(-17));
            make.bottom.mas_equalTo(self.mas_bottom).with.offset((SYRealValue(-19)));
            make.height.mas_equalTo((SCREENWIDTH-(SXRealValue(34)))*40/309);
        }];
     
    }
    return self;
}

-(void)setModel:(BCMePDCMode *)model{
    _model =model;
    [self layoutIfNeeded];
    self.xiangQingLable.text=[NSString stringWithFormat:@"%@详情",model.uci.code];
    self.mingChengLable.text=[NSString stringWithFormat:@"项目名称: %@",model.partner.projectName];
    self.biaoYuLable.text=[NSString stringWithFormat:@"标语: %@",model.partner.slogan];
    self.jieShaoLable.text=[NSString stringWithFormat:@"项目介绍: %@",model.partner.brief];
    self.faXingLable.text =[NSString stringWithFormat:@"发行总量: %@",model.partner.pubCount];
    self.faXingPriceLable.text =[NSString stringWithFormat:@"发行价格: 1ETH=%.1f%@",model.partner.price.floatValue,model.partner.code];
    self.guanWangLable.text=@"官网:";
    [self.guanWangBtn setTitle:model.partner.site forState:UIControlStateNormal];
    [self.sureBtn setTitle:@"知道了" forState:UIControlStateNormal];
    [self setNeedsLayout];
    [self layoutIfNeeded];
//    NSLog(@"xiangQingLable==%f",self.xiangQingLable.xmg_bottom);
//    NSLog(@"guanWangLable==%f",self.guanWangLable.xmg_bottom);
//    CGFloat height = self.xiangQingLable.xmg_bottom+TopRowHeight+self.guanWangLable.xmg_bottom;
    CGFloat height = self.guanWangLable.xmg_bottom+(SYRealValue(10));
     self.bigScrollView.contentSize = CGSizeMake(SCREEN_WIDTH-(SXRealValue(32+38)),height);

    
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
