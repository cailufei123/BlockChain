//
//  BCMeQRCodeView.m
//  BlockChain
//
//  Created by Mac on 2018/5/23.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//
//二维码view
#import "BCMeQRCodeView.h"
#import "BCMeModel.h"
#import "KMQRCode.h"


@interface BCMeQRCodeView()

@property (nonatomic, strong)UIView *bigView;


/** 二维码正方形view*/
@property (nonatomic, strong)UIView *view;
/** 二维码*/
@property (nonatomic, strong)UIImageView *QRImage;

/** 提示*/
@property (nonatomic, strong)UILabel *message;

@end
@implementation BCMeQRCodeView

-(UIView *)bigView{
    if (!_bigView) {
        _bigView = [[UIView alloc] init];
        _bigView.backgroundColor =bagColor;
        //  [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_downView];
    }
    return _bigView;
}
-(UILabel *)QRCode{
    if (!_QRCode) {
        _QRCode =[UILabel LabelWithTextColor:color484848 textFont:FONT(@"PingFangSC-Regular", SXRealValue(14)) textAlignment:NSTextAlignmentCenter numberOfLines:2];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_QRCode];
    }
    return _QRCode;
}
-(UIButton *)QRCodeBtn1{
    if (!_QRCodeBtn1) {
        _QRCodeBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_QRCodeBtn1 setTitleColor:naverTextColor forState:UIControlStateNormal];
        _QRCodeBtn1.titleLabel.font = FONT(@"PingFangSC-Semibold", SXRealValue(14));
        _QRCodeBtn1.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_QRCodeBtn1 setBackgroundColor:color9164D6];
        [_QRCodeBtn1  setHitEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -10)];//热区域
        [Util roundBorderView:SXRealValue(2) border:0 color:[UIColor blackColor] view:_QRCodeBtn1];
    }
    return _QRCodeBtn1;
}

-(UIView *)view{
    if (!_view) {
        _view = [[UIView alloc] init];
        _view.backgroundColor =naverTextColor;
//          [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_view];
    }
    return _view;
}

-(UIImageView *)QRImage{
    if (!_QRImage) {
        _QRImage = [[UIImageView alloc] init];
        //_myIcon.contentMode = UIViewContentModeScaleAspectFill;
        //[Util roundBorderView:SXRealValue(60/2) border:0 color:nil view:_ziChanIcon];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_QRImage];
        
    }
    return _QRImage;
}


-(UIButton *)QRCodeBtn2{
    if (!_QRCodeBtn2) {
        _QRCodeBtn2 = [UIButton getButtonTitleColor:color484848 titleFont:FONT(@"PingFangSC-Regular", SXRealValue(12)) backGroundColor:nil target:self action:nil];
        _QRCodeBtn2.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_QRCodeBtn2  setHitEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -10)];//热区域
        //给button添加下划线
        NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:@"保存二维码到手机"];
        NSRange titleRange = {0,[title length]};
        [title addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:titleRange];
        [self.QRCodeBtn2 setAttributedTitle:title
                                   forState:UIControlStateNormal];
        [Util roundBorderView:SXRealValue(2) border:0 color:[UIColor blackColor] view:_QRCodeBtn2];
    }
    return _QRCodeBtn2;
}
-(UILabel *)message{
    if (!_message) {
        _message =[UILabel LabelWithTextColor:color000000 textFont:FONT(@"PingFangSC-Regular", SXRealValue(10)) textAlignment:NSTextAlignmentLeft numberOfLines:2];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_message];
    }
    return _message;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self =[super initWithFrame:frame]) {
        //顶部
        [self.bigView addSubview:self.QRCode];
        [self.bigView addSubview:self.QRCodeBtn1];
        [self.bigView addSubview:self.view];
        [self.view addSubview:self.QRImage];
        [self.bigView addSubview:self.QRCodeBtn2];
        [self.bigView addSubview:self.message];
        [self addSubview:self.bigView];

        [self.bigView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).with.offset(0);
            make.top.mas_equalTo(self.mas_top).with.offset(0);
            make.right.mas_equalTo(self.mas_right).with.offset(0);
            make.bottom.mas_equalTo(self.mas_bottom).with.offset(0);
        }];
        [self.QRCode mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.bigView.mas_top).with.offset(SYRealValue(20));
            make.centerX.equalTo(self.bigView.mas_centerX);
            make.width.mas_equalTo(SCREENWIDTH-2*(SXRealValue(50)));
            make.height.mas_equalTo((SCREENWIDTH-2*(SXRealValue(50)))*66/320);
        }];
        [self.QRCodeBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.QRCode.mas_bottom).with.offset(SYRealValue(6));
            make.centerX.equalTo(self.bigView.mas_centerX);
            make.width.mas_equalTo(SCREENWIDTH-2*(SXRealValue(40)));
            make.height.mas_equalTo((SYRealValue(40)));
        }];
        [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.QRCodeBtn1.mas_bottom).with.offset(SYRealValue(17));
            make.centerX.equalTo(self.bigView.mas_centerX);
            make.width.mas_equalTo(SCREENWIDTH-2*(SXRealValue(40)));
            make.height.mas_equalTo(SCREENWIDTH-2*(SXRealValue(40))*277/296);
        }];
        [self.QRImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view.mas_top).with.offset(SYRealValue(12));
            make.centerX.equalTo(self.view.mas_centerX);
            make.width.mas_equalTo(SCREENWIDTH-2*(SXRealValue(40+35)));
            make.height.mas_equalTo((SCREENWIDTH-2*(SXRealValue(40+35))*221/228));
        }];
        [self.QRCodeBtn2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.QRImage.mas_bottom).with.offset(SYRealValue(12));
            make.centerX.equalTo(self.bigView.mas_centerX);
        }];
        [self.message mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view.mas_bottom).with.offset((SYRealValue(10)));
            make.centerX.equalTo(self.bigView.mas_centerX);
            make.width.mas_equalTo(SCREENWIDTH-2*(SXRealValue(40)));
            make.height.mas_equalTo((SYRealValue(58)));
        }];
        [self setNeedsLayout];
        [self layoutIfNeeded];
        
    }
    return self;
}

