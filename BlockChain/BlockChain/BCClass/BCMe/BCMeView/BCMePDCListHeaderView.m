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

@property (nonatomic, strong)UIView *upview1;
@property (nonatomic, strong)UIView *upBigView;
@property (nonatomic, strong)UIButton *backBtn;
/** 提示*/
@property (nonatomic, strong)UILabel *message;


/** 二维码正方形view*/
@property (nonatomic, strong)UIView *view;
/** 二维码*/
@property (nonatomic, strong)UIImageView *QRImage;

@end

@implementation BCMePDCListHeaderView

//-(UIView *)bigView{
//    if (!_bigView) {
//        _bigView = [[UIView alloc] init];
//        _bigView.backgroundColor =bagColor;
//        //  [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_downView];
//    }
//    return _bigView;
//}
//-(UILabel *)QRCode{
//    if (!_QRCode) {
//        _QRCode =[UILabel LabelWithTextColor:color484848 textFont:FONT(@"PingFangSC-Regular", SXRealValue(14)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_QRCode];
//    }
//    return _QRCode;
//}
//-(UIButton *)QRCodeBtn1{
//    if (!_QRCodeBtn1) {
//        _QRCodeBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
//        [_QRCodeBtn1 setTitleColor:naverTextColor forState:UIControlStateNormal];
//        _QRCodeBtn1.titleLabel.font = FONT(@"PingFangSC-Regular", SXRealValue(14));
//        _QRCodeBtn1.titleLabel.textAlignment = NSTextAlignmentCenter;
//        [_QRCodeBtn1 setBackgroundColor:color9164D6];
//        [_QRCodeBtn1  setHitEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -10)];//热区域
//        [Util roundBorderView:SXRealValue(2) border:1 color:[UIColor blackColor] view:_QRCodeBtn1];
//    }
//    return _QRCodeBtn1;
//}
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
//        [self.bigView addSubview:self.QRCode];
//        [self.bigView addSubview:self.QRCodeBtn1];
//        [self.bigView addSubview:self.view];
//        [self.view addSubview:self.QRImage];
//        [self.bigView addSubview:self.QRCodeBtn2];
//        [self.bigView addSubview:self.message];
//        [self addSubview:self.bigView];
//
//        [self.bigView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(self.mas_left).with.offset(0);
//            make.top.mas_equalTo(self.mas_top).with.offset(0);
//            make.right.mas_equalTo(self.mas_right).with.offset(0);
//            make.bottom.mas_equalTo(self.mas_bottom).with.offset(0);
//        }];
//        [self.QRCode mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(self.bigView.mas_top).with.offset(SYRealValue(20));
//            make.centerX.equalTo(self.bigView.mas_centerX);
//            make.width.mas_equalTo(SCREENWIDTH-2*(SXRealValue(27)));
//            make.height.mas_equalTo((SCREENWIDTH-2*(SXRealValue(27)))*66/320);
//        }];
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
    if (model!=nil) {
//        self.QRCode.text =@"asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf";   //传递code码
//        [self.QRCodeBtn1 setTitle:@"复制收款地址" forState:UIControlStateNormal];
//        self.QRImage.image =[UIImage imageNamed:@"二维码"];
//
//
//        [self.QRCodeBtn2 setTitle:@"保存二维码到手机" forState:UIControlStateNormal];
//        self.message.text =@"温馨提示:改地址仅用于接收ETH和ERC20 Token,请不要向该地址发送不符合ERC20标准的Token";
    }else{
       
    }
}

#pragma 复制收款地址
//-(void)tangGuoBtnClick:(UIButton *)button{
    //    if (self.delegate && [self.delegate respondsToSelector:@selector(tangGuoBtnClick)]) {
    //        [self.delegate tangGuoBtnClick];
    //    }
    
//}
#pragma 保存二维码到手机
//-(void)moreTangGuoBtnClick:(UIButton *)button{
    //    if (self.delegate && [self.delegate respondsToSelector:@selector(moreTangGuoBtnClick)]) {
    //        [self.delegate moreTangGuoBtnClick];
    //    }
    
//}
@end
