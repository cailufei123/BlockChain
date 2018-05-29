//
//  BCHomeTableViewCell.h
//  BlockChain
//
//  Created by 蔡路飞 on 2018/5/22.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCHomeModel.h"
@interface BCHomeTableViewCell : UITableViewCell
@property(nonatomic,strong) CandyListModel * candyListModel ;
@property(nonatomic,copy)void (^receiveCandy)(UIButton * button);
@end
