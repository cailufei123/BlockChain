//
//  BCGamePlayDownCell.h
//  BlockChain
//
//  Created by Mac on 2018/6/4.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BCGamePlayMode;


@interface BCGamePlayDownCell : UITableViewCell

@property(nonatomic,strong)BCGamePlayMode *model;
+(instancetype)getCellWithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end