-(void)setModel:(BCMeModel *)model{
    _model =model;
    if (model!=nil) {
             self.QRCode.text =model.token;   //传递code码
            [self.QRCodeBtn1 setTitle:@"复制收款地址" forState:UIControlStateNormal];
//        self.QRImage.image =model.Qimage;
        [self.QRCodeBtn2 setTitle:@"保存二维码到手机" forState:UIControlStateNormal];
        self.message.text =@"温馨提示:改地址仅用于接收ETH和ERC20 Token,请不要向该地址发送不符合ERC20标准的Token";
        //生成二维码
        [self colorQrcode];
    }
}

#pragma 复制收款地址
-(void)tangGuoBtnClick:(UIButton *)button{
//    if (self.delegate && [self.delegate respondsToSelector:@selector(tangGuoBtnClick)]) {
//        [self.delegate tangGuoBtnClick];
//    }

}
#pragma mark -保存二维码到手机
-(void)QRCodeBtn2Click:(UIButton *)button{
    //    if (self.delegate && [self.delegate respondsToSelector:@selector(moreTangGuoBtnClick)]) {
    //        [self.delegate moreTangGuoBtnClick];
    //    }
}

//MARK:彩色的二维码
-(void)colorQrcode{
    //二维码的实质是 字符串, 我们生产二维码,就是根据字符串去生产一张图片
    //获取内建的所有过滤器.
    // NSArray *filterArr = [CIFilter filterNamesInCategories:kCICategoryBuiltIn]; //也对
    NSArray *filterArr = [CIFilter filterNamesInCategories:@[kCICategoryBuiltIn]];   //对
    NSLog(@"%@",filterArr); //所有内建过滤器,找CR... 二维码的
    //创建二维码过滤器
    CIFilter * qrfilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    //设置默认属性(老油条)
    [qrfilter setDefaults];
    //我们需要给 二维码过期器 设置一下属性,给它一些东西,让它去生成图片吧,那些属性呢,跳进去看
    NSLog(@"%@",qrfilter.inputKeys);
    /*
     inputMessage,            //二维码的信息
     inputCorrectionLevel     //二维码的容错率 ()到达一定值后,就不能识别二维码了
     */
    //我们需要给 二维码 的 inputMessage 设置值,  这是私有属性,我们 使用KVC.给其私有属性赋值
    //将字符串转为NSData,去获取图片
    NSData * qrimgardata = [self.model.token dataUsingEncoding:NSUTF8StringEncoding];
    //去获取对应的图片(因为测试,直接用字符串会崩溃)
    [qrfilter setValue:qrimgardata forKey:@"inputMessage"];
    //去获得对应图片 outPut
    CIImage *qrImage = qrfilter.outputImage;
    //图片不清除,打印知道其 大小 为 (27,27). 进入 CIImage,看属性,
    qrImage = [qrImage imageByApplyingTransform:CGAffineTransformMakeScale(9, 9)];
    
    
    //创建彩色过滤器   (彩色的用的不多)-----------------------------------------------------
    CIFilter * colorFilter = [CIFilter filterWithName:@"CIFalseColor"];
    //设置默认值
    [colorFilter setDefaults];
    
    //同样打印这样的 输入属性  inputKeys
    NSLog(@"%@",colorFilter.inputKeys);
    /*
     inputImage,   //输入的图片
     inputColor0,  //前景色
     inputColor1   //背景色
     */
    //KVC 给私有属性赋值
    [colorFilter setValue:qrImage forKey:@"inputImage"];
    
    //需要使用 CIColor
//    [colorFilter setValue:[CIColor colorWithRed:147 green:58 blue:226] forKey:@"inputColor1"];
    [colorFilter setValue:[CIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1] forKey:@"inputColor0"];
    [colorFilter setValue:[CIColor colorWithRed:129/255.0 green:0/255.0 blue:224/255.0 alpha:1] forKey:@"inputColor1"];
    //设置输出
    CIImage *colorImage = [colorFilter outputImage];
    //但是图片 发现有的小 (27,27),我们需要放大..我们进去CIImage 内部看属性
    //    colorImage = [qrImage imageByApplyingTransform:CGAffineTransformMakeScale(20, 20)];
    //-----------------------------------------
    UIImage *qrUIImage = [UIImage imageWithCIImage:colorImage];
    //----------------给 二维码 中间增加一个 自定义图片----------------
    //开启绘图,获取图形上下文  (上下文的大小,就是二维码的大小)
    UIGraphicsBeginImageContext(qrUIImage.size);
    
    //把二维码图片画上去. (这里是以,图形上下文,左上角为 (0,0)点)
    [qrUIImage drawInRect:CGRectMake(0, 0, qrUIImage.size.width, qrUIImage.size.height)];
    //再把小图片画上去
    UIImage *sImage = [UIImage imageNamed:@"1024px"];
    
    CGFloat sImageW = 50;
    CGFloat sImageH= sImageW;
    CGFloat sImageX = (qrUIImage.size.width - sImageW) * 0.5;
    CGFloat sImgaeY = (qrUIImage.size.height - sImageH) * 0.5;
    [sImage drawInRect:CGRectMake(sImageX, sImgaeY, sImageW, sImageH)];
    //获取当前画得的这张图片
    UIImage *finalyImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭图形上下文
    UIGraphicsEndImageContext();
    self.QRImage.image =finalyImage;
    
}



@end
