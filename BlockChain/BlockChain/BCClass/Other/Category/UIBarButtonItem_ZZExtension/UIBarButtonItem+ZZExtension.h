//
//  UIBarButtonItem+ZZExtension.h
//  BodyIntellect1.2
//
//  Created by 吴博怡 on 16/9/22.
//  Copyright © 2016年 知子花. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (ZZExtension)


//@property(nonatomic,assign)UIEdgeInsets *edgeInsets;

+(instancetype)itemWithImage:(NSString *)image hightImage:(NSString *)hightImage target:(UIViewController*)target action:(SEL)action ;
@end
