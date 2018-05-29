//
//  BCReaNameController.m
//  BlockChain
//
//  Created by 蔡路飞 on 2018/5/24.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCReaNameController.h"
#import "ImagePicker.h"
#import "AFHTTPSessionManager.h"
@interface BCReaNameController (){
    
    ImagePicker *imagePicker;
    
}
@property (weak, nonatomic) IBOutlet UITextField *realNameTf;
@property (weak, nonatomic) IBOutlet UITextField *cardIDnumberTf;
@property (weak, nonatomic) IBOutlet UIButton *frontBt;
@property (weak, nonatomic) IBOutlet UIImageView *frontImg;
@property (weak, nonatomic) IBOutlet UIImageView *backImg;
@property (weak, nonatomic) IBOutlet UIButton *backBt;
@property (weak, nonatomic) IBOutlet UIImageView *handImg;
@property (weak, nonatomic) IBOutlet UIButton *handbt;

@property (weak, nonatomic) IBOutlet UIButton *nextBt;

@property (copy, nonatomic)NSString * idFrontImages;
@property (copy, nonatomic)NSString * idBackImages;
@property (copy, nonatomic)NSString * idPersonImages;
@property(strong,nonatomic)UIButton * selectbt;
@end

@implementation BCReaNameController

- (void)viewDidLoad {
    [super viewDidLoad];
       self.view.backgroundColor = bagColor;
    self.navigationItem.title = @"实名认证";
    self.realNameTf.borderStyle = UITextBorderStyleNone;
      self.cardIDnumberTf.borderStyle = UITextBorderStyleNone;
    [self.frontBt addTarget:self action:@selector(frontBtClick:) forControlEvents:UIControlEventTouchUpInside];
     [self.backBt addTarget:self action:@selector(backBtClick:) forControlEvents:UIControlEventTouchUpInside];
     [self.handbt addTarget:self action:@selector(handbtClick:) forControlEvents:UIControlEventTouchUpInside];
     [self.nextBt addTarget:self action:@selector(nextBtClick:) forControlEvents:UIControlEventTouchUpInside];
      imagePicker = [ImagePicker sharedManager];
}
-(void)frontBtClick:(UIButton * )bt{
      [self updataImageBtC];
    self.selectbt = bt;
}
-(void)backBtClick:(UIButton * )bt{
     self.selectbt = bt;
      [self updataImageBtC];
}
-(void)handbtClick:(UIButton * )bt{
     self.selectbt = bt;
    [self updataImageBtC];
}
-(void)nextBtClick:(UIButton * )bt{
    if (self.realNameTf.text.length<=0) {
        [MBManager showBriefAlert:@"姓名不能为空"];return;
    }else if (self.cardIDnumberTf.text.length<=0){
        
         
        if (![self.cardIDnumberTf.text simpleVerifyIdentityCardNum]) {
             [MBManager showBriefAlert:@"身份证号不正确"];return;
        }
       
    }else if (self.idFrontImages.length<=0){
        [MBManager showBriefAlert:@"请上传身份证正面图片"];return;
    }else if (self.idBackImages.length<=0){
        [MBManager showBriefAlert:@"请上传身份证反面图片"];return;
    }else if (self.idPersonImages.length<=0){
        [MBManager showBriefAlert:@"请上传手持身份证图片"];return;
    }
    
    NSMutableDictionary * realNameIDDict = diction;
    realNameIDDict[@"token"] = loginToken;
    realNameIDDict[@"realName"] =self.realNameTf.text;
    realNameIDDict[@"idNo"] = self.cardIDnumberTf.text;
    realNameIDDict[@"idFrontImages"] = self.idFrontImages;
     realNameIDDict[@"idBackImages"] = self.idBackImages;
     realNameIDDict[@"idPersonImages"] = self.idPersonImages;
    [YWRequestData realNameIDDict:realNameIDDict success:^(id responseObj) {
        [MBManager showBriefAlert:@"信息提交成功"];
        [self.navigationController popViewControllerAnimated:YES];
    }];
}
-(void)updataImageBtC{
   
    //设置主要参数
    [imagePicker dwSetPresentDelegateVC:self SheetShowInView:self.view InfoDictionaryKeys:(long)nil];
    
    //回调
    [imagePicker dwGetpickerTypeStr:^(NSString *pickerTypeStr) {
      
        NSLog(@"%@",pickerTypeStr);
        
    } pickerImagePic:^(UIImage *pickerImagePic) {
       
        [self updataImage:pickerImagePic];
        
    }];
    
    
}
/**上传图片*/
-(void)updataImage:(UIImage * )iconImage {
    
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    //1.创建网络管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //立马显示进度值（防止因为网速，导致显示的是其他图片的下载进度）
    
    //[self.progressView setProgress:0 animated:NO];
    [MBManager showWaitingWithTitle:@"上传中.."];
    // 3.发送请求
    LFLog(@"%@",USER_IMG_UPLOAD);
    [manager POST:USER_IMG_UPLOAD  parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSData *imageData = UIImageJPEGRepresentation(iconImage, 0.8);//进行图片压缩
        // 使用日期生成图片名称
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *fileName = [NSString stringWithFormat:@"%@.jpg",[formatter stringFromDate:[NSDate date]]];
        // 任意的二进制数据MIMEType application/octet-stream
        [formData appendPartWithFileData:imageData name:@"file" fileName:fileName mimeType:@"image/png"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        //        LFLog(@"%lld  %lld",uploadProgress.completedUnitCount,uploadProgress.totalUnitCount);
        //        //        //计算进度值
        //        self.progressView.hidden = NO;
        //        //计算进度值
        //        self.pictureProgress = (1.0 * uploadProgress.completedUnitCount) / (uploadProgress.totalUnitCount);
        //        //显示进度值
        //        [self.progressView setProgress:self.pictureProgress animated:NO];
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [MBManager hideAlert];
        
        NSLog(@"%@",responseObject);
        [self modifyImage:responseObject[@"data"]];
        NSString * img = responseObject[@"data"];
        
       
        
        if ( self.selectbt == self.frontBt) {
               self.frontImg.image = iconImage;
            self.idFrontImages = img;
        }else if ( self.selectbt == self.backBt){
              self.backImg.image = iconImage;
            self.idBackImages = img;
        }else if ( self.selectbt == self.handbt){
              self.handImg.image = iconImage;
            self.idPersonImages = img;
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [MBManager hideAlert];
        [MBManager showBriefAlert:@"上传失败"];
        
    }];
    
}

-(void)modifyImage:(NSString *)imageUrl{
    
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    dict[@"token"] = loginToken;
    dict[@"icon"] = imageUrl;
    
//    [LFHttpTool post:USER_IMG_MODIFY params:dict progress:^(id downloadProgress) {
//
//    } success:^(id responseObj) {
//        [self loadUserPage];
//        [MBManager hideAlert];
//    } failure:^(NSError *error) {
//        [MBManager hideAlert];
//        [MBManager showBriefAlert:@"上传失败"];
//    }];
//
    
}
@end
