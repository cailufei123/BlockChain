//
//  BCPDCListAlertView.m
//  BlockChain
//
//  Created by Mac on 2018/5/23.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCMePDCListAlertView.h"

@interface BCMePDCListAlertView()
@property (nonatomic, strong)UIView *bigView;
@property (nonatomic, strong)UIView *upBigView;
/** PDC总数*/
@property (nonatomic, strong)UILabel *price;
@end
@implementation BCMePDCListAlertView

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

        
    }
    return self;
}


@end
