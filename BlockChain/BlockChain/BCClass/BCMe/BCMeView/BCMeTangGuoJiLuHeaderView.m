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

@end
@implementation BCMeTangGuoJiLuHeaderView

-(UIImageView *)liLuCaiFuIcon{
    if (!_liLuCaiFuIcon) {
        _liLuCaiFuIcon = [[UIImageView alloc] init];
        //_myIcon.contentMode = UIViewContentModeScaleAspectFill;
        //[Util roundBorderView:SXRealValue(60/2) border:0 color:nil view:_myIcon];
        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_liLuCaiFuIcon];
    }
    return _liLuCaiFuIcon;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self =[super initWithFrame:frame]) {
        self.backgroundColor = naverTextColor;
        //顶部
        [self addSubview:self.liLuCaiFuIcon];
        [self.liLuCaiFuIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.centerY.equalTo(self.mas_centerY);
            make.width.mas_equalTo(SXRealValue(215));
            make.height.mas_equalTo((SYRealValue(59)));
        }];
    }
    return self;
}

                                    
-(void)setUpImage:(UIImage *)image{
    self.liLuCaiFuIcon.image = image;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
