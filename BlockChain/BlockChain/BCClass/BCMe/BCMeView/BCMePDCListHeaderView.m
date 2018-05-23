//
//  BCMePDCListHeaderView.m
//  BlockChain
//
//  Created by Mac on 2018/5/23.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//
//PDC总数view
#import "BCMePDCListHeaderView.h"
#import "BCMePDCListMode.h"


@interface BCMePDCListHeaderView()

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

@property (nonatomic, strong)UIButton *xiaQingBtn;



@property(nonatomic,strong)CAGradientLayer *gradientLayer;

@end

@implementation BCMePDCListHeaderView
//最大高度
#define HeaderViewHeight   ((SYRealValue(67+33+23))+kTopHeight+(SYRealValue(235)))  //顶部view高度
//顶部总体高度
#define upBigViewHeight   ((SYRealValue(67+33+23)))
//顶部总体高度


-(UIView *)bigView{
    if (!_bigView) {
        _bigView = [[UIView alloc] init];
        //_upBigView.backgroundColor =[UIColor redColor];
        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_bigView];
    }
    return _bigView;
}
-(UIView *)upBigView{
    if (!_upBigView) {
        _upBigView = [[UIView alloc] init];
        
        //_upBigView.backgroundColor =[UIColor redColor];
          [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_upBigView];
    }
    return _upBigView;
}

-(UILabel *)price{
    if (!_price) {
        _price =[UILabel LabelWithTextColor:naverTextColor textFont:FONT(@"PingFangSC-Medium", SXRealValue(48)) textAlignment:NSTextAlignmentCenter numberOfLines:1];
        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_price];
    }
    return _price;
}
-(UIView *)smallBgView{
    if (!_smallBgView) {
        _smallBgView = [[UIView alloc] init];
        //_smallBgView.backgroundColor =colorB0ADFC;
        _smallBgView.backgroundColor = [colorB0ADFC colorWithAlphaComponent:0.6];
        [Util roundBorderView:SXRealValue(3) border:1 color:[UIColor blackColor] view:_smallBgView];
    }
    return _smallBgView;
}

-(UILabel *)yuePrice{
    if (!_yuePrice) {
        _yuePrice =[UILabel LabelWithTextColor:naverTextColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(20)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_yuePrice];
    }
    return _yuePrice;
}
-(UIView *)downView{
    if (!_downView) {
        _downView = [[UIView alloc] init];
        _downView.backgroundColor =naverTextColor;
        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_downView];
    }
    return _downView;
}

-(UILabel *)label1{
    if (!_label1) {
        _label1 =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Medium", SXRealValue(16)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_label1];
    }
    return _label1;
}
-(UILabel *)label2{
    if (!_label2) {
        _label2 =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Medium", SXRealValue(14)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_label2];
    }
    return _label2;
}

-(UILabel *)label3{
    if (!_label3) {
        _label3 =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Medium", SXRealValue(14)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_label3];
    }
    return _label3;
}
-(UILabel *)label4{
    if (!_label4) {
        _label4 =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Medium", SXRealValue(14)) textAlignment:NSTextAlignmentLeft numberOfLines:0];
        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_label4];
    }
    return _label4;
}

-(UIButton *)xiaQingBtn{
    if (!_xiaQingBtn) {
        _xiaQingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_xiaQingBtn setTitleColor:color2B73EE forState:UIControlStateNormal];
        _xiaQingBtn.titleLabel.font = FONT(@"PingFangSC-Medium", SXRealValue(12));
        _xiaQingBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        _xiaQingBtn.titleLabel.textColor =color2B73EE;
        //[_xiaQingBtn setBackgroundColor:color9164D6];
        [_xiaQingBtn  setHitEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -10)];//热区域
        //给button添加下划线
        NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:@"详情"];
        NSRange titleRange = {0,[title length]};
        [title addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:titleRange];
        [_xiaQingBtn setAttributedTitle:title
                                   forState:UIControlStateNormal];
        [_xiaQingBtn setTitleColor:color2B73EE forState:UIControlStateNormal];
        [_xiaQingBtn addTarget:self action:@selector(xiaQingBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [Util roundBorderView:SXRealValue(2) border:1 color:color2B73EE view:_xiaQingBtn];
    }
    return _xiaQingBtn;
}

//
//-(UIView *)view{
//    if (!_view) {
//        _view = [[UIView alloc] init];
//        _view.backgroundColor =naverTextColor;
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_view];
//    }
//    return _view;
//}
//
//-(UIImageView *)QRImage{
//    if (!_QRImage) {
//        _QRImage = [[UIImageView alloc] init];
//        //_myIcon.contentMode = UIViewContentModeScaleAspectFill;
//        //[Util roundBorderView:SXRealValue(60/2) border:0 color:nil view:_ziChanIcon];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_QRImage];
//        
//    }
//    return _QRImage;
//}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self =[super initWithFrame:frame]) {
        //顶部
        self.bigView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        self.upBigView.frame = CGRectMake(0, kTopHeight, SCREENWIDTH, upBigViewHeight);
        [self.upBigView addSubview:self.price];
        [self.upBigView addSubview:self.smallBgView];
        [self.smallBgView addSubview:self.yuePrice];
        [self addSubview:self.bigView];
        [self addSubview:self.upBigView];
        [self addSubview:self.downView];
        [self.downView addSubview:self.label1];
        [self.downView addSubview:self.label2];
        [self.downView addSubview:self.label3];
        [self.downView addSubview:self.label4];
        [self.downView addSubview:self.xiaQingBtn];
        

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
            make.left.mas_equalTo(self.mas_left).with.offset(0);
            make.top.mas_equalTo(self.upBigView.mas_bottom).with.offset(0);
            make.right.mas_equalTo(self.mas_right).with.offset(0);
            make.bottom.mas_equalTo(self.mas_bottom).with.offset(0);
        }];
        
        [self.label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.downView.mas_left).with.offset(SXRealValue(18));
            make.right.mas_equalTo(self.downView.mas_right).with.offset(SXRealValue(-18));
            make.top.mas_equalTo(self.downView.mas_top).with.offset((SYRealValue(5)));
            make.height.mas_equalTo((SYRealValue(44)));
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
            make.left.mas_equalTo(self.downView.mas_left).with.offset(SXRealValue(18));
            make.top.mas_equalTo(self.label4.mas_bottom).with.offset((SYRealValue(5)));
            make.bottom.mas_equalTo(self.downView.mas_bottom).with.offset((SYRealValue(-2)));
            make.width.mas_equalTo((SYRealValue(40)));
            make.height.mas_equalTo((SYRealValue(20)));
        }];
        [self setGradientLayer];
        
