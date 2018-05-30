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


/**顶部view**/
-(BCMeQRCodeView *)qRcodeView{
    if (!_qRcodeView) {
        _qRcodeView = [[BCMeQRCodeView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-kTopHeight)];
        [_qRcodeView.QRCodeBtn1 addTarget:self action:@selector(QRCodeBtn1Click) forControlEvents:UIControlEventTouchUpInside];
        [_qRcodeView.QRCodeBtn2 addTarget:self action:@selector(QRCodeBtn2Click) forControlEvents:UIControlEventTouchUpInside];
        _qRcodeView.model =self.meModel;
    }
    return _qRcodeView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏
    [self setNaviTitle];
    //加载扫描界面
    [self.view addSubview:self.qRcodeView];
}
-(void)setNaviTitle{
    self.navigationItem.title=@"收款码";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:FONT(@"PingFangSC-Regular", SXRealValue(17)),
       NSForegroundColorAttributeName:naverTextColor}];
}
//复制收款地址
-(void)QRCodeBtn1Click{
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = self.meModel.token;
}
//保存二维码到手机
-(void)QRCodeBtn2Click{
    [self savePhoto];
}



#pragma mark--------保存图片到相册功能，ALAssetsLibraryiOS9.0 以后用photoliabary 替代，--
-(void)savePhoto

{
    UIImage * image = [self captureImageFromView:self.view];
    [self loadImageFinished:image ];
}


- (void)loadImageFinished:(UIImage *)image
{
    NSMutableArray *imageIds = [NSMutableArray array];
    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
        //写入图片到相册
        PHAssetChangeRequest *req = [PHAssetChangeRequest creationRequestForAssetFromImage:image];
        //记录本地标识，等待完成后取到相册中的图片对象
        [imageIds addObject:req.placeholderForCreatedAsset.localIdentifier];
    } completionHandler:^(BOOL success, NSError * _Nullable error) {
        NSLog(@"success = %d, error = %@", success, error);
        if (success)
        {
            //成功后取相册中的图片对象
            __block PHAsset *imageAsset = nil;
            PHFetchResult *result = [PHAsset fetchAssetsWithLocalIdentifiers:imageIds options:nil];
            [result enumerateObjectsUsingBlock:^(PHAsset * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                imageAsset = obj;
                *stop = YES;
            }];
            if (imageAsset)
            {
                //加载图片数据
                [[PHImageManager defaultManager] requestImageDataForAsset:imageAsset
                                                                  options:nil
                                                            resultHandler:^(NSData * _Nullable imageData, NSString * _Nullable dataUTI, UIImageOrientation orientation, NSDictionary * _Nullable info) {
                                                                NSLog(@"imageData = %@", imageData);
                                                            }];
            }
        }
    }];
}

//截图功能

-(UIImage *)captureImageFromView:(UIView *)view{
    
    CGRect screenRect = [view bounds];
    UIGraphicsBeginImageContextWithOptions((screenRect.size), NO, 0.0);//currentView 当前的view  创建一个基于位图的图形上下文并指定大小为
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:ctx];//renderInContext呈现接受者及其子范围到指定的上下文
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();//返回一个基于当前图形上下文的图片
    UIGraphicsEndImageContext();
    return image;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
