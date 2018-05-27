//
//  BCMeInvitingFriendsView.m
//  BlockChain
//
//  Created by Mac on 2018/5/26.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCMeInvitingFriendsView.h"
#import "BCMeInvitingFriendsModel.h"



@interface BCMeInvitingFriendsView()
//顶部
@property (nonatomic, strong)UIView *bigView;
@property (nonatomic, strong)UIImageView *bigImageView;

@property (nonatomic, strong)UIImageView *caiFuIcon;
@property (nonatomic, strong)UIView *middleView;

@property (nonatomic, strong)UILabel *yaoQingLable;
@property (nonatomic, strong)UIImageView *yaoQingIcon;
@property (nonatomic, strong)UILabel *messageLable;
@property (nonatomic, strong)UIView *xuXianView;
@property (nonatomic, strong)UIImageView *QcodeIcon;//二维码



@property (nonatomic, strong)UIView *downView;
@property (nonatomic, strong)UILabel *shengYuLable;
@property (nonatomic, strong)UILabel *fenXiangLable;

@property (nonatomic, strong)UIButton *weiXinBtn;
@property (nonatomic, strong)UIButton *pengYouBtn;
@property (nonatomic, strong)UIButton *QQBtn;

@property (nonatomic, strong)UILabel *weiXinLable;
@property (nonatomic, strong)UILabel *pengYouLable;
@property (nonatomic, strong)UILabel *QQLable;


@property (nonatomic, strong)UILabel *huoDongLable;

@property (nonatomic, strong)UILabel *message1;
@property (nonatomic, strong)UILabel *message2;

@property (nonatomic, strong)UIView *line1;
@property (nonatomic, strong)UIView *line2;

@end

@implementation BCMeInvitingFriendsView


-(UIView *)bigView{
    if (!_bigView) {
        _bigView = [[UIView alloc] init];
        _bigView.backgroundColor =naverTextColor;
        //[Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_downView];
    }
    return _bigView;
}
-(UIView *)middleView{
    if (!_middleView) {
        _middleView = [[UIView alloc] init];
        _middleView.backgroundColor =naverTextColor;
        [Util roundBorderView:(SXRealValue(6)) border:1 color:[UIColor blackColor] view:_middleView];
    }
    return _middleView;
}
-(UIImageView *)bigImageView{
    if (!_bigImageView) {
        _bigImageView = [[UIImageView alloc] init];
        //_myIcon.contentMode = UIViewContentModeScaleAspectFill;
        //[Util roundBorderView:SXRealValue(60/2) border:0 color:nil view:_ziChanIcon];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_bigImageView];
    }
    return _bigImageView;
}
-(UIImageView *)caiFuIcon{
    if (!_caiFuIcon) {
        _caiFuIcon = [[UIImageView alloc] init];
        //_myIcon.contentMode = UIViewContentModeScaleAspectFill;
        //[Util roundBorderView:SXRealValue(60/2) border:0 color:nil view:_ziChanIcon];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_caiFuIcon];
    }
    return _caiFuIcon;
}

-(UILabel *)yaoQingLable{
    if (!_yaoQingLable) {
        _yaoQingLable =[UILabel LabelWithTextColor:color5D1C90 textFont:FONT(@"PingFangSC-Medium", SXRealValue(16)) textAlignment:NSTextAlignmentCenter numberOfLines:1];
//                [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_yaoQingLable];
    }
    return _yaoQingLable;
}
-(UIImageView *)yaoQingIcon{
    if (!_yaoQingIcon) {
        _yaoQingIcon = [[UIImageView alloc] init];
        //_myIcon.contentMode = UIViewContentModeScaleAspectFill;
        //[Util roundBorderView:SXRealValue(60/2) border:0 color:nil view:_ziChanIcon];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_yaoQingIcon];
    }
    return _yaoQingIcon;
}

