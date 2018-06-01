//
//  BCMeQRCodeView.m
//  BlockChain
//
//  Created by Mac on 2018/5/23.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//
//二维码view
#import "BCMeQRCodeView.h"
#import "BCMeModel.h"
#import "KMQRCode.h"


@interface BCMeQRCodeView()

@property (nonatomic, strong)UIView *bigView;


/** 二维码正方形view*/
@property (nonatomic, strong)UIView *view;
/** 二维码*/
@property (nonatomic, strong)UIImageView *QRImage;

/** 提示*/
@property (nonatomic, strong)UILabel *message;

@end
@implementation BCMeQRCodeView

-(UIView *)bigView{
    if (!_bigView) {
        _bigView = [[UIView alloc] init];
        _bigView.backgroundColor =bagColor;
        //  [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_downView];
    }
    return _bigView;
}
-(UILabel *)QRCode{
    if (!_QRCode) {
        _QRCode =[UILabel LabelWithTextColor:color484848 textFont:FONT(@"PingFangSC-Regular", SXRealValue(14)) textAlignment:NSTextAlignmentCenter numberOfLines:2];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_QRCode];
    }
    return _QRCode;
}
-(UIButton *)QRCodeBtn1{
    if (!_QRCodeBtn1) {
        _QRCodeBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_QRCodeBtn1 setTitleColor:naverTextColor forState:UIControlStateNormal];
        _QRCodeBtn1.titleLabel.font = FONT(@"PingFangSC-Semibold", SXRealValue(14));
        _QRCodeBtn1.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_QRCodeBtn1 setBackgroundColor:color9164D6];
        [_QRCodeBtn1  setHitEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -10)];//热区域
        [Util roundBorderView:SXRealValue(2) border:0 color:[UIColor blackColor] view:_QRCodeBtn1];
    }
    return _QRCodeBtn1;
}

-(UIView *)view{
    if (!_view) {
        _view = [[UIView alloc] init];
        _view.backgroundColor =naverTextColor;
//          [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_view];
    }
    return _view;
}

-(UIImageView *)QRImage{
    if (!_QRImage) {
        _QRImage = [[UIImageView alloc] init];
        //_myIcon.contentMode = UIViewContentModeScaleAspectFill;
        //[Util roundBorderView:SXRealValue(60/2) border:0 color:nil view:_ziChanIcon];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_QRImage];
        
    }
    return _QRImage;
}


