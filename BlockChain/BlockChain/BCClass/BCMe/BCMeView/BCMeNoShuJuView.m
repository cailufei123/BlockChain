//
//  BCMeNoShuJuView.m
//  BlockChain
//
//  Created by Mac on 2018/6/8.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCMeNoShuJuView.h"

@interface BCMeNoShuJuView()


@end
@implementation BCMeNoShuJuView

-(UIImageView *)centerIcon{
    if (!_centerIcon) {
        _centerIcon = [[UIImageView alloc] init];
        //_myIcon.contentMode = UIViewContentModeScaleAspectFill;
        [Util roundBorderView:0 border:0 color:nil view:_centerIcon];
    }
    return _centerIcon;
}

-(UILabel *)message{
    if (!_message) {
        _message =[UILabel LabelWithTextColor:bkColor textFont:SYSTEMFONT(SXRealValue(15)) textAlignment:NSTextAlignmentCenter numberOfLines:1];
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
            make.centerX.mas_equalTo(self.mas_centerX);
            make.bottom.mas_equalTo(self.mas_centerY).with.offset(0);
            make.width.mas_equalTo((SXRealValue(150)));
            make.height.mas_equalTo((SXRealValue(150)));
        }];
        [self.message mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).with.offset(0);
            make.top.mas_equalTo(self.centerIcon.mas_bottom).with.offset(30);
            make.right.mas_equalTo(self.mas_right).with.offset(0);
            make.height.mas_equalTo((SYRealValue(30)));
        }];
    }
    return self;
}




@end