-(UILabel *)messageLable{
    if (!_messageLable) {
        _messageLable =[UILabel LabelWithTextColor:color5E5858 textFont:FONT(@"PingFangSC-Regular", SXRealValue(11)) textAlignment:NSTextAlignmentCenter numberOfLines:2];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_messageLable];
    }
    return _messageLable;
}
-(UIView *)xuXianView{
    if (!_xuXianView) {
        _xuXianView = [[UIView alloc] init];
        //[Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_xuXianView];
    }
    return _xuXianView;
}
-(UIImageView *)QcodeIcon{
    if (!_QcodeIcon) {
        _QcodeIcon = [[UIImageView alloc] init];
        //_myIcon.contentMode = UIViewContentModeScaleAspectFill;
        //[Util roundBorderView:SXRealValue(60/2) border:0 color:nil view:_ziChanIcon];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_QcodeIcon];
    }
    return _QcodeIcon;
}
-(UIView *)downView{
    if (!_downView) {
        _downView = [[UIView alloc] init];
        _downView.backgroundColor =naverTextColor;
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_downView];
    }
    return _downView;
}
-(UILabel *)shengYuLable{
    if (!_shengYuLable) {
        _shengYuLable =[UILabel LabelWithTextColor:color5E5858 textFont:FONT(@"PingFangSC-Regular", SXRealValue(11)) textAlignment:NSTextAlignmentCenter numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_shengYuLable];
    }
    return _shengYuLable;
}
-(UIView *)line1{
    if (!_line1) {
        _line1= [[UIView alloc] init];
        _line1.backgroundColor = colorE5E7E9;
    }
    return _line1;
}
-(UIView *)line2{
    if (!_line2) {
        _line2= [[UIView alloc] init];
        _line2.backgroundColor = colorE5E7E9;
    }
    return _line2;
}
-(UILabel *)fenXiangLable{
    if (!_fenXiangLable) {
        _fenXiangLable =[UILabel LabelWithTextColor:color5E5858 textFont:FONT(@"PingFangSC-Medium", SXRealValue(11)) textAlignment:NSTextAlignmentCenter numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_fenXiangLable];
    }
    return _fenXiangLable;
}

-(UIButton *)weiXinBtn{
    if (!_weiXinBtn) {
        _weiXinBtn = [UIButton getButtonTitleColor:color686868 titleFont:FONT(@"PingFangSC-Regular", SXRealValue(11)) backGroundColor:naverTextColor target:self action:@selector(weiXinBtnClick:)];
        //_weiXinBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_weiXinBtn  setHitEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -10)];//热区域
//        [Util roundBorderView:SXRealValue(2) border:0 color:color2B73EE view:_weiXinBtn];
    }
    return _weiXinBtn;
}
-(UIButton *)pengYouBtn{
    if (!_pengYouBtn) {
        _pengYouBtn = [UIButton getButtonTitleColor:color686868 titleFont:FONT(@"PingFangSC-Regular", SXRealValue(11)) backGroundColor:naverTextColor target:self action:@selector(pengYouBtnClick:)];
        [_pengYouBtn setImage:[UIImage imageNamed:@"friendcircle_iocn"] forState:UIControlStateNormal];
        //_weiXinBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
//        [_pengYouBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -imgWidth, 0, imgWidth)];
//        [_pengYouBtn  setHitEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -10)];//热区域
//        [Util roundBorderView:SXRealValue(2) border:1 color:color2B73EE view:_pengYouBtn];
    }
    return _pengYouBtn;
}
-(UILabel *)weiXinLable{
    if (!_weiXinLable) {
        _weiXinLable =[UILabel LabelWithTextColor:color686868 textFont:FONT(@"PingFangSC-Regular", SXRealValue(11)) textAlignment:NSTextAlignmentCenter numberOfLines:1];
//                [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_weiXinLable];
    }
    return _weiXinLable;
}
-(UILabel *)pengYouLable{
    if (!_pengYouLable) {
        _pengYouLable =[UILabel LabelWithTextColor:color686868 textFont:FONT(@"PingFangSC-Regular", SXRealValue(11)) textAlignment:NSTextAlignmentCenter numberOfLines:1];
//                [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_pengYouLable];
    }
    return _pengYouLable;
}
-(UILabel *)QQLable{
    if (!_QQLable) {
        _QQLable =[UILabel LabelWithTextColor:color686868 textFont:FONT(@"PingFangSC-Regular", SXRealValue(11)) textAlignment:NSTextAlignmentCenter numberOfLines:1];
//                [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_QQLable];
    }
    return _QQLable;
}


