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

/**
 *textColor 按钮颜色
 *underlineColor 按钮底线的颜色
 */
//设置button的地步下划线的方法
+(void)setUnderlineFromButton:(UIButton *)button textColor:(UIColor *)textColor underlineColor:(UIColor *)underlineColor{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:button.currentTitle];
    NSRange strRange = {0,[str length]};
    //设置下划线...
    /*
     NSUnderlineStyleNone                                    = 0x00, 无下划线
     NSUnderlineStyleSingle                                  = 0x01, 单行下划线
     NSUnderlineStyleThick NS_ENUM_AVAILABLE(10_0, 7_0)      = 0x02, 粗的下划线
     NSUnderlineStyleDouble NS_ENUM_AVAILABLE(10_0, 7_0)     = 0x09, 双下划线
     */
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
                                                                //NSLog(@"imageData = %@", imageData);
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
    //创建二维码过滤器
    CIFilter * qrfilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    //设置默认属性(老油条)
    [qrfilter setDefaults];
    //将字符串转为NSData,去获取图片
    NSData * qrimgardata = [token dataUsingEncoding:NSUTF8StringEncoding];
    //去获取对应的图片(因为测试,直接用字符串会崩溃)
    [qrfilter setValue:qrimgardata forKey:@"inputMessage"];
    //去获得对应图片 outPut
    CIImage *qrImage = qrfilter.outputImage;
    //图片不清除,打印知道其 大小 为 (27,27). 进入 CIImage,看属性,
//    qrImage = [qrImage imageByApplyingTransform:CGAffineTransformMakeScale(9, 9)];
    //创建彩色过滤器   (彩色的用的不多)-----------------------------------------------------
    CIFilter * colorFilter = [CIFilter filterWithName:@"CIFalseColor"];
    //设置默认值
    [colorFilter setDefaults];
    //同样打印这样的 输入属性  inputKeys
    //NSLog(@"%@",colorFilter.inputKeys);
    //KVC 给私有属性赋值
    [colorFilter setValue:qrImage forKey:@"inputImage"];

    //需要使用 CIColor
    //[colorFilter setValue:[CIColor colorWithRed:147 green:58 blue:226] forKey:@"inputColor1"];
    [colorFilter setValue:color1 forKey:@"inputColor0"];
    [colorFilter setValue:color2 forKey:@"inputColor1"];
    //设置输出
    CIImage *colorImage = [colorFilter outputImage];
    //但是图片 发现有的小 (27,27),我们需要放大..我们进去CIImage 内部看属性
        colorImage = [qrImage imageByApplyingTransform:CGAffineTransformMakeScale(9, 9)];
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

//根据token生成带颜色的二维码
//MARK:彩色的二维码
//+(UIImage *)getColorQrcodeWithToken:(NSString *)token SmallCenterImage:(UIImage *)image imageWidth:(CGFloat)imageWidth color1:(CIColor*)color1 color2:(CIColor*)color2{
//// 1.创建二维码过滤器
//CIFilter *qrFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
//// 2.设置默认值
//[qrFilter setDefaults];
///*
// inputMessage,         二维码的内容
// inputCorrectionLevel  二维码的容错率
// */
//NSLog(@"%@",qrFilter.inputKeys);
//// 3.给二维码过滤器添加信息  KVC
//// inputMessage必须要传入二进制   否则会崩溃
//[qrFilter setValue:[token dataUsingEncoding:NSUTF8StringEncoding] forKey:@"inputMessage"];
//// 4.获取二维码的图片
//CIImage *ciimage = qrFilter.outputImage;
//// 放大图片的比例
//ciimage = [ciimage   imageByApplyingTransform:CGAffineTransformMakeScale(9, 9)];
////    NSLog(@"%@",ciimage);
//
//// 5.创建颜色过滤器
//CIFilter *colorFilter = [CIFilter filterWithName:@"CIFalseColor"];
//// 6.设置默认值
//[colorFilter setDefaults];
///*
// inputImage,     需要设定颜色的图片
// inputColor0,    前景色 - 二维码的颜色
// inputColor1     背景色 - 二维码背景的颜色
// */
//NSLog(@"%@",colorFilter.inputKeys);
//// 7.给颜色过滤器添加信息
//// 设定图片
//[colorFilter setValue:ciimage forKey:@"inputImage"];
//// 设定前景色
//[colorFilter setValue:color1 forKey:@"inputColor1"];
//// 设定背景色
//[colorFilter setValue:color2 forKey:@"inputColor0"];
//// 获取图片
//ciimage = colorFilter.outputImage;
//
//
//
//
//    //============画出中间图片
//    UIImage *qrUIImage = [UIImage imageWithCIImage:ciimage];
//    //----------------给 二维码 中间增加一个 自定义图片----------------
//    //开启绘图,获取图形上下文  (上下文的大小,就是二维码的大小)
//    UIGraphicsBeginImageContext(qrUIImage.size);
//
//    //把二维码图片画上去. (这里是以,图形上下文,左上角为 (0,0)点)
//    [qrUIImage drawInRect:CGRectMake(0, 0, qrUIImage.size.width, qrUIImage.size.height)];
//    //再把小图片画上去
//    UIImage *sImage = image;
//
//    CGFloat sImageW = imageWidth;
//    CGFloat sImageH= sImageW;
//    CGFloat sImageX = (qrUIImage.size.width - sImageW) * 0.5;
//    CGFloat sImgaeY = (qrUIImage.size.height - sImageH) * 0.5;
//    [sImage drawInRect:CGRectMake(sImageX, sImgaeY, sImageW, sImageH)];
//    //获取当前画得的这张图片
//    UIImage *finalyImage = UIGraphicsGetImageFromCurrentImageContext();
//    //关闭图形上下文
//    UIGraphicsEndImageContext();
//    return finalyImage;
//}


