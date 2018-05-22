//
//  BCMeTableViewCell.h
//  BlockChain
//
//  Created by 吴博怡 on 2018/5/22.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  BCMeModel;

//协议
@protocol BCMeTableViewCellDelegate <NSObject>

@optional


@end

@interface BCMeTableViewCell : UITableViewCell

@property(nonatomic,strong)BCMeModel *model;

+(instancetype)getCellWithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
@property (nonatomic, weak) id <BCMeTableViewCellDelegate> delegate;


@end
