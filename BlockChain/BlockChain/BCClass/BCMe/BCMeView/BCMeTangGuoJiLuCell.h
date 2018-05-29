//
//  BCMeTangGuoJiLuCell.h
//  BlockChain
//
//  Created by Mac on 2018/5/23.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>


@class  BCMePDCListMode;

//协议
@protocol BCMeTangGuoJiLuCellDelegate <NSObject>

@optional


@end
@interface BCMeTangGuoJiLuCell : UITableViewCell

@property(nonatomic,strong)BCMePDCListMode *model;

+(instancetype)getCellWithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
@property (nonatomic, weak) id <BCMeTangGuoJiLuCellDelegate> delegate;
@end
