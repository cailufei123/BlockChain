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

//设置button的地步下划线的方法
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

//隐藏系统完成按钮
+(UIToolbar *)getNoWanChengBtn;

//设置lable中部分文字颜色 有颜色的部分可以点击
/**
 *allText               富文本中所有文字
 *startRangeMessage     从这个字符串开始截取的字符
 *colorMessage          这个是渲染当前的字符
 *isSetNSUnderline      是否设置变色字体的下划线 默认一条线
 *allTextColor          富文本中所有文字的颜色
 *colorMessageColor     需要渲染文字的颜色
 *allTextFont           所有文字的大小
 *colorMessageFont      变色文字的大小
 *underlineColor        下划线文字的颜色
 */

+(NSMutableAttributedString *)wby_setBuFenLableTextColorWithAllText:(NSString *)allText startRangeMessage:(NSString *)startRangeMessage colorMessage:(NSString *)colorMessage isSetNSUnderline:(BOOL)isSetNSUnderline   colorMessageColor:(UIColor *)colorMessageColor allTextFont:(UIFont*)allTextFont colorMessageFont:(UIFont *)colorMessageFont underlineColor:(UIColor *)underlineColor;

//设置lable的文字上下间距
/**
 *lineSpacing                        lable的行间距
 *withAlignment                      对齐方式
 *NSMutableAttributedString          attr 富文本
 *range                              设置行高度的字符串范围
 */
+(void)wby_setLableLineSpacing:(CGFloat)lineSpacing  withAlignment:(NSTextAlignment)alignment with:(NSMutableAttributedString*)attr withRange:(NSRange)range;
//不可以下拉 只能上拉
+(void)cantXiaLaScrollView:(UIScrollView *)scrollView;
@end
