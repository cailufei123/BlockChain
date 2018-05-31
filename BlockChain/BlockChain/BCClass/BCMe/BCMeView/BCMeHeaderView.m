//
//  BCMeHeaderView.m
//  BlockChain
//
//  Created by 吴博怡 on 2018/5/22.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCMeHeaderView.h"
#import "BCMeModel.h"


@interface BCMeHeaderView()
//顶部

@property (nonatomic, strong)UIView *upView;
@property (nonatomic, strong)UIView *middleView;
@property (nonatomic, strong)UIView *downView;

/** 我的图片*/
@property (nonatomic, strong)UIImageView *myIcon;
/** 我的名字*/
@property (nonatomic, strong)UILabel *myName;
/** 地址*/
@property (nonatomic, strong)UILabel *myAddress;
/** 二维码*/
@property (nonatomic, strong)UIButton *QRCode;

//中部
/** 资产icon*/
@property (nonatomic, strong)UIImageView *ziChanIcon;
/** 总资产lable1*/
@property (nonatomic, strong)UILabel * zongLable1;
/** 总资产lable2*/
@property (nonatomic, strong)UILabel * zongLable2;
/**分割线线*/
@property (nonatomic, strong)UIView *separatorLine;
@property (nonatomic, strong)UIView *separatorLine1;

//底部
/** 糖果记录*/
@property (nonatomic, strong)UIButton *tangGuoBtn;
/** 更多糖果*/
@property (nonatomic, strong)UIButton *moreTangGuoBtn;


@end

@implementation BCMeHeaderView

-(UIView *)upView{
    if (!_upView) {
        _upView = [[UIView alloc] init];
        _upView.backgroundColor = naverTextColor;
    }
    return _upView;
}
-(UIView *)middleView{
    if (!_middleView) {
        _middleView = [[UIView alloc] init];
        _middleView.backgroundColor = naverTextColor;
    }
    return _middleView;
}
-(UIView *)downView{
    if (!_downView) {
        _downView = [[UIView alloc] init];
        _downView.backgroundColor = naverTextColor;
    }
    return _downView;
}

-(UIImageView *)myIcon{
    if (!_myIcon) {
        _myIcon = [[UIImageView alloc] init];
        //_myIcon.contentMode = UIViewContentModeScaleAspectFill;
        [Util roundBorderView:SXRealValue(60/2) border:0 color:nil view:_myIcon];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_myIcon];

    }
    return _myIcon;
}


