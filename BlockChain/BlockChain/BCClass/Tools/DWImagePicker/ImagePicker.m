//
//  ImagePicker.m
//  DWImagePicker
//
//  Created by dwang_sui on 16/6/20.
//  Copyright © 2016年 dwang_sui. All rights reserved.
//

#import "ImagePicker.h"
#import <Photos/Photos.h>
#import <AVFoundation/AVFoundation.h>
#import<AVFoundation/AVCaptureDevice.h>
#import <AVFoundation/AVMediaFormat.h>
#import<AssetsLibrary/AssetsLibrary.h>
#import<CoreLocation/CoreLocation.h>
//如果有Debug这个宏的话,就允许log输出...可变参数
#ifdef DEBUG
#define DWLog(...) NSLog(__VA_ARGS__)
#else
#define DWLog(...)
#endif


@implementation ImagePicker

static ImagePicker *sharedManager = nil;

+ (ImagePicker *)sharedManager {
    
    @synchronized (self) {
        
        if (!sharedManager) {
            
            sharedManager = [[[self class] alloc] init];
            
        }
        
    }
    
    return sharedManager;
}

#pragma mark ---设置根控制器 弹框添加视图位置 所需图片样式 默认为UIImagePickerControllerEditedImage
- (void)dwSetPresentDelegateVC:(id)vc SheetShowInView:(UIView *)view InfoDictionaryKeys:(NSInteger)integer {
    
    
    picker = [[UIImagePickerController alloc]init];
    
    picker.delegate = self;
    
    self.integer = integer;
    
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"提示" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"相机" otherButtonTitles:@"相册", nil];
    
    [sheet showInView:view];
    
    picker.allowsEditing = YES;
    
    self.allowsEditing = picker.allowsEditing;
    
    self.vc = vc;
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        
        self.typeStr = @"支持相机";
        
    }
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
    {
        
        self.typeStr = @"支持图库";
        
    }
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum])
    {
        
        self.typeStr = @"支持相片库";
        
    }

    
    
    
    
    
    }

#pragma mark ---获取设备支持的类型与选中之后的图片
- (void)dwGetpickerTypeStr:(pickerTypeStr)pickerTypeStr pickerImagePic:(pickerImagePic)pickerImagePic {
    
    if (pickerTypeStr) {
        
        pickerTypeStr(self.typeStr);
        
    }
    
    self.pickerImagePic = ^(UIImage *image) {
        
        pickerImagePic(image);
        
    };
    
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
        UIImage *image = [[UIImage alloc] init];
        
        NSArray *array = @[@"UIImagePickerControllerMediaType",
                           @"UIImagePickerControllerOriginalImage",
                           @"UIImagePickerControllerEditedImage",
                           @"UIImagePickerControllerCropRect",
                           @"UIImagePickerControllerMediaURL",
                           @"UIImagePickerControllerReferenceURL",
                           @"UIImagePickerControllerMediaMetadata",
                           @"UIImagePickerControllerLivePhoto"];
        
        if (self.integer) {
            
            image = [info objectForKey:array[self.integer]];
            
        }else {
            
            image = [info objectForKey:array[2]];
            
        }
        
        if (self.pickerImagePic) {
            
            self.pickerImagePic(image);
            
        }
        
        [self.vc dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [self.vc dismissViewControllerAnimated:YES completion:nil];
    
}

- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 0) {
        
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunicode-whitespace"
        
        
        NSString *mediaType = AVMediaTypeVideo;// Or AVMediaTypeAudio
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
        
        if(authStatus ==AVAuthorizationStatusRestricted){// 此应用程序没有被授权访问的照片数据。可能是家长控制权限
            NSLog(@"Restricted");
        }else if(authStatus == AVAuthorizationStatusDenied){// 用户已经明确否认了这一照片数据的应用程序访问
            // The user has explicitly denied permission for media capture.
            NSLog(@"Denied");     //应该是这个，如果不允许的话
            
         UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"请在设备的设置-隐私-相机中允许访问相机。" preferredStyle:UIAlertControllerStyleAlert];
           UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
               UIAlertAction *cacaleAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                   NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                   if ([[UIApplication sharedApplication] canOpenURL:url]) {
                       [[UIApplication sharedApplication] openURL:url];
                   }

               }];
            [alertController addAction:okAction];
                     [alertController addAction:cacaleAction];
            
            
               [self.vc presentViewController:alertController animated:YES completion:nil];
            
            
           
            return;
        }
        else if(authStatus == AVAuthorizationStatusAuthorized){//允许访问// 用户已经授权应用访问照片数据
            
            [self.vc presentViewController:picker animated:YES completion:nil];
            
        }else if(authStatus == AVAuthorizationStatusNotDetermined){// 用户尚未做出选择这个应用程序的问候
            // Explicit user permission is required for media capture, but the user has not yet granted or denied such permission.
            [AVCaptureDevice requestAccessForMediaType:mediaType completionHandler:^(BOOL granted) {
                if(granted){//点击允许访问时调用
                    //用户明确许可与否，媒体需要捕获，但用户尚未授予或拒绝许可。
                    NSLog(@"Granted access to %@", mediaType);
                    [self.vc presentViewController:picker animated:YES completion:nil];

                }else {
                    NSLog(@"Not granted access to %@", mediaType);
                }
                
            }];
        }else {
            NSLog(@"Unknown authorization status");
        }
        

        
        
        
        
        
        
        
        
       
        
