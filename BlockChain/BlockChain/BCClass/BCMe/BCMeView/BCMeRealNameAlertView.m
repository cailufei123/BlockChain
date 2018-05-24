//
//  BCMeRealNameAlertView.m
//  BlockChain
//
//  Created by Mac on 2018/5/24.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCMeRealNameAlertView.h"

//实名认证弹框
@interface BCMeRealNameAlertView()
/** 官网*/
@property (nonatomic, strong)UILabel *message;
/** 去认证*/
@property (nonatomic, strong)UIButton *goBtn;
/** 取消认证*/
@property (nonatomic, strong)UIButton *cancelBtn;

@end
@implementation BCMeRealNameAlertView

-(UILabel *)message{
    if (!_message) {
        _message =[UILabel LabelWithTextColor:color414754 textFont:FONT(@"PingFangSC-Medium", SXRealValue(15)) textAlignment:NSTextAlignmentCenter numberOfLines:2];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_message];
    }
    return _message;
}
-(UIButton *)goBtn{
    if (!_goBtn) {
        _goBtn = [UIButton getButtonTitleColor:naverTextColor titleFont:FONT(@"PingFangSC-Semibold", SXRealValue(15)) backGroundColor:colorB378D5 target:self action:@selector(goBtnClick:)];
        _goBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_goBtn  setHitEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -10)];//热区域
        [Util roundBorderView:SXRealValue(2) border:0 color:color2B73EE view:_goBtn];
    }
    return _goBtn;
}
-(UIButton *)cancelBtn{
    if (!_cancelBtn) {
        _cancelBtn = [UIButton getButtonTitleColor:color7B7B7B titleFont:FONT(@"PingFangSC-Semibold", SXRealValue(15)) backGroundColor:naverTextColor target:self action:@selector(cancelBtnClick:)];
        _cancelBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_cancelBtn  setHitEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -10)];//热区域
        [Util roundBorderView:SXRealValue(2) border:1 color:colorB378D5 view:_cancelBtn];
    }
    return _cancelBtn;
}


-(instancetype)initWithFrame:(CGRect)frame{
    if (self =[super initWithFrame:frame]) {
        self.backgroundColor = naverTextColor;
        //顶部
        [self addSubview:self.message];
        [self addSubview:self.goBtn];
        [self addSubview:self.cancelBtn];
        
        
        [self.message mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top).with.offset((SYRealValue(58)));
            make.left.mas_equalTo(self.mas_left).with.offset(SXRealValue(44));
            make.right.mas_equalTo(self.mas_right).with.offset(SXRealValue(-44));
//            make.centerX.mas_equalTo(self.mas_centerX);
            make.height.mas_equalTo((SYRealValue(46)));
        }];
        [self.goBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.mas_centerX).with.offset(SXRealValue(-1));
            make.width.mas_equalTo(SXRealValue(156));
            make.height.mas_equalTo((SYRealValue(40)));
            make.bottom.mas_equalTo(self.mas_bottom).with.offset((SYRealValue(-16)));
        }];
        [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_centerX).with.offset(SXRealValue(1));
            make.width.mas_equalTo(SXRealValue(156));
            make.height.mas_equalTo((SYRealValue(40)));
            make.bottom.mas_equalTo(self.mas_bottom).with.offset((SYRealValue(-16)));
        }];
    }
    return self;
}

-(void)setUpMessage{
    self.message.text=[NSString stringWithFormat:@"%@",@"请先完成实名认证并设置支付密码才可进行转账操作"];
    [self.goBtn setTitle:@"去认证" forState:UIControlStateNormal];
    [self.cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
}

#pragma mark - 去认证
-(void)goBtnClick:(UIButton *)button{
    if (self.delegate && [self.delegate respondsToSelector:@selector(goBtnClick)]) {
        [self.delegate goBtnClick];
    }
}
#pragma mark -取消认证
-(void)cancelBtnClick:(UIButton *)button{
    if (self.delegate && [self.delegate respondsToSelector:@selector(cancelBtnClick)]) {
        [self.delegate cancelBtnClick];
    }
}


@end