-(UILabel *)myName{
    if (!_myName) {
        _myName =[UILabel LabelWithTextColor:bkColor textFont:FONT(@"PingFangSC-Semibold", SXRealValue(19)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
                //[Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_myName];
    }
    return _myName;
}
-(UILabel *)myAddress{
    if (!_myAddress) {
        _myAddress =[UILabel LabelWithTextColor:color484848 textFont:FONT(@"PingFangSC-Regular", SXRealValue(11)) textAlignment:NSTextAlignmentLeft numberOfLines:2];
//                [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_myAddress];
    }
    return _myAddress;
}
-(UILabel *)zongLable1{
    if (!_zongLable1) {
        _zongLable1 =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(19)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//                [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_zongLable1];
    }
    return _zongLable1;
}
-(UILabel *)zongLable2{
    if (!_zongLable2) {
        _zongLable2 =[UILabel LabelWithTextColor:colorD35353 textFont:FONT(@"PingFangSC-Regular", SXRealValue(19)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//                [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_zongLable2];
    }
    return _zongLable2;
}

-(UIView *)separatorLine{
    if (!_separatorLine) {
        _separatorLine = [[UIView alloc] init];
        _separatorLine.backgroundColor =colorE5E7E9;
        //  [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_downView];
    }
    return _separatorLine;
}
-(UIView *)separatorLine1{
    if (!_separatorLine1) {
        _separatorLine1 = [[UIView alloc] init];
        _separatorLine1.backgroundColor =colorE5E7E9;
        //  [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_downView];
    }
    return _separatorLine1;
}

-(UIImageView *)ziChanIcon{
    if (!_ziChanIcon) {
        _ziChanIcon = [[UIImageView alloc] init];
        //_myIcon.contentMode = UIViewContentModeScaleAspectFill;
        //[Util roundBorderView:SXRealValue(60/2) border:0 color:nil view:_ziChanIcon];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_ziChanIcon];
        
    }
    return _ziChanIcon;
}
-(UIButton *)tangGuoBtn{
    if (!_tangGuoBtn) {
        _tangGuoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_tangGuoBtn setTitleColor:naverTextColor forState:UIControlStateNormal];
        _tangGuoBtn.titleLabel.font = FONT(@"PingFangSC-Semibold", SXRealValue(15));
        _tangGuoBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_tangGuoBtn setBackgroundColor:colorB378D5];
        [_tangGuoBtn  setHitEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -10)];//热区域
        [_tangGuoBtn addTarget:self action:@selector(tangGuoBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_tangGuoBtn setTitle:@"糖果记录" forState:UIControlStateNormal];
        [Util roundBorderView:SXRealValue(2) border:0 color:[UIColor blackColor] view:_tangGuoBtn];
    }
    return _tangGuoBtn;
}
-(UIButton *)moreTangGuoBtn{
    if (!_moreTangGuoBtn) {
        _moreTangGuoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_moreTangGuoBtn setTitleColor:color7B7B7B forState:UIControlStateNormal];
        _moreTangGuoBtn.titleLabel.font = FONT(@"PingFangSC-Semibold", SXRealValue(15));
        _moreTangGuoBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_moreTangGuoBtn setBackgroundColor:naverTextColor];
        [_moreTangGuoBtn  setHitEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -10)];//热区域
        [_moreTangGuoBtn addTarget:self action:@selector(moreTangGuoBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_moreTangGuoBtn setTitle:@"更多糖果" forState:UIControlStateNormal];
        [Util roundBorderView:SXRealValue(2) border:1 color:colorB378D5 view:_moreTangGuoBtn];
    }
    return _moreTangGuoBtn;
}
-(UIButton *)QRCode{
    if (!_QRCode) {
        _QRCode = [UIButton buttonWithType:UIButtonTypeCustom];
        [_QRCode  setHitEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -10)];//热区域
        [_QRCode addTarget:self action:@selector(QRCodeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [Util roundBorderView:SXRealValue(2) border:0 color:[UIColor blackColor] view:_QRCode];
    }
    return _QRCode;
}


-(instancetype)initWithFrame:(CGRect)frame{
    if (self =[super initWithFrame:frame]) {
        self.backgroundColor = naverTextColor;
        //顶部
        [self.upView addSubview:self.myIcon];
        [self.upView addSubview:self.myName];
        [self.upView addSubview:self.myAddress];
        [self.upView addSubview:self.QRCode];
        [self.upView addSubview:self.separatorLine];
        //中部
        [self.middleView addSubview:self.ziChanIcon];
        [self.middleView addSubview:self.zongLable1];
        [self.middleView addSubview:self.zongLable2];
        [self.middleView addSubview:self.separatorLine1];
        //底部
        [self.downView addSubview:self.tangGuoBtn];
        [self.downView addSubview:self.moreTangGuoBtn];


        [self addSubview:self.upView];
        [self addSubview:self.middleView];
        [self addSubview:self.downView];

        [self.upView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).with.offset(0);
            make.top.mas_equalTo(self.mas_top).with.offset(0);
            make.right.mas_equalTo(self.mas_right).with.offset(0);
            make.height.mas_equalTo((SYRealValue(100)));
        }];
        [self.middleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).with.offset(0);
            make.top.mas_equalTo(self.upView.mas_bottom).with.offset(0);
            make.right.mas_equalTo(self.mas_right).with.offset(0);
            make.height.mas_equalTo((SYRealValue(58)));
        }];
        [self.downView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).with.offset(0);
            make.top.mas_equalTo(self.middleView.mas_bottom).with.offset(0);
            make.right.mas_equalTo(self.mas_right).with.offset(0);
            make.height.mas_equalTo((SYRealValue(74)));
        }];

        [self.myIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.upView.mas_left).with.offset(SXRealValue(16));
            make.centerY.equalTo(self.upView.mas_centerY);
            make.width.mas_equalTo(SXRealValue(60));
            make.height.mas_equalTo(SXRealValue(60));
        }];
        [self.myName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.myIcon.mas_right).with.offset(SXRealValue(10));
            make.right.mas_equalTo(self.upView.mas_right).with.offset(0);
            make.bottom.mas_equalTo(self.upView.mas_centerY).with.offset(SXRealValue(-2));
        }];
        [self.QRCode mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.upView.mas_right).with.offset(SXRealValue(-10));
            make.top.mas_equalTo(self.upView.mas_centerY).with.offset(SXRealValue(2));
            make.width.mas_equalTo(SXRealValue(19));
            make.height.mas_equalTo(SXRealValue(19));
        }];
        [self.myAddress mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.myIcon.mas_right).with.offset(SXRealValue(10));
            make.right.mas_equalTo(self.QRCode.mas_left).with.offset(SXRealValue(-12));
            make.top.mas_equalTo(self.upView.mas_centerY).with.offset(SXRealValue(2));
        }];
      
        [self.separatorLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.upView.mas_left).with.offset(SXRealValue(10));
            make.right.mas_equalTo(self.upView.mas_right).with.offset(SXRealValue(-10));
            make.bottom.mas_equalTo(self.upView.mas_bottom).with.offset(SXRealValue(-0.6));
            make.height.mas_equalTo(SXRealValue(0.6));
        }];
        //中部
        [self.ziChanIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.middleView.mas_left).with.offset(SXRealValue(21));
            make.centerY.equalTo(self.middleView.mas_centerY);
            //make.top.mas_equalTo(self.middleView.mas_top).with.offset((SYRealValue(16)));
            make.width.mas_equalTo(SXRealValue(20));
            make.height.mas_equalTo(SXRealValue(20));
        }];
        [self.zongLable1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.ziChanIcon.mas_right).with.offset(SXRealValue(20));
            make.top.mas_equalTo(self.middleView.mas_top).with.offset((SYRealValue(16)));
        }];
        [self.zongLable2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.zongLable1.mas_right).with.offset(SXRealValue(5));
            make.top.mas_equalTo(self.middleView.mas_top).with.offset((SYRealValue(16)));
            //make.right.mas_equalTo(self.middleView.mas_right).with.offset(SXRealValue(-20));
        }];
        
        [self.separatorLine1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.middleView.mas_left).with.offset(SXRealValue(10));
            make.right.mas_equalTo(self.middleView.mas_right).with.offset(SXRealValue(-10));
            make.bottom.mas_equalTo(self.middleView.mas_bottom).with.offset(SXRealValue(-0.6));
            make.height.mas_equalTo(SXRealValue(0.6));
        }];
        
        [self.tangGuoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.downView.mas_centerX).with.offset(SXRealValue(-2));
            make.centerY.equalTo(self.downView.mas_centerY);
            make.width.mas_equalTo(SCREENWIDTH/2-(SXRealValue(31)));
            make.height.mas_equalTo((SCREENWIDTH/2-(SXRealValue(31)))*40/156);
        }];
        [self.moreTangGuoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.downView.mas_centerX).with.offset(SXRealValue(2));
            make.centerY.equalTo(self.downView.mas_centerY);
            make.width.mas_equalTo(SCREENWIDTH/2-(SXRealValue(31)));
            make.height.mas_equalTo((SCREENWIDTH/2-(SXRealValue(31)))*40/156);
        }];
    
    }
    return self;
}
-(void)setModel:(BCMeModel *)model{
    _model =model;
    if (model!=nil) {
        self.myName.text = model.name;
        self.myAddress.text= model.token;
        //self.myAddress.text = model.token ? model.token : @"0";
        [self.myIcon sd_setImageWithURL:[NSURL URLWithString:model.icon] placeholderImage:[UIImage imageNamed:@"usericon_placeholder"]];
        self.ziChanIcon.image =[UIImage imageNamed:@"wallet-iocn"];
        [self.QRCode setImage:[UIImage imageNamed:@"二维码"] forState:UIControlStateNormal];
        self.zongLable1.text =@"总资产≈";
        self.zongLable2.text = [NSString stringWithFormat:@"%@%.2f",@"¥",[model.coin floatValue]];
//        [self.tangGuoBtn setTitle:@"糖果记录" forState:UIControlStateNormal];
//        [self.moreTangGuoBtn setTitle:@"更多糖果" forState:UIControlStateNormal];
    }
}