-(UIButton *)QRCodeBtn2{
    if (!_QRCodeBtn2) {
        _QRCodeBtn2 = [UIButton getButtonTitleColor:color484848 titleFont:FONT(@"PingFangSC-Regular", SXRealValue(12)) backGroundColor:nil target:self action:nil];
        _QRCodeBtn2.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_QRCodeBtn2  setHitEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -10)];//热区域
        [Util roundBorderView:SXRealValue(2) border:0 color:[UIColor blackColor] view:_QRCodeBtn2];
    }
    return _QRCodeBtn2;
}
-(UILabel *)message{
    if (!_message) {
        _message =[UILabel LabelWithTextColor:color000000 textFont:FONT(@"PingFangSC-Regular", SXRealValue(10)) textAlignment:NSTextAlignmentLeft numberOfLines:2];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_message];
    }
    return _message;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self =[super initWithFrame:frame]) {
        //顶部
        [self.bigView addSubview:self.QRCode];
        [self.bigView addSubview:self.QRCodeBtn1];
        [self.bigView addSubview:self.view];
        [self.view addSubview:self.QRImage];
        [self.bigView addSubview:self.QRCodeBtn2];
        [self.bigView addSubview:self.message];
        [self addSubview:self.bigView];

        [self.bigView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).with.offset(0);
            make.top.mas_equalTo(self.mas_top).with.offset(0);
            make.right.mas_equalTo(self.mas_right).with.offset(0);
            make.bottom.mas_equalTo(self.mas_bottom).with.offset(0);
        }];
        [self.QRCode mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.bigView.mas_top).with.offset(SYRealValue(20));
            make.centerX.equalTo(self.bigView.mas_centerX);
            make.width.mas_equalTo(SCREENWIDTH-2*(SXRealValue(50)));
            make.height.mas_equalTo((SCREENWIDTH-2*(SXRealValue(50)))*66/320);
        }];
        [self.QRCodeBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.QRCode.mas_bottom).with.offset(SYRealValue(6));
            make.centerX.equalTo(self.bigView.mas_centerX);
            make.width.mas_equalTo(SCREENWIDTH-2*(SXRealValue(40)));
            make.height.mas_equalTo((SYRealValue(40)));
        }];
        [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.QRCodeBtn1.mas_bottom).with.offset(SYRealValue(17));
            make.centerX.equalTo(self.bigView.mas_centerX);
            make.width.mas_equalTo(SCREENWIDTH-2*(SXRealValue(40)));
            make.height.mas_equalTo(SCREENWIDTH-2*(SXRealValue(40))*277/296);
        }];
        [self.QRImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view.mas_top).with.offset(SYRealValue(12));
            make.centerX.equalTo(self.view.mas_centerX);
            make.width.mas_equalTo(SCREENWIDTH-2*(SXRealValue(40+35)));
            make.height.mas_equalTo((SCREENWIDTH-2*(SXRealValue(40+35))*221/228));
        }];
        [self.QRCodeBtn2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.QRImage.mas_bottom).with.offset(SYRealValue(12));
            make.centerX.equalTo(self.bigView.mas_centerX);
        }];
        [self.message mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view.mas_bottom).with.offset((SYRealValue(10)));
            make.centerX.equalTo(self.bigView.mas_centerX);
            make.width.mas_equalTo(SCREENWIDTH-2*(SXRealValue(40)));
            make.height.mas_equalTo((SYRealValue(58)));
        }];
        [self setNeedsLayout];
        [self layoutIfNeeded];
        
    }
    return self;
}

-(void)setModel:(BCMeModel *)model{
    _model =model;
    if (model!=nil) {
            self.QRCode.text =loginMe.token;   //传递code码
        if (model.isShouKuan==YES) {
            [self.QRCodeBtn1 setTitle:@"复制收款码" forState:UIControlStateNormal];
            [self.QRCodeBtn2 setTitle:@"保存到手机" forState:UIControlStateNormal];
        }else{
            [self.QRCodeBtn1 setTitle:@"复制收款地址" forState:UIControlStateNormal];
            [self.QRCodeBtn2 setTitle:@"保存二维码到手机" forState:UIControlStateNormal];
        }
        [self addAttributeWithBtn:self.QRCodeBtn2 Title:self.QRCodeBtn2.currentTitle];
        self.message.text =@"温馨提示:改地址仅用于接收ETH和ERC20 Token,请不要向该地址发送不符合ERC20标准的Token";
        //生成二维码
        self.QRImage.image =model.Qimage;
    }
}

#pragma 复制收款地址
-(void)tangGuoBtnClick:(UIButton *)button{
//    if (self.delegate && [self.delegate respondsToSelector:@selector(tangGuoBtnClick)]) {
//        [self.delegate tangGuoBtnClick];
//    }

}
#pragma mark -保存二维码到手机
-(void)QRCodeBtn2Click:(UIButton *)button{
    //    if (self.delegate && [self.delegate respondsToSelector:@selector(moreTangGuoBtnClick)]) {
    //        [self.delegate moreTangGuoBtnClick];
    //    }
}
-(void)addAttributeWithBtn:(UIButton *)button Title:(NSString *)message{
    //给button添加下划线
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:message];
    NSRange titleRange = {0,[title length]};
    [title addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:titleRange];
    [button setAttributedTitle:title
                               forState:UIControlStateNormal];
}
//[colorFilter setValue:[CIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1] forKey:@"inputColor0"];
//[colorFilter setValue:[CIColor colorWithRed:129/255.0 green:0/255.0 blue:224/255.0 alpha:1] forKey:@"inputColor1"];





@end
