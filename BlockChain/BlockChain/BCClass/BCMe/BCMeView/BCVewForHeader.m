//
//  BCVewForHeader.m
//  BlockChain
//
//  Created by Mac on 2018/5/23.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCVewForHeader.h"
@interface BCVewForHeader()
@property(nonatomic,strong)UIView *view;
@property(nonatomic,strong)UILabel *tangGuoJiLulable;

@end

@implementation BCVewForHeader

-(UIView *)view{
    if (!_view) {
        _view =[UIView getViewUserEnabled:NO backGroundColor:naverTextColor tag:0 target:nil action:nil];
    }
    return _view;
}
-(UILabel *)tangGuoJiLulable{
    if (!_tangGuoJiLulable) {
        _tangGuoJiLulable =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(16)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_tangGuoJiLulable];
    }
    return _tangGuoJiLulable;
}

-(instancetype)init{
    if ([super init]) {
        [self addSubview:self.view];
        [self addSubview:self.tangGuoJiLulable];
        [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).with.offset(0);
            make.right.mas_equalTo(self.mas_right).with.offset(0);
            make.top.mas_equalTo(self.mas_top).with.offset(0);
            make.bottom.mas_equalTo(self.mas_bottom).with.offset(0);
            make.height.mas_equalTo((SYRealValue(54)));
        }];
        [self.tangGuoJiLulable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.view.mas_left).with.offset(SXRealValue(16));
            make.right.mas_equalTo(self.view.mas_right).with.offset(SXRealValue(-20));
            make.centerY.equalTo(self.view.mas_centerY);
        }];
    }
    return self;
}

//-(instancetype)initWithFrame:(CGRect)frame withText:(NSString *)textName{
//     if (self =[super initWithFrame:frame]) {
//         [self addSubview:self.view];
//         [self addSubview:self.tangGuoJiLulable];
//         [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
//             make.left.mas_equalTo(self.mas_left).with.offset(0);
//             make.right.mas_equalTo(self.mas_right).with.offset(0);
//             make.top.mas_equalTo(self.mas_top).with.offset(0);
//             make.bottom.mas_equalTo(self.mas_bottom).with.offset(0);
//             make.height.mas_equalTo(frame.size.height);
//         }];
//         [self.tangGuoJiLulable mas_makeConstraints:^(MASConstraintMaker *make) {
//             make.left.mas_equalTo(self.view.mas_left).with.offset(SXRealValue(16));
//             make.right.mas_equalTo(self.view.mas_right).with.offset(SXRealValue(-20));
//             make.centerY.equalTo(self.view.mas_centerY);
//         }];
//     }
//
//
//    return self;
//}
@end