#pragma clang diagnostic pop
        
        
    }else if (buttonIndex == 1) {
        
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
       
        ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
        LFLog(@"%ld",(long)author);
//        ALAuthorizationStatus status = [ALAssetsLibrary authorizationStatus];
        
        
        
        if(author == kCLAuthorizationStatusRestricted || author ==kCLAuthorizationStatusDenied){
           
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"请在设备的设置-隐私-相册中允许访问相机。" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
            UIAlertAction *cacaleAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                if ([[UIApplication sharedApplication] canOpenURL:url]) {
                    [[UIApplication sharedApplication] openURL:url];
                }
                
            }];
            [alertController addAction:okAction];
            [alertController addAction:cacaleAction];
            
            
            [self.vc presentViewController:alertController animated:YES completion:nil];
           

            
        }else if(author ==  kCLAuthorizationStatusAuthorizedAlways ){
            
           
            [self.vc presentViewController:picker animated:YES completion:nil];
            picker.navigationBar.barTintColor = [naverBagColor colorWithAlphaComponent:1];
            picker.navigationBar.translucent = NO;
//            picker.navigationItem.title = @"相片8888";
//        
//            
//            UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"33r" style:UIBarButtonItemStylePlain target:self action: @selector(sss)]; //创建一个右边按钮
//            picker.navigationItem.rightBarButtonItem = rightButton;
            
        }else if(author ==  kCLAuthorizationStatusNotDetermined ){
            
             [self.vc presentViewController:picker animated:YES completion:nil];
           
            picker.navigationBar.barTintColor = [naverBagColor colorWithAlphaComponent:1];
          picker.navigationBar.translucent = NO;
            
            
        }
        
        
        [picker.navigationBar setTitleTextAttributes:
         
                      @{NSFontAttributeName:[UIFont boldSystemFontOfSize:18],
         
                        NSForegroundColorAttributeName:[UIColor whiteColor]}];
        
        
        
        
        
        
        
        
        
    }
    
}
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated

{
    
    viewController.navigationItem.title = @"相册";
//    UIButton *cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(0,0,50,30)];
//    
//  
//    
////    cancelBtn.backgroundColor = [UIColor whiteColor];
//    
//    [cancelBtn addTarget:self action:@selector(click) forControlEvents:(UIControlEventTouchUpInside)];
//    
//    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithCustomView:cancelBtn];
//    
//    [viewController.navigationItem setRightBarButtonItem:btn animated:NO];
    
     viewController.navigationItem.rightBarButtonItem .tintColor = [UIColor whiteColor];
    
}




@end
