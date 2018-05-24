//
//  BCMeTangGuoListView.m
//  BlockChain
//
//  Created by 吴博怡 on 2018/5/22.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCMeTangGuoJiLuHeaderView.h"
@interface BCMeTangGuoJiLuHeaderView()
/** 雷鹿财务con*/
@property (nonatomic, strong)UIImageView *liLuCaiFuIcon;

@property (nonatomic, strong)UIView *view;
@property (nonatomic, strong)UIView *upBigView;
@property (nonatomic, strong)UIView *view1;
@property(nonatomic,strong)UILabel *tangGuoJiLulable;
@property (nonatomic, strong)UIView *line;

@end
@implementation BCMeTangGuoJiLuHeaderView


-(UIImageView *)liLuCaiFuIcon{
    if (!_liLuCaiFuIcon) {
        _liLuCaiFuIcon = [[UIImageView alloc] init];
        //_myIcon.contentMode = UIViewContentModeScaleAspectFill;
        //[Util roundBorderView:SXRealValue(60/2) border:0 color:nil view:_myIcon];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_liLuCaiFuIcon];
    }
    return _liLuCaiFuIcon;
}
-(UILabel *)tangGuoJiLulable{
    if (!_tangGuoJiLulable) {
        _tangGuoJiLulable = [UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(15)) textAlignment:NSTextAlignmentLeft numberOfLines:1];        //[Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_line1];
        //        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_dizhi];
    }
    return _tangGuoJiLulable;
}


-(UIView *)upBigView{
    if (!_upBigView) {
        _upBigView= [[UIView alloc] init];
        _upBigView.backgroundColor = naverTextColor;
    }
    return _upBigView;
}
-(UIView *)view{
    if (!_view) {
        _view= [[UIView alloc] init];
        _view.backgroundColor = naverTextColor;
    }
    return _view;
}
-(UIView *)view1{
    if (!_view1) {
        _view1= [[UIView alloc] init];
        _view1.backgroundColor = bagColor;
    }
    return _view1;
}
-(UIView *)line{
    if (!_line) {
        _line= [[UIView alloc] init];
        _line.backgroundColor = colorE5E7E9;
    }
    return _line;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self =[super initWithFrame:frame]) {
        self.backgroundColor = naverTextColor;
        //顶部
       
        [self.view addSubview:self.tangGuoJiLulable];
        [self.upBigView addSubview:self.liLuCaiFuIcon];
        [self addSubview:self.upBigView];
        [self addSubview:self.view];
        [self addSubview:self.view1];
        [self.view addSubview:self.line];

        [self.upBigView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).with.offset(SXRealValue(0));
            make.top.mas_equalTo(self.mas_top).with.offset(SXRealValue(0));
            make.right.mas_equalTo(self.mas_right).with.offset(SXRealValue(0));
            make.height.mas_equalTo((SYRealValue(140)));
        }];
        [self.liLuCaiFuIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.upBigView.mas_centerX);
            make.centerY.equalTo(self.upBigView.mas_centerY);
            make.width.mas_equalTo(SXRealValue(215));
            make.height.mas_equalTo((SYRealValue(59)));
        }];
        [self.view1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).with.offset(SXRealValue(0));
            make.top.mas_equalTo(self.upBigView.mas_bottom).with.offset(SXRealValue(0));
            make.right.mas_equalTo(self.mas_right).with.offset(SXRealValue(0));
            make.height.mas_equalTo((SYRealValue(8)));
        }];
        [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).with.offset(SXRealValue(0));
            make.top.mas_equalTo(self.view1.mas_bottom).with.offset(SXRealValue(0));
            make.right.mas_equalTo(self.mas_right).with.offset(SXRealValue(0));
            make.height.mas_equalTo((SYRealValue(54)));
            make.bottom.mas_equalTo(self.mas_bottom).with.offset(SXRealValue(0));
        }];
        [self.tangGuoJiLulable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.view.mas_left).with.offset(SXRealValue(16));
            make.right.mas_equalTo(self.view.mas_right).with.offset(SXRealValue(-20));
            make.centerY.mas_equalTo(self.view.mas_centerY);
        }];
        [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.view.mas_left).with.offset(SXRealValue(0));
            make.right.mas_equalTo(self.view.mas_right).with.offset(SXRealValue(0));
            make.bottom.mas_equalTo(self.view.mas_bottom).with.offset((SYRealValue(-0.6)));
            make.height.mas_equalTo((SYRealValue(0.6)));
        }];
    }
    return self;
}

                                    
-(void)setUpImage:(UIImage *)image{
    self.liLuCaiFuIcon.image = image;
    self.tangGuoJiLulable.text =@"糖果记录";
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