-(UIButton *)QQBtn{
    if (!_QQBtn) {
        _QQBtn = [UIButton getButtonTitleColor:color686868 titleFont:FONT(@"PingFangSC-Regular", SXRealValue(11)) backGroundColor:naverTextColor target:self action:@selector(QQBtnClick:)];
        //_weiXinBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_QQBtn  setHitEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -10)];//热区域
//        [Util roundBorderView:SXRealValue(2) border:0 color:color2B73EE view:_QQBtn];
    }
    return _QQBtn;
}
-(UILabel *)huoDongLable{
    if (!_huoDongLable) {
        _huoDongLable =[UILabel LabelWithTextColor:color000000 textFont:FONT(@"PingFangSC-Medium", SXRealValue(11)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_huoDongLable];
    }
    return _huoDongLable;
}
-(UILabel *)message1{
    if (!_message1) {
        _message1 =[UILabel LabelWithTextColor:color5E5858 textFont:FONT(@"PingFangSC-Regular", SXRealValue(11)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_message1];
    }
    return _message1;
}
-(UILabel *)message2{
    if (!_message2) {
        _message2 =[UILabel LabelWithTextColor:color5E5858 textFont:FONT(@"PingFangSC-Regular", SXRealValue(11)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_message2];
    }
    return _message2;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self =[super initWithFrame:frame]) {
        //顶部
        [self.middleView addSubview:self.yaoQingLable];
        [self.middleView addSubview:self.yaoQingIcon];
        [self.middleView addSubview:self.messageLable];
        [self.middleView addSubview:self.xuXianView];
        [self.middleView addSubview:self.QcodeIcon];

        [self.downView addSubview:self.shengYuLable];
        [self.downView addSubview:self.fenXiangLable];
        [self.downView addSubview:self.weiXinBtn];
        [self.downView addSubview:self.pengYouBtn];
        [self.downView addSubview:self.QQBtn];
        [self.downView addSubview:self.weiXinLable];
        [self.downView addSubview:self.pengYouLable];
        [self.downView addSubview:self.QQLable];
        [self.downView addSubview:self.huoDongLable];
        [self.downView addSubview:self.message1];
        [self.downView addSubview:self.message2];
        [self.downView addSubview:self.line1];
        [self.downView addSubview:self.line2];
        
        [self.bigView addSubview:self.bigImageView];
        [self.bigView addSubview:self.caiFuIcon];
        [self.bigView addSubview:self.downView];
        [self.bigView addSubview:self.middleView];
        [self.bigView insertSubview:self.downView aboveSubview:self.middleView];
        [self addSubview:self.bigView];


        [self.bigView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
        }];
        [self.bigImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
        }];
        [self.caiFuIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.bigView.mas_top).with.offset(kTopHeight+(SYRealValue(13)));
            make.centerX.mas_equalTo(self.bigView.mas_centerX);
            make.width.mas_equalTo((SXRealValue(211)));
            make.height.mas_equalTo((SYRealValue(58)));
        }];
        [self.middleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.caiFuIcon.mas_bottom).with.offset((SYRealValue(30)));
            make.left.mas_equalTo(self.bigView.mas_left).with.offset(SXRealValue(40));
            make.right.mas_equalTo(self.bigView.mas_right).with.offset(SXRealValue(-40));
            make.bottom.mas_equalTo(self.bigView.mas_bottom).with.offset((SYRealValue(-98)));
        }];
        [self.yaoQingLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.middleView.mas_top).with.offset((SYRealValue(17)));
            make.left.mas_equalTo(self.middleView.mas_left).with.offset(SXRealValue(0));
            make.right.mas_equalTo(self.middleView.mas_right).with.offset(SXRealValue(0));
            make.height.mas_equalTo((SYRealValue(24)));
        }];
        [self.yaoQingIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.yaoQingLable.mas_bottom).with.offset((SYRealValue(0)));
            make.left.mas_equalTo(self.middleView.mas_left).with.offset(SXRealValue(0));
            make.right.mas_equalTo(self.middleView.mas_right).with.offset(SXRealValue(0));
            make.height.mas_equalTo((SYRealValue(66)));
        }];
        [self.messageLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.yaoQingIcon.mas_bottom).with.offset((SYRealValue(0)));
            make.left.mas_equalTo(self.middleView.mas_left).with.offset(SXRealValue(0));
            make.right.mas_equalTo(self.middleView.mas_right).with.offset(SXRealValue(0));
            make.height.mas_equalTo((SYRealValue(34)));
        }];
        [self.xuXianView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.messageLable.mas_bottom).with.offset((SYRealValue(12)));
            make.left.mas_equalTo(self.middleView.mas_left).with.offset(SXRealValue(0));
            make.right.mas_equalTo(self.middleView.mas_right).with.offset(SXRealValue(0));
            make.height.mas_equalTo((SYRealValue(1)));
        }];
        [self.QcodeIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.xuXianView.mas_bottom).with.offset((SYRealValue(10)));
            make.centerX.mas_equalTo(self.middleView.mas_centerX);
            make.width.mas_equalTo((SXRealValue(185)));
            make.height.mas_equalTo((SYRealValue(179)));
        }];
        //底部
        [self.downView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.QcodeIcon.mas_centerY).with.offset((SYRealValue(0)));
            make.left.mas_equalTo(self.bigView.mas_left).with.offset(SXRealValue(0));
            make.right.mas_equalTo(self.bigView.mas_right).with.offset(SXRealValue(0));
            make.bottom.mas_equalTo(self.bigView.mas_bottom).with.offset((SYRealValue(0)));
        }];
        [self.shengYuLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.downView.mas_top).with.offset((SYRealValue(10)));
            make.left.mas_equalTo(self.downView.mas_left).with.offset(SXRealValue(0));
            make.right.mas_equalTo(self.downView.mas_right).with.offset(SXRealValue(0));
            make.height.mas_equalTo((SYRealValue(20)));
        }];
        [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.downView.mas_left).with.offset(SXRealValue(40));
            make.right.mas_equalTo(self.downView.mas_right).with.offset(SXRealValue(-40));
            make.top.mas_equalTo(self.shengYuLable.mas_bottom).with.offset((SYRealValue(10)));
            make.height.mas_equalTo((SYRealValue(0.6)));
        }];
        [self.fenXiangLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.downView.mas_left).with.offset(SXRealValue(40));
            make.right.mas_equalTo(self.downView.mas_right).with.offset(SXRealValue(-40));
            make.top.mas_equalTo(self.line1.mas_bottom).with.offset((SYRealValue(10)));
            make.height.mas_equalTo((SYRealValue(18)));
        }];
        [self layoutIfNeeded];
        //气泡切圆角
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.downView.bounds byRoundingCorners:UIRectCornerTopLeft  | UIRectCornerTopRight cornerRadii:CGSizeMake(SXRealValue(13), SXRealValue(13))];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = self.downView.bounds;
        maskLayer.path = maskPath.CGPath;
        self.downView.layer.mask = maskLayer;
        self.downView.layer.masksToBounds = YES;
        
        //虚线
        [self drawLineOfDashByCAShapeLayer:self.xuXianView lineLength:(SXRealValue(10)) lineSpacing:SXRealValue(10) lineColor:color9884AF lineDirection:YES];
        
        [self.pengYouBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.downView.mas_centerX);
            make.top.mas_equalTo(self.fenXiangLable.mas_bottom).with.offset((SYRealValue(15)));
            make.width.mas_equalTo((SXRealValue(40)));
            make.height.mas_equalTo((SXRealValue(40)));
        }];
        [self.pengYouLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.pengYouBtn.mas_centerX);
            make.top.mas_equalTo(self.pengYouBtn.mas_bottom).with.offset((SYRealValue(14)));
            make.width.mas_equalTo((SXRealValue(40)));
            make.height.mas_equalTo((SYRealValue(18)));
        }];
        [self.weiXinBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.pengYouBtn.mas_centerY);
            make.right.mas_equalTo(self.pengYouBtn.mas_left).with.offset((SYRealValue(-71)));
            make.width.mas_equalTo((SXRealValue(40)));
            make.height.mas_equalTo((SXRealValue(40)));
        }];
        [self.weiXinLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.weiXinBtn.mas_centerX);
            make.top.mas_equalTo(self.weiXinBtn.mas_bottom).with.offset((SYRealValue(14)));
            make.width.mas_equalTo((SXRealValue(40)));
            make.height.mas_equalTo((SYRealValue(18)));
        }];
        [self.QQBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.pengYouBtn.mas_centerY);
            make.left.mas_equalTo(self.pengYouBtn.mas_right).with.offset((SYRealValue(71)));
            make.width.mas_equalTo((SXRealValue(40)));
            make.height.mas_equalTo((SXRealValue(40)));
        }];
        [self.QQLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.QQBtn.mas_centerX);
            make.top.mas_equalTo(self.QQBtn.mas_bottom).with.offset((SYRealValue(14)));
            make.width.mas_equalTo((SXRealValue(40)));
            make.height.mas_equalTo((SYRealValue(18)));
        }];
        [self.line2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.downView.mas_left).with.offset(SXRealValue(40));
            make.right.mas_equalTo(self.downView.mas_right).with.offset(SXRealValue(-40));
            make.top.mas_equalTo(self.pengYouLable.mas_bottom).with.offset((SYRealValue(10)));
            make.height.mas_equalTo((SYRealValue(0.6)));
        }];
        [self.huoDongLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.downView.mas_left).with.offset(SXRealValue(40));
            make.top.mas_equalTo(self.line2.mas_bottom).with.offset((SYRealValue(15)));
            make.right.mas_equalTo(self.downView.mas_right).with.offset(SXRealValue(-40));
            make.height.mas_equalTo((SYRealValue(18)));
        }];
        [self.message1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.huoDongLable.mas_left);
            make.top.mas_equalTo(self.huoDongLable.mas_bottom).with.offset((SYRealValue(1)));
            make.right.mas_equalTo(self.downView.mas_right).with.offset(SXRealValue(-40));
            make.height.mas_equalTo((SYRealValue(18)));
        }];
        [self.message2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.downView.mas_left).with.offset(SXRealValue(40));
            make.top.mas_equalTo(self.message1.mas_bottom).with.offset((SYRealValue(1)));
            make.right.mas_equalTo(self.downView.mas_right).with.offset(SXRealValue(-40));
            make.height.mas_equalTo((SYRealValue(18)));
