//
//  UIImageView+WBY.m
//  BodyIntellect1.2
//
//  Created by hai on 16/12/1.
//  Copyright © 2016年 知子花. All rights reserved.
//

#import "UIImageView+WBY.h"

@implementation UIImageView (WBY)


/**封装自定义ImageView,tag=0时无手势 target传nil action传nil*/
+ (instancetype)getImageUserEnabled:(BOOL)userEnabled tag:(NSInteger )tag target:(id)target action:(SEL)action
{
    UIImageView  *imageView= [[UIImageView alloc] init];
    if (userEnabled==YES) {
        imageView.userInteractionEnabled =userEnabled;
    }
    if (tag!=0) {
        imageView.tag=tag;
    }
    if (action!=nil && target!=nil) {
        UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc] initWithTarget:target action:action];
        [imageView addGestureRecognizer:tap];
    }
    return  imageView;
}

///*** 二次封装加载图片 ***/
//-(void)sd_setImageFromURLPath:(NSString *)path{
//    [self sd_setImageWithURL:[NSURL URLWithString:path] placeholderImage:[UIImage imageNamed:@"placeholder"]];
//}
///*** 二次封装加载图片 ***/
//-(void)sd_setExpertHeadIconImageFromURLPath:(NSString *)path{
//    [self sd_setImageWithURL:[NSURL URLWithString:path] placeholderImage:[UIImage imageNamed:@"icon-zhuanjiahuidatouxiang"]];
//}
///*** 二次封装加载图片，传递占位图片 ***/
//-(void)sd_setImageFromURLPath:(NSString *)path placeholderImage:(UIImage *)placeholderImage{
//    [self sd_setImageWithURL:[NSURL URLWithString:path] placeholderImage:placeholderImage];//左侧头
//}





@end

