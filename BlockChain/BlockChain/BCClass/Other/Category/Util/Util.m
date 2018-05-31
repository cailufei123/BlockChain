//
//  Util.m
//  firstview
//
//  Created by HL on 2017/10/18.
//  Copyright © 2017年 SZ. All rights reserved.
//

#import "Util.h"
#import <Photos/PhotosDefines.h>
#import <Photos/Photos.h>
@implementation Util


+(void)roundBorderView:(int)radix border:(float)width color:(UIColor*)borderColor view:(UIView*)pView;
{
    
    if(radix > 0){
        pView.layer.cornerRadius = radix;
        pView.clipsToBounds = YES;
    }
    if(width > 0)
        pView.layer.borderWidth = width;
    if(borderColor != nil)
        pView.layer.borderColor = [borderColor CGColor];
}

+(void)setUnderlineFromButton:(UIButton *)button textColor:(UIColor *)textColor underlineColor:(UIColor *)underlineColor{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"邀请码观看"];
    NSRange strRange = {0,[str length]};
    [str addAttributes:@{NSUnderlineStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle],NSUnderlineColorAttributeName:underlineColor,NSForegroundColorAttributeName:textColor} range:strRange];
    [button setAttributedTitle:str forState:UIControlStateNormal];
}

//封装cell背景色
+(void)selectCellBackgroundColor:(UITableViewCell *)cell{
    //选中背景
    UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    selectedBackgroundView.backgroundColor = naverBagColor;
    cell.selectedBackgroundView = selectedBackgroundView;
}
+(void)selectCellBackgroundColor:(UITableViewCell *)cell selectBackgroundColor:(UIColor *)color{
    //选中背景
    UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    selectedBackgroundView.backgroundColor = color;
    cell.selectedBackgroundView = selectedBackgroundView;
}

//虚线
+ (void)drawLineOfDashByCAShapeLayer:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor lineDirection:(BOOL)isHorizonal {
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    
    [shapeLayer setBounds:lineView.bounds];
    
    if (isHorizonal) {
        
        [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
        
    } else{
        [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame)/2)];
    }
    
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    if (isHorizonal) {
        [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    } else {
        
        [shapeLayer setLineWidth:CGRectGetWidth(lineView.frame)];
    }
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    
    if (isHorizonal) {
        CGPathAddLineToPoint(path, NULL,CGRectGetWidth(lineView.frame), 0);
    } else {
        CGPathAddLineToPoint(path, NULL, 0, CGRectGetHeight(lineView.frame));
    }
    
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}

//截屏

#pragma mark--------保存图片到相册功能，ALAssetsLibraryiOS9.0 以后用photoliabary 替代，--
+(void)savePhotoWithJiePingView:(UIView *)view
{
    
    CGRect screenRect = [view bounds];
    UIGraphicsBeginImageContextWithOptions((screenRect.size), NO, 0.0);//currentView 当前的view  创建一个基于位图的图形上下文并指定大小为
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:ctx];//renderInContext呈现接受者及其子范围到指定的上下文
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();//返回一个基于当前图形上下文的图片
    UIGraphicsEndImageContext();
    
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

+(UIImage *)captureImageFromView:(UIView *)view{
    
    CGRect screenRect = [view bounds];
    UIGraphicsBeginImageContextWithOptions((screenRect.size), NO, 0.0);//currentView 当前的view  创建一个基于位图的图形上下文并指定大小为
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:ctx];//renderInContext呈现接受者及其子范围到指定的上下文
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();//返回一个基于当前图形上下文的图片
    UIGraphicsEndImageContext();
    return image;
}


//根据token生成带颜色的二维码
//MARK:彩色的二维码
+(UIImage *)getColorQrcodeWithToken:(NSString *)token SmallCenterImage:(UIImage *)image imageWidth:(CGFloat)imageWidth color1:(CIColor*)color1 color2:(CIColor*)color2{
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
    NSData * qrimgardata = [token dataUsingEncoding:NSUTF8StringEncoding];
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
    [colorFilter setValue:color1 forKey:@"inputColor0"];
    [colorFilter setValue:color2 forKey:@"inputColor1"];
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
    UIImage *sImage = image;
    
    CGFloat sImageW = imageWidth;
    CGFloat sImageH= sImageW;
    CGFloat sImageX = (qrUIImage.size.width - sImageW) * 0.5;
    CGFloat sImgaeY = (qrUIImage.size.height - sImageH) * 0.5;
    [sImage drawInRect:CGRectMake(sImageX, sImgaeY, sImageW, sImageH)];
    //获取当前画得的这张图片
    UIImage *finalyImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭图形上下文
    UIGraphicsEndImageContext();
    return finalyImage;
}


@end