//            make.bottom.mas_equalTo(self.downView.mas_bottom).with.offset((SYRealValue(-10)));
        }];
        
    }
    return self;
}

-(void)setModel:(BCMeInvitingFriendsModel *)model{
    _model =model;
    if (model!=nil) {
        
    }else{
        //假数据
        self.bigImageView.image=[UIImage imageNamed:@"背景－2"];
        self.caiFuIcon.image=[UIImage imageNamed:@"雷鹿财富logoc-2"];
        self.yaoQingLable.text = @"我的邀请码";
        self.yaoQingIcon.image=[UIImage imageNamed:@"millcolorGrad"];
        self.messageLable.text =@"赶快和我一起领糖果，使用邀请码注册更有惊喜大礼包等你来拿";
        self.QcodeIcon.image=[UIImage imageNamed:@"二维码"];
        //下部
        self.shengYuLable.text = [NSString stringWithFormat:@"剩余邀请次数%@次",@"8"];
        self.fenXiangLable.text =@"分享到";
        [self.weiXinBtn setImage:[UIImage imageNamed:@"wx_iocn"] forState:UIControlStateNormal];
        [self.pengYouBtn setImage:[UIImage imageNamed:@"friendcircle_iocn"] forState:UIControlStateNormal];
        [self.QQBtn setImage:[UIImage imageNamed:@"qq_iocn"] forState:UIControlStateNormal];
        self.weiXinLable.text =@"微信";
        self.pengYouLable.text =@"朋友圈";
        self.QQLable.text =@"QQ";
       
        self.huoDongLable.text =@"活动规则:";
        self.message1.text =@"1.新用户使用你的邀请码注册成功后双方均可获得10紫砖奖励";
        self.message2.text =@"2.每个邀请码最多使用10次";
    }
}