+(UIImage *)getColorQimageWithPath:(NSString *)path withImageView:(UIImageView *)imageView WithSize:(CGFloat)size withCenterIcon:(UIImage *)centerIcon centerIconWidth:(CGFloat)centerIconWidth withRed:(CGFloat)red andGreen:(CGFloat)green andBlue:(CGFloat)blue {
    // 1.创建滤镜
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    // 2.还原滤镜默认属性
    [filter setDefaults];
    // 3.设置需要生成二维码的数据到滤镜中
    // OC中要求设置的是一个二进制数据
    NSData *data = [path dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKeyPath:@"InputMessage"];
    // 4.从滤镜从取出生成好的二维码图片
    CIImage *ciImage = [filter outputImage];
    if (imageView!=nil) {
        imageView.layer.shadowOffset = CGSizeMake(0, 0);
        // 设置阴影的偏移量
        imageView.layer.shadowRadius = 1;
        // 设置阴影的半径
        imageView.layer.shadowColor = [UIColor blackColor].CGColor;
        // 设置阴影的颜色为黑色
        imageView.layer.shadowOpacity = 0.3;
    }
    UIImage *Qimage= [Util createNonInterpolatedUIImageFormCIImage:ciImage size: size withRed:red andGreen:green andBlue:blue];
    //中间添加图片
    //----------------给 二维码 中间增加一个 自定义图片----------------
    //开启绘图,获取图形上下文  (上下文的大小,就是二维码的大小)
    UIGraphicsBeginImageContext(Qimage.size);
    
    //把二维码图片画上去. (这里是以,图形上下文,左上角为 (0,0)点)
    [Qimage drawInRect:CGRectMake(0, 0, Qimage.size.width, Qimage.size.height)];
    //再把小图片画上去
    UIImage *sImage = centerIcon;
    CGFloat sImageW = centerIconWidth;
    CGFloat sImageH= sImageW;
    CGFloat sImageX = (Qimage.size.width - sImageW) * 0.5;
    CGFloat sImgaeY = (Qimage.size.height - sImageH) * 0.5;
    [sImage drawInRect:CGRectMake(sImageX, sImgaeY, sImageW, sImageH)];
    //获取当前画得的这张图片
    UIImage *finalyImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭图形上下文
    UIGraphicsEndImageContext();
    
    return finalyImage;
}

+ (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)ciImage size:(CGFloat)widthAndHeight withRed:(CGFloat)red andGreen:(CGFloat)green andBlue:(CGFloat)blue{
    
    CGRect extentRect = CGRectIntegral(ciImage.extent);
    CGFloat scale = MIN(widthAndHeight / CGRectGetWidth(extentRect), widthAndHeight / CGRectGetHeight(extentRect));
    // 1.创建bitmap;
    size_t width = CGRectGetWidth(extentRect) * scale;
    size_t height = CGRectGetHeight(extentRect) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:ciImage fromRect:extentRect]; CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extentRect, bitmapImage);
    // 保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef); CGImageRelease(bitmapImage);
    //return [UIImage imageWithCGImage:scaledImage];// 黑白图片
    UIImage *newImage = [UIImage imageWithCGImage:scaledImage];
    return [Util imageBlackToTransparent:newImage withRed:red andGreen:green andBlue:blue];
}

