//
//  UIImageView+WBY.h
//  BodyIntellect1.2
//
//  Created by hai on 16/12/1.
//  Copyright © 2016年 知子花. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (WBY)

/**封装自定义ImageView,tag=0时无手势 target传nil action传nil*/
+ (instancetype)getImageUserEnabled:(BOOL)userEnabled tag:(NSInteger )tag target:(id)target action:(SEL)action ;


/*** 二次封装加载图片 ***/
//-(void)sd_setImageFromURLPath:(NSString *)path;
//-(void)sd_setExpertHeadIconImageFromURLPath:(NSString *)path;


@end