/**
 *  通过 CAShapeLayer 方式绘制虚线
 *
 *  param lineView:       需要绘制成虚线的view
 *  param lineLength:     虚线的宽度
 *  param lineSpacing:    虚线的间距
 *  param lineColor:      虚线的颜色
 *  param lineDirection   虚线的方向  YES 为水平方向， NO 为垂直方向
 **/
- (void)drawLineOfDashByCAShapeLayer:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor lineDirection:(BOOL)isHorizonal {
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    
    [shapeLayer setBounds:lineView.bounds];
    
    if (isHorizonal) {
        
        [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
        
    } else{
        [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame)/2)];
    }
    
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    if (isHorizonal) {
        [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    } else {
        
        [shapeLayer setLineWidth:CGRectGetWidth(lineView.frame)];
    }
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    
    if (isHorizonal) {
        CGPathAddLineToPoint(path, NULL,CGRectGetWidth(lineView.frame), 0);
    } else {
        CGPathAddLineToPoint(path, NULL, 0, CGRectGetHeight(lineView.frame));
    }
    
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}
#pragma mark -微信分享
-(void)weiXinBtnClick:(UIButton *)button{
    
    
}
#pragma mark -朋友圈分享
-(void)pengYouBtnClick:(UIButton *)button{
    
    
}
#pragma mark -QQ分享
-(void)QQBtnClick:(UIButton *)button{
    
    
}

