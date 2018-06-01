//
//  BCMeQRCodeController.m
//  BlockChain
//
//  Created by Mac on 2018/5/23.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCMeQRCodeController.h"
#import "BCMeQRCodeView.h"
#import "BCMeModel.h"
#import <Photos/PhotosDefines.h>
#import <Photos/Photos.h>

@interface BCMeQRCodeController ()
@property(nonatomic,strong)BCMeQRCodeView *qRcodeView;

@end

@implementation BCMeQRCodeController


-(BCMeModel *)meModel{
    if (!_meModel) {
        _meModel =[[BCMeModel alloc] init];
    }
    return _meModel;
}

/**顶部view**/
-(BCMeQRCodeView *)qRcodeView{
    if (!_qRcodeView) {
        _qRcodeView = [[BCMeQRCodeView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-kTopHeight)];
        [_qRcodeView.QRCodeBtn1 addTarget:self action:@selector(QRCodeBtn1Click) forControlEvents:UIControlEventTouchUpInside];
        [_qRcodeView.QRCodeBtn2 addTarget:self action:@selector(QRCodeBtn2Click) forControlEvents:UIControlEventTouchUpInside];
        //生成一张二维码的图片
//        self.meModel.Qimage =[Util getColorQrcodeWithToken:[USER_DEFAULT valueForKey:@"token"] SmallCenterImage:[UIImage imageNamed:@"lg"] imageWidth:SXRealValue(50) color1:CI_RGBACOLOR(129, 0, 244, 1)  color2:CI_RGBACOLOR(255, 255, 255, 1)];
         UIImage*Qimage=[Util getColorQimageWithPath:[USER_DEFAULT valueForKey:@"token"] withImageView:nil WithSize:500 withCenterIcon:[UIImage imageNamed:@"lg"] centerIconWidth:SXRealValue(80) withRed:129.0f andGreen:0.0f andBlue:224.0f];
        self.meModel.Qimage=Qimage;
        _qRcodeView.model =self.meModel;
    }
    return _qRcodeView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.meModel.isShouKuan=self.isShouKuan;
    //设置导航栏
    [self setNaviTitle];
    //加载扫描界面
    [self.view addSubview:self.qRcodeView];
}
-(void)setNaviTitle{
    self.navigationItem.title=@"收款";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:FONT(@"PingFangSC-Regular", SXRealValue(17)),
       NSForegroundColorAttributeName:naverTextColor}];
}
//复制收款地址
-(void)QRCodeBtn1Click{
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    NSString *token =[USER_DEFAULT valueForKey:@"token"];
    pasteboard.string = token;
    [MBManager showBriefAlert:@"复制成功"];
}
//保存二维码到手机
-(void)QRCodeBtn2Click{
    //截屏
    [Util savePhotoWithJiePingView:self.view];
    [MBManager showBriefAlert:@"保存到手机成功"];
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
