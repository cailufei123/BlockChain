//
//  BCHomeDetailViewController.h
//  BlockChain
//
//  Created by Mac on 2018/5/25.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BCHomeDetailViewController : UIViewController
@property(nonatomic,strong)NSString * candyId;
@property(nonatomic,copy)void (^refreshCandyLists)(NSIndexPath * indexpath1);
@property(nonatomic,strong)NSIndexPath *indexpath1;
@end