//_weiXinBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
//[_weiXinBtn setTitleEdgeInsets:UIEdgeInsetsMake(_weiXinBtn.imageView.frame.size.height ,-_weiXinBtn.imageView.frame.size.width, 0.0,0.0)];//文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
//[_weiXinBtn setImageEdgeInsets:UIEdgeInsetsMake(0.0, 0.0,0.0, -_weiXinBtn.titleLabel.bounds.size.width)];//图片距离右边框距离减少图片的宽度，其它不边


//图片在左，title在右
//图片在上，title在下
//图片在右，title在左
//图片在下，title在上

//MKButtonEdgeInsetsStyleTop MKButtonEdgeInsetsStyleLeft  MKButtonEdgeInsetsStyleBottom MKButtonEdgeInsetsStyleRight
//- (void)layoutButtonWithEdgeInsetsStyle:(NSInteger)style
//                        imageTitleSpace:(CGFloat)space withButton:(UIButton *)button{
//    // 1. 得到imageView和titleLabel的宽、高
//    // CGFloat imageWith = self.imageView.frame.size.width; // CGFloat imageHeight = self.imageView.frame.size.height;
//    CGFloat imageWith = button.currentImage.size.width;
//    CGFloat imageHeight = button.currentImage.size.height;
//    CGFloat labelWidth = 0.0; CGFloat labelHeight = 0.0;
//    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
//        // 由于iOS8中titleLabel的size为0，用下面的这种设置
//        labelWidth = button.titleLabel.intrinsicContentSize.width;
//        labelHeight = button.titleLabel.intrinsicContentSize.height;
//
//    } else {
//        labelWidth = button.titleLabel.frame.size.width;
//        labelHeight = button.titleLabel.frame.size.height;
//    }
//    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
//    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
//    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
//
//
//    // 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
//    switch (style)
//    {
//        case 1: {
//            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space, 0, 0, -labelWidth);
//            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space, 0);
//        } break;
//        case 2: {
//            imageEdgeInsets = UIEdgeInsetsMake(0, -space, 0, space);
//            labelEdgeInsets = UIEdgeInsetsMake(0, space, 0, -space);
//
//        } break;
//        case 3: {
//            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space, -labelWidth);
//            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space, -imageWith, 0, 0);
//
//        } break;
//        case 4: {
//            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space, 0, -labelWidth-space);
//            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space, 0, imageWith+space);
//
//        } break;
//        default:
//            break;
//    }
//    // 4. 赋值
//    button.titleEdgeInsets = labelEdgeInsets;
//    button.imageEdgeInsets = imageEdgeInsets;
//}


@end