//-(void)setMode:(ExpertHomeDetailMode *)mode{
//    _mode =mode;
//    if (mode!=nil) {
//        _bigView.backgroundColor =[UIColor whiteColor];
//        _downView.backgroundColor =[UIColor whiteColor];
//        _downOneView.backgroundColor =[UIColor whiteColor];
//        _downTwoView.backgroundColor =[UIColor whiteColor];
//        _webView.backgroundColor =[UIColor whiteColor];
//        _jianjieLine.backgroundColor =kNaviColor;
//        _upSeparatorLine.backgroundColor =BGCOLOR_TABLEVIEW;
//        _downSeparatorLine.backgroundColor =BGCOLOR_TABLEVIEW;
//        //强制布局
//        [self.bigExpertIcon sd_setImageFromURLPath:ZZPingString(URL_ImagePrefixPath, mode.photo)];
//        self.avaterBorderImg.image=[UIImage imageNamed:@"touxiang"];
//        [self.smallExpertIcon sd_setExpertHeadIconImageFromURLPath:ZZPingString(URL_ImagePrefixPath, mode.photo)];
//        self.expertName.text = mode.name;//姓名
//        CGSize expertNameSize = [mode.name sizeWithAttributes:@{NSFontAttributeName : SYSTEMFONT(WidthScale(20))}];
//
//        self.jianjieLable.text=@"简介";
//        self.expertTitle.text = mode.title;//咨询师
//        CGSize expertTitleSize = [mode.title sizeWithAttributes:@{NSFontAttributeName : TEXTFONT_XiTi(WidthScale(12))}];
//
//        self.zizhiTitle.text = @"从业资质";//发表内容
//        CGSize zizhiTitleSize = [@"从业资质" sizeWithAttributes:@{NSFontAttributeName : SYSTEMFONT(WidthScale(16))}];
//        self.zhengjianTitle.text = mode.qualification;//认证
//        CGSize zhengjianTitleSize = [mode.qualification sizeWithAttributes:@{NSFontAttributeName : SYSTEMFONT(WidthScale(14))}];
//
//        self.zizhiIcon.image=[UIImage imageNamed:@"renzheng"];
//        self.zhiziHuaTitle.text=@"知子花认证";
//        self.webView.hidden=NO;
//        [self layoutIfNeeded];
//        [self layoutIfNeeded];
//
//        self.bigViewHeight =self.upBigView.zz_height+WidthScale(61/2)+WidthScale(10) +expertNameSize.height +WidthScale(10)+expertTitleSize.height+WidthScale(15)+WidthScale(10);
//        self.downTwoHeight = WidthScale(20)+zizhiTitleSize.height +WidthScale(20)+zhengjianTitleSize.height+WidthScale(20);
//
//        self.middleViewHeight = self.bigViewHeight+self.downOneView.zz_height+self.downTwoHeight;
//
//        NSLog(@"bigView.zz_bottom===%f",self.bigView.zz_height);
//        NSLog(@"self.downOneView.zz_y===%f",self.downOneView.zz_height);
//        NSLog(@"self.downTwoView.zz_height===%f",self.downTwoView.zz_height);
//        NSLog(@"self.middleViewHeight===%f",self.middleViewHeight);
//        //        bigView.zz_bottom===256.000000
//        //        self.downOneView.zz_y===34.000000
//        //        self.downTwoView.zz_height===94.000000
//        //        self.middleViewHeight===392.533333
//
//
//    }
//}
#pragma 糖果记录跳转
-(void)tangGuoBtnClick:(UIButton *)button{
   if (self.delegate && [self.delegate respondsToSelector:@selector(tangGuoBtnClick)]) {
        [self.delegate tangGuoBtnClick];
    }
    
}
#pragma 糖果更多记录跳转
-(void)moreTangGuoBtnClick:(UIButton *)button{
    if (self.delegate && [self.delegate respondsToSelector:@selector(moreTangGuoBtnClick)]) {
        [self.delegate moreTangGuoBtnClick];
    }
    
}
-(void)QRCodeBtnClick:(UIButton *)button{
    if (self.delegate && [self.delegate respondsToSelector:@selector(QRCodeBtnClick)]) {
        [self.delegate QRCodeBtnClick];
    }
}




//    if (self.delegate && [self.delegate respondsToSelector:@selector(sendHeartWithCellModel:CellDidClickFrom:)]) {
//        [self.delegate sendHeartWithCellModel:_mode CellDidClickFrom:self];
//    }



@end
