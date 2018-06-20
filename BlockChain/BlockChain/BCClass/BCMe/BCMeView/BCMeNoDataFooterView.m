//
//  BCNoDataView.m
//  BlockChain
//
//  Created by Mac on 2018/6/8.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCMeNoDataFooterView.h"

@interface BCMeNoDataFooterView()


@end
@implementation BCMeNoDataFooterView

-(UIImageView *)centerIcon{
    if (!_centerIcon) {
        _centerIcon = [[UIImageView alloc] init];
        //_myIcon.contentMode = UIViewContentModeScaleAspectFill;
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_centerIcon];
    }
    return _centerIcon;
}

-(UILabel *)message{
    if (!_message) {
        _message =[UILabel LabelWithTextColor:[UIColor grayColor] textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentCenter numberOfLines:1];
        //[Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_myName];
    }
    return _message;
}


-(instancetype)initWithFrame:(CGRect)frame{
    if (self =[super initWithFrame:frame]) {
        self.backgroundColor = naverTextColor;
        //顶部
        [self addSubview:self.centerIcon];
        [self addSubview:self.message];
        
        [self.centerIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top).with.offset(10);
            make.centerX.mas_equalTo(self.mas_centerX);
            make.width.mas_equalTo((SXRealValue(150)));
            make.height.mas_equalTo((SXRealValue(150)));
        }];
        [self.message mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).with.offset(0);
            make.top.mas_equalTo(self.centerIcon.mas_bottom).with.offset(20);
            make.right.mas_equalTo(self.mas_right).with.offset(0);
            make.height.mas_equalTo((SYRealValue(30)));
        }];
    }
    return self;
}


@end
