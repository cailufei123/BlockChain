//
//  BCTaskDetailUpCell.h
//  BlockChain
//
//  Created by Mac on 2018/5/24.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BCTaskDetailModel;


@interface BCTaskDetailUpCell : UITableViewCell

@property(nonatomic,strong)BCTaskDetailModel *model;
+(instancetype)getCellWithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
@end
