//
//  BCPDCListAlertView.m
//  BlockChain
//
//  Created by Mac on 2018/5/23.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCMePDCListAlertView.h"
#import "BCMePDCListMode.h"

@interface BCMePDCListAlertView()

/** PDC详情名字*/
@property (nonatomic, strong)UILabel *xiangQingLable;
/** 项目名字*/
@property (nonatomic, strong)UILabel *mingChengLable;
/** 标语*/
@property (nonatomic, strong)UILabel *biaoYuLable;
/** 项目介绍*/
@property (nonatomic, strong)UILabel *jieShaoLable;
/** 发行*/
@property (nonatomic, strong)UILabel *faXingLable;
/** 发行价格*/
@property (nonatomic, strong)UILabel *faXingPriceLable;
/** 官网*/
@property (nonatomic, strong)UILabel *guanWangLable;
/** 跳转官网*/
@property (nonatomic, strong)UIButton *guanWangBtn;


@end
@implementation BCMePDCListAlertView

-(UILabel *)xiangQingLable{
    if (!_xiangQingLable) {
        _xiangQingLable =[UILabel LabelWithTextColor:color414754 textFont:FONT(@"PingFangSC-Semibold", SXRealValue(18)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_xiangQingLable];
    }
    return _xiangQingLable;
}
//-(UILabel *)mingChengLable{
//    if (!_mingChengLable) {
//        _mingChengLable =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(14)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_label2];
//    }
//    return _mingChengLable;
//}
//
//-(UILabel *)label3{
//    if (!_label3) {
//        _label3 =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(14)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_label3];
//    }
//    return _label3;
//}
//-(UILabel *)label4{
//    if (!_label4) {
//        _label4 =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(14)) textAlignment:NSTextAlignmentLeft numberOfLines:0];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_label4];
//    }
//    return _label4;
//}

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

-(void)setModel:(BCMePDCListMode *)model{
    _model =model;
    
}

@end