+(UIImage*)imageBlackToTransparent:(UIImage*)image withRed:(CGFloat)red andGreen:(CGFloat)green andBlue:(CGFloat)blue{ const int imageWidth = image.size.width;
    const int imageHeight = image.size.height; size_t
    bytesPerRow = imageWidth * 4;
    uint32_t* rgbImageBuf = (uint32_t*)malloc(bytesPerRow * imageHeight);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(rgbImageBuf, imageWidth, imageHeight, 8, bytesPerRow, colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipLast);
    CGContextDrawImage(context, CGRectMake(0, 0, imageWidth, imageHeight), image.CGImage);
    // 遍历像素
    int pixelNum = imageWidth * imageHeight; uint32_t* pCurPtr = rgbImageBuf;
    for (int i = 0; i < pixelNum; i++, pCurPtr++){ if ((*pCurPtr & 0xFFFFFF00) < 0x99999900)// 将白色变成透明
    { // 改成下面的代码，会将图片转成想要的颜色
        uint8_t* ptr = (uint8_t*)pCurPtr; ptr[3] = red;
        //0~255
        ptr[2] = green;
        ptr[1] = blue;
    } else { uint8_t* ptr = (uint8_t*)pCurPtr; ptr[0] = 0;
        
    }
    }
    // 输出图片
    CGDataProviderRef dataProvider = CGDataProviderCreateWithData(NULL, rgbImageBuf, bytesPerRow * imageHeight, ProviderReleaseData);
    CGImageRef imageRef = CGImageCreate(imageWidth, imageHeight, 8, 32, bytesPerRow, colorSpace, kCGImageAlphaLast | kCGBitmapByteOrder32Little, dataProvider, NULL, true, kCGRenderingIntentDefault); CGDataProviderRelease(dataProvider); UIImage* resultUIImage = [UIImage imageWithCGImage:imageRef];
    // 清理空间
    CGImageRelease(imageRef);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    return resultUIImage;
    
}

void ProviderReleaseData (void *info, const void *data, size_t size){
    free((void*)data);
}



+(UIToolbar *)getNoWanChengBtn{
    UIToolbar *bar = [[UIToolbar alloc] initWithFrame:CGRectMake(0,0, SCREEN_WIDTH,44)];
    bar.userInteractionEnabled=YES;
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 60, 7,50, 30)];
    [button setTitle:@"" forState:UIControlStateNormal];
    [button setTitleColor:blackBColor forState:UIControlStateNormal];
    [bar addSubview:button];
    return bar;
}



+(NSMutableAttributedString *)wby_setBuFenLableTextColorWithAllText:(NSString *)allText startRangeMessage:(NSString *)startRangeMessage colorMessage:(NSString *)colorMessage isSetNSUnderline:(BOOL)isSetNSUnderline   colorMessageColor:(UIColor *)colorMessageColor   allTextFont:(UIFont*)allTextFont colorMessageFont:(UIFont *)colorMessageFont underlineColor:(UIColor *)underlineColor{
    //需要点击的字符相同
    NSString *text = allText;
    NSMutableAttributedString *attributedString1 = [[NSMutableAttributedString alloc]initWithString:text];
    [attributedString1 addAttribute:NSFontAttributeName value:allTextFont range:NSMakeRange(0, text.length)];
    [attributedString1 addAttribute:NSFontAttributeName value:colorMessageFont range:NSMakeRange(startRangeMessage.length, colorMessage.length)];
    [attributedString1 addAttribute:NSForegroundColorAttributeName value:colorMessageColor range:NSMakeRange(startRangeMessage.length, colorMessage.length)];

    if (isSetNSUnderline) {
        NSRange strRange = {startRangeMessage.length,colorMessage.length};
        //设置下划线...
        /*
         NSUnderlineStyleNone                                    = 0x00, 无下划线
         NSUnderlineStyleSingle                                  = 0x01, 单行下划线
         NSUnderlineStyleThick NS_ENUM_AVAILABLE(10_0, 7_0)      = 0x02, 粗的下划线
         NSUnderlineStyleDouble NS_ENUM_AVAILABLE(10_0, 7_0)     = 0x09, 双下划线
         */
        [attributedString1 addAttributes:@{NSUnderlineStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle],NSUnderlineColorAttributeName:colorMessageColor,NSForegroundColorAttributeName:underlineColor} range:strRange];
    }
    return attributedString1;
}

//设置lable的高度
+(void)wby_setLableLineSpacing:(CGFloat)lineSpacing  withAlignment:(NSTextAlignment)alignment with:(NSMutableAttributedString*)attr withRange:(NSRange)range{
            NSMutableParagraphStyle *sty = [[NSMutableParagraphStyle alloc] init];
            sty.alignment = alignment;
            sty.lineSpacing = lineSpacing;
            [attr addAttribute:NSParagraphStyleAttributeName value:sty range:range];
}

+(void)cantXiaLaScrollView:(UIScrollView *)scrollView{
    CGPoint offset = scrollView.contentOffset;
    if (offset.y <= 0) {
        offset.y = 0;
    }
    scrollView.contentOffset = offset;
}

@end