//        [self.QRCodeBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(self.QRCode.mas_bottom).with.offset(SYRealValue(6));
//            make.centerX.equalTo(self.bigView.mas_centerX);
//            make.width.mas_equalTo(SCREENWIDTH-2*(SXRealValue(40)));
//            make.height.mas_equalTo((SYRealValue(40)));
//        }];
//        [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(self.QRCodeBtn1.mas_bottom).with.offset(SYRealValue(17));
//            make.centerX.equalTo(self.bigView.mas_centerX);
//            make.width.mas_equalTo(SCREENWIDTH-2*(SXRealValue(40)));
//            make.height.mas_equalTo(SCREENWIDTH-2*(SXRealValue(40))*277/296);
//        }];
//        [self.QRImage mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(self.view.mas_top).with.offset(SYRealValue(12));
//            make.centerX.equalTo(self.view.mas_centerX);
//            make.width.mas_equalTo(SCREENWIDTH-2*(SXRealValue(40+35)));
//            make.height.mas_equalTo((SCREENWIDTH-2*(SXRealValue(40+35))*221/228));
//        }];
//        [self.QRCodeBtn2 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(self.QRImage.mas_bottom).with.offset(SYRealValue(12));
//            make.centerX.equalTo(self.bigView.mas_centerX);
//        }];
//        [self.message mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(self.view.mas_bottom).with.offset((SYRealValue(10)));
//            make.centerX.equalTo(self.bigView.mas_centerX);
//            make.width.mas_equalTo(SCREENWIDTH-2*(SXRealValue(40)));
//            make.height.mas_equalTo((SYRealValue(58)));
//        }];
        
    }
    return self;
}


-(void)setModel:(BCMePDCListMode *)model{
    _model =model;
//    if (model!=nil) {
    self.price.text=[NSString stringWithFormat:@"%.4f",0.124123123];
    self.yuePrice.text=[NSString stringWithFormat:@"≈ ¥%@",@"1000000"];
    self.label1.text=@"PDC简介";
    self.label2.text=[NSString stringWithFormat:@"项目名称:%@",@"雷鹿财富"];
    self.label3.text=[NSString stringWithFormat:@"标语:%@",@"雷鹿财富"];
    self.label4.text=[NSString stringWithFormat:@"项目介绍:%@",@"雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富雷鹿财富"];
    [self.xiaQingBtn setTitle:@"详情" forState:UIControlStateNormal];
    
//        self.QRCode.text =@"asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf";   //传递code码
//        [self.QRCodeBtn1 setTitle:@"复制收款地址" forState:UIControlStateNormal];
//        self.QRImage.image =[UIImage imageNamed:@"二维码"];
//
//
//        [self.QRCodeBtn2 setTitle:@"保存二维码到手机" forState:UIControlStateNormal];
//        self.message.text =@"温馨提示:改地址仅用于接收ETH和ERC20 Token,请不要向该地址发送不符合ERC20标准的Token";
//    }else{
//       
//    }
}

#pragma 点击项目介绍详情
-(void)xiaQingBtnClick{
        if (self.delegate && [self.delegate respondsToSelector:@selector(xiaQingBtnClickWithModel:)]) {
            [self.delegate xiaQingBtnClickWithModel:self.model];
        }
}

#pragma 保存二维码到手机
//-(void)moreTangGuoBtnClick:(UIButton *)button{
    //    if (self.delegate && [self.delegate respondsToSelector:@selector(moreTangGuoBtnClick)]) {
    //        [self.delegate moreTangGuoBtnClick];
    //    }
    
//}

-(void)setGradientLayer{
    //初始化CAGradientlayer对象，使它的大小为UIView的大小
    self.gradientLayer = [CAGradientLayer layer];
    self.gradientLayer.frame = self.bigView.bounds;
    //将CAGradientlayer对象添加在我们要设置背景色的视图的layer层
    [self.bigView.layer addSublayer:self.gradientLayer];
    //设置渐变区域的起始和终止位置（范围为0-1）
    self.gradientLayer.startPoint = CGPointMake(0, 0);
    self.gradientLayer.endPoint = CGPointMake(0, 1);
    //设置颜色数组
    self.gradientLayer.colors = @[(__bridge id)color5E4FC9.CGColor,
                                  (__bridge id)colorC483FB.CGColor];
    //设置颜色分割点（范围：0-1）
    self.gradientLayer.locations = @[@(0.5f), @(1.0f)];
}
@end
