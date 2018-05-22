//
//  SARefreshGifHeader.m
//  BlockChain
//
//  Created by 蔡路飞 on 2018/5/22.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "SARefreshGifHeader.h"

@implementation SARefreshGifHeader
//- (void)prepare
//{
//    [super prepare];
//
//    // 设置普通状态的动画图片
//    NSMutableArray *idleImages = [NSMutableArray array];
//    for (NSUInteger i = 1; i<=60; i++) {
//        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_anim__000%zd", i]];
//        [idleImages addObject:image];
//    }
//    [self setImages:idleImages forState:MJRefreshStateIdle];
//
//    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
//    NSMutableArray *refreshingImages = [NSMutableArray array];
//    for (NSUInteger i = 1; i<=3; i++) {
//        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%zd", i]];
//        [refreshingImages addObject:image];
//    }
//    [self setImages:refreshingImages forState:MJRefreshStatePulling];
//
//    // 设置正在刷新状态的动画图片
//    [self setImages:refreshingImages forState:MJRefreshStateRefreshing];
//    // 隐藏时间
//    self.lastUpdatedTimeLabel.hidden = YES;
//
//    // 隐藏状态
//    self.stateLabel.hidden = YES;
////    // 设置文字
////    [self setTitle:@"Pull down to refresh" forState:MJRefreshStateIdle];
////    [self setTitle:@"Release to refresh" forState:MJRefreshStatePulling];
//
//
//    // 设置字体
//    self.stateLabel.font = [UIFont systemFontOfSize:15];
//
//
//}
//
@end
