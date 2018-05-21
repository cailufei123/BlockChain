//
//  SATabBar.h
//  SkinAssistant
//
//  Created by 蔡路飞 on 2017/6/7.
//  Copyright © 2017年 LeGame. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol tabBaruDelegate <NSObject>
- (void)selectedItemButton:(NSInteger)index;
@end
@interface SATabBar : UITabBar
@property(nonatomic,weak)id<tabBaruDelegate>   tabBarDelegate;
@end
