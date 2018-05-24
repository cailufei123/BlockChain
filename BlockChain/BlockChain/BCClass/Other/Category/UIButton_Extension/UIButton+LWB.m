//
//  UIButton+LWB.m
//  BodyIntellect
//
//  Created by 李伟宾 on 15/8/13.
//  Copyright (c) 2015年 崔文峰. All rights reserved.
//

#import "UIButton+LWB.h"

@implementation UIButton (LWB)

+ (instancetype)buttonWithFrame:(CGRect)frame title:(NSString *)title font:(CGFloat)font
{
     UIButton *button = [[UIButton alloc] init];
     button.frame = frame;
     button.backgroundColor = [UIColor whiteColor];
     button.titleLabel.font = [UIFont systemFontOfSize:font];
     [button setTitle:title forState:UIControlStateNormal];
     [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     button.titleLabel.textAlignment = NSTextAlignmentCenter;
     button.layer.masksToBounds = YES;
     button.layer.cornerRadius = 4;
    
    return button;
}

/**普通自定义按钮 按钮文字默认居中*/
+ (instancetype)getButtonWithFrame:(CGRect)frame titleLable:(NSString *)titleLable titleColor:(UIColor *)titleColor font:(UIFont*)font backGroundColor:(UIColor *)backGroundColor
{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.backgroundColor = backGroundColor;
    button.titleLabel.font = font;
    [button setTitle:titleLable forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    return button;
}
/**无坐标按钮Mansory专用 backGroundColor可设定为nil titleColor可设为nil titleFont可设定为空*/
+ (instancetype)getButtonTitleColor:(UIColor *)titleColor titleFont:(UIFont*)titleFont backGroundColor:(UIColor *)backGroundColor target:(id)target action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (backGroundColor!=nil) {
        button.backgroundColor = backGroundColor;
    }
    if (titleColor!=nil) {
       [button setTitleColor:titleColor forState:UIControlStateNormal];
        button.titleLabel.textColor =titleColor;
    }
    if (titleFont!=nil) {
        button.titleLabel.font = titleFont;
    }
    if (target!=nil && action!=nil) {
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return button;
}
//右边字，左边图片按钮
+ (instancetype)getUpDwonButtonTitleColor:(UIColor *)titleColor titleName:(NSString *)titleName titleFont:(UIFont*)titleFont imageArr:(NSArray *)imageArr target:(id)target action:(SEL)action{
    UIButton *titleButton = [[UIButton alloc] init];
    [titleButton setTitle:titleName forState:UIControlStateNormal];
    [titleButton setTitleColor:titleColor forState:UIControlStateNormal];
    titleButton.titleLabel.font = titleFont;
    [titleButton setImage:[UIImage imageNamed:imageArr[0]] forState:UIControlStateNormal];
    [titleButton setImage:[UIImage imageNamed:imageArr[1]] forState:UIControlStateSelected];
    //CGSize titleSize = [nickname sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]}];
    titleButton.imageEdgeInsets = UIEdgeInsetsMake(0, 90, 0, 0);//以titlelable左侧为基准向右移动 lable的宽度
    titleButton.titleEdgeInsets = UIEdgeInsetsMake(0, -40, 0, 0); //以自己为基准向左移动20这样 /-30
    titleButton.frame =CGRectMake(0, 0, 130, 40);
    //130这个值目前是随便写的，后面要改为根据内容自动计算长度
    //titleButton.size =CGSizeMake(130, 40);
    //titleButton.frame =CGRectMake(0, 0, 130, 40);
    //titleButton.backgroundColor = [UIColor redColor];
    [titleButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return titleButton;
}

#pragma mark 设置导航栏中间的titleView
-(UIButton *) titleViewWithNickname:(NSString *)nickname
{
    UIButton *titleButton = [[UIButton alloc] init];
    [titleButton setTitle:nickname forState:UIControlStateNormal];
    [titleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    titleButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [titleButton setImage:[UIImage imageNamed:@"la_down"] forState:UIControlStateNormal];
    [titleButton setImage:[UIImage imageNamed:@"la_up"] forState:UIControlStateSelected];
    //CGSize titleSize = [nickname sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]}];
    titleButton.imageEdgeInsets = UIEdgeInsetsMake(0, 110, 0, 0);//以titlelable左侧为基准向右移动 lable的宽度
    titleButton.titleEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0); //以自己为基准向左移动20这样 /-30
    //[Util roundBorderView:0 border:1 color:[UIColor yellowColor] view:titleButton.titleLabel];
    //[Util roundBorderView:0 border:1 color:[UIColor redColor] view:titleButton.imageView];
    //130这个值目前是随便写的，后面要改为根据内容自动计算长度
    //titleButton.size =CGSizeMake(130, 40);
    //titleButton.frame =CGRectMake(0, 0, 130, 40);
    //[Util roundBorderView:0 border:1 color:[UIColor blackColor] view:titleButton];
    //titleButton.backgroundColor = [UIColor redColor];
//    [titleButton addTarget:self action:@selector(ClassListClick:) forControlEvents:UIControlEventTouchUpInside];
    
    return titleButton;
}


/**二次封装按钮图片赋值操作*/
-(void)setImageName:(NSString *)imageName forState:(UIControlState)controlState{
  [self setImage:[UIImage imageNamed:imageName] forState:controlState];
}

@end
