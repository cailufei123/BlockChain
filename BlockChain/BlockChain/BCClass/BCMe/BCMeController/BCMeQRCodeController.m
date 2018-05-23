//
//  BCMeQRCodeController.m
//  BlockChain
//
//  Created by Mac on 2018/5/23.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCMeQRCodeController.h"
#import "BCMeQRCodeView.h"
#import "BCQRCodeMode.h"

@interface BCMeQRCodeController ()
@property(nonatomic,strong)BCMeQRCodeView *qRcodeView;
@property(nonatomic,strong)BCQRCodeMode *model;

@end

@implementation BCMeQRCodeController

-(BCQRCodeMode *)model{
    if (!_model) {
        _model=[[BCQRCodeMode alloc] init];
    }
    return _model;
}

/**顶部view**/
-(BCMeQRCodeView *)qRcodeView{
    if (!_qRcodeView) {
        _qRcodeView = [[BCMeQRCodeView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-kTopHeight)];
        [_qRcodeView.QRCodeBtn1 addTarget:self action:@selector(QRCodeBtn1Click) forControlEvents:UIControlEventTouchUpInside];
        [_qRcodeView.QRCodeBtn2 addTarget:self action:@selector(QRCodeBtn2Click) forControlEvents:UIControlEventTouchUpInside];
        _qRcodeView.model =self.model;
    }
    return _qRcodeView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //加载扫描界面
    [self.view addSubview:self.qRcodeView];
}
//复制收款地址
-(void)QRCodeBtn1Click{
    //UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    //pasteboard.string = self.label.text;
}
//保存二维码到手机
-(void)QRCodeBtn2Click{
//    UIImage *newImage = [UIImage imageWithCIImage:image];
//    UIGraphicsBeginImageContext(newImage.size);
//    //  绘制二维码图片
//    [newImage drawInRect:CGRectMake(0, 0, newImage.size.width, newImage.size.height)];
//    //  从图片上下文中取出图片
//    newImage  = UIGraphicsGetImageFromCurrentImageContext();
//    //  关闭图片上下文
//    UIGraphicsEndImageContext();
//    //保存图片到相册
//    UIImageWriteToSavedPhotosAlbum(newImage, nil, nil, NULL);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end