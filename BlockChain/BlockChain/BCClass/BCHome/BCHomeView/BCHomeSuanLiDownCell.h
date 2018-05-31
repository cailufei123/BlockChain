//
//  BCHomeSuanLiDownCell.h
//  BlockChain
//
//  Created by Mac on 2018/5/25.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BCSuanLiJiLuListModel;

@interface BCHomeSuanLiDownCell : UITableViewCell
@property(nonatomic,strong)BCSuanLiJiLuListModel *model;

+(instancetype)getCellWithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end
