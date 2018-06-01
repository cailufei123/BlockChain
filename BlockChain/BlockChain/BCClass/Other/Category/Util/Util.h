//
//  Util.h
//  firstview
//
//  Created by HL on 2017/10/18.
//  Copyright © 2017年 SZ. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Util : NSObject

//切圆角
+(void)roundBorderView:(int)radix border:(float)width color:(UIColor*)borderColor view:(UIView*)pView;
//设置按钮底部线
+(void)setUnderlineFromButton:(UIButton *)button textColor:(UIColor *)textColor underlineColor:(UIColor *)underlineColor;

/**设置cell中的选中颜色*/
+(void)selectCellBackgroundColor:(UITableViewCell *)cell;
+(void)selectCellBackgroundColor:(UITableViewCell *)cell selectBackgroundColor:(UIColor *)color;

//虚线
/**
 *  通过 CAShapeLayer 方式绘制虚线
 *
 *  param lineView:       需要绘制成虚线的view
 *  param lineLength:     虚线的宽度
 *  param lineSpacing:    虚线的间距
 *  param lineColor:      虚线的颜色
 *  param lineDirection   虚线的方向  YES 为水平方向， NO 为垂直方向
 **/
+(void)drawLineOfDashByCAShapeLayer:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor lineDirection:(BOOL)isHorizonal;

#pragma mark--------保存图片到相册功能，ALAssetsLibraryiOS9.0 以后用photoliabary 替代，--
//截屏保存到相册
+(void)savePhotoWithJiePingView:(UIView *)view;
//得到截屏图片
+(UIImage *)captureImageFromView:(UIView *)view;

//根据token生成带颜色的二维码
//MARK:彩色的二维码
+(UIImage *)getColorQrcodeWithToken:(NSString *)token SmallCenterImage:(UIImage *)image imageWidth:(CGFloat)imageWidth color1:(CIColor*)color1 color2:(CIColor*)color2;

//MARK:彩色的二维码
/*
 *red   r   //129.0f
 *green g   // 0.0f
 *blue  b   // 224.0f
 *centerIconWidth //中间宽度
 *centerIcon      //中间图片
 *imageView       //imageView 不用阴影可传递nil
 */
+(UIImage *)getColorQimageWithPath:(NSString *)path withImageView:(UIImageView *)imageView WithSize:(CGFloat)size withCenterIcon:(UIImage *)centerIcon centerIconWidth:(CGFloat)centerIconWidth withRed:(CGFloat)red andGreen:(CGFloat)green andBlue:(CGFloat)blue;
@end
