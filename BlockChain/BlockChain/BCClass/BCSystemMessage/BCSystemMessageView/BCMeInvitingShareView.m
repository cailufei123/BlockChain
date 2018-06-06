//
//  BCMeInvitingShareView.m
//  BlockChain
//
//  Created by Mac on 2018/5/28.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCMeInvitingShareView.h"
#import "BCMeInvitingFriendsModel.h"



@interface BCMeInvitingShareView()

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

@implementation BCMeInvitingShareView


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
        _message1 =[UILabel LabelWithTextColor:color5E5858 textFont:FONT(@"PingFangSC-Regular", SXRealValue(11)) textAlignment:NSTextAlignmentLeft numberOfLines:2];
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
        [self addSubview:self.downView];
        
        
        [self.downView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
//            make.height.mas_equalTo((SYRealValue(252)));
        }];
       
        //底部
//        [self.downView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(self.QcodeIcon.mas_centerY).with.offset((SYRealValue(0)));
//            make.left.mas_equalTo(self.bigView.mas_left).with.offset(SXRealValue(0));
//            make.right.mas_equalTo(self.bigView.mas_right).with.offset(SXRealValue(0));
//            make.bottom.mas_equalTo(self.bigView.mas_bottom).with.offset((SYRealValue(0)));
//        }];
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
            make.height.mas_equalTo((SYRealValue(36)));
        }];
        [self.message2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.downView.mas_left).with.offset(SXRealValue(40));
            make.top.mas_equalTo(self.message1.mas_bottom).with.offset((SYRealValue(1)));
            make.right.mas_equalTo(self.downView.mas_right).with.offset(SXRealValue(-40));
            make.height.mas_equalTo((SYRealValue(18)));
            //            make.bottom.mas_equalTo(self.downView.mas_bottom).with.offset((SYRealValue(-10)));
        }];
        [self layoutIfNeeded];
        //气泡切圆角
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.downView.bounds byRoundingCorners:UIRectCornerTopLeft  | UIRectCornerTopRight cornerRadii:CGSizeMake(SXRealValue(13), SXRealValue(13))];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = self.downView.bounds;
        maskLayer.path = maskPath.CGPath;
        self.downView.layer.mask = maskLayer;
        self.downView.layer.masksToBounds = YES;
    }
    return self;
}

-(void)setModel:(BCMeInvitingFriendsModel *)model{
    _model =model;
    if (model!=nil) {
        //下部
        self.shengYuLable.text = [NSString stringWithFormat:@"剩余邀请次数%@次",model.lastInviteCount];
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


#pragma mark -微信分享
-(void)weiXinBtnClick:(UIButton *)button{
    if (self.weiXinBtnBlock) {
        self.weiXinBtnBlock();
    }
}
#pragma mark -朋友圈分享
-(void)pengYouBtnClick:(UIButton *)button{
    if (self.pengYouBtnBlock) {
        self.pengYouBtnBlock();
    }
}
#pragma mark -QQ分享
-(void)QQBtnClick:(UIButton *)button{
    if (self.QQBtnBlock) {
        self.QQBtnBlock();
    }
}

@end
