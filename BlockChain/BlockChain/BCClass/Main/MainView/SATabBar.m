//
//  SATabBar.m
//  SkinAssistant
//
//  Created by 蔡路飞 on 2017/6/7.
//  Copyright © 2017年 LeGame. All rights reserved.
//

#import "SATabBar.h"
@interface SATabBar()
@property(nonatomic,weak)UIButton *publishButton;
@end
@implementation SATabBar
-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame] ) {
        //        self.backgroundImage = [UIImage imageNamed:@"tabbar-light"];
        
//        self.translucent = NO;
    }
    return self;
    
}
-(UIButton *)publishButton{
    
    if (!_publishButton) {
        
        //        UIButton * publishButton = [[UIButton alloc] init];
        
        //        [publishButton setTitle:@"发布" forState:UIControlStateNormal];
        //         [publishButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setImage:[UIImage imageNamed:@"tabBar_data_publish_add"] forState:UIControlStateNormal];
        [publishButton setImage:[UIImage imageNamed:@"tabBar_data_publish_add"] forState:UIControlStateHighlighted];
        [publishButton addTarget:self action:@selector(publishButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:publishButton];
        _publishButton = publishButton;
        _publishButton.titleLabel.font = [UIFont systemFontOfSize:13];

    }
    return _publishButton;
}
-(void)publishButtonClick{
    if (self.tabBarDelegate && [self.tabBarDelegate respondsToSelector:@selector(selectedItemButton:)])
    {
        // 调用代理方法
        [self.tabBarDelegate selectedItemButton:1];
    }
    
  
}
-(void)layoutSubviews{
    [super layoutSubviews];
    /**** 按钮的尺寸 ****/
    CGFloat buttonW = self.clf_width/2;
    CGFloat buttonH = self.clf_height;
    if (kDevice_Is_iPhoneX) {
     buttonH = self.clf_height-34;
    }
    
    CGFloat buttonY = 0;
    // 按钮索引
    int tabBarButtonIndex = 0;
    for (UIView *subview in self.subviews){
        
        // 过滤掉非UITabBarButton
        if (subview.class != NSClassFromString(@"UITabBarButton"))continue;
        // 设置frame
        CGFloat tabBarButtonX = tabBarButtonIndex *buttonW;
        if (tabBarButtonIndex >= 2) {
//            tabBarButtonX += buttonW;
//            [subview addSubview: self.publishButton];
        }
        
        subview.frame = CGRectMake(tabBarButtonX, buttonY, buttonW, buttonH);
        tabBarButtonIndex++;
    }
//    /**** 设置中间的发布按钮的frame ****/
//    self.publishButton.clf_width = buttonW;
//    self.publishButton.clf_height = buttonH;
//    self.publishButton.clf_centerX = self.clf_width * 0.5;
//    self.publishButton.clf_centerY = self.clf_height * 0.5;
//    if (kDevice_Is_iPhoneX) {
//       self.publishButton.clf_centerY = self.clf_height * 0.5-10;
//    }
// 
    
}
//重写hitTest方法，去监听发布按钮的点击，目的是为了让凸出的部分点击也有反应
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    //这一个判断是关键，不判断的话push到其他页面，点击发布按钮的位置也是会有反应的，这样就不好了
    //self.isHidden == NO 说明当前页面是有tabbar的，那么肯定是在导航控制器的根控制器页面
    //在导航控制器根控制器页面，那么我们就需要判断手指点击的位置是否在发布按钮身上
    //是的话让发布按钮自己处理点击事件，不是的话让系统去处理点击事件就可以了
    if (self.isHidden == NO) {
        
        //将当前tabbar的触摸点转换坐标系，转换到发布按钮的身上，生成一个新的点
        CGPoint newP = [self convertPoint:point toView:self.publishButton];
        
        //判断如果这个新的点是在发布按钮身上，那么处理点击事件最合适的view就是发布按钮
        if ( [self.publishButton pointInside:newP withEvent:event]) {
            return self.publishButton;
        }else{//如果点不在发布按钮身上，直接让系统处理就可以了
            return [super hitTest:point withEvent:event];
        }
    }
    else {//tabbar隐藏了，那么说明已经push到其他的页面了，这个时候还是让系统去判断最合适的view处理就好了
        return [super hitTest:point withEvent:event];
    }
}

@end
