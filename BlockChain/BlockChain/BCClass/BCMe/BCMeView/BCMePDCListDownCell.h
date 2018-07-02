//
//  BCMePDCListCell.h
//  BlockChain
//
//  Created by Mac on 2018/5/29.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@class  BCMePDCListMode;

//协议
@protocol BCMePDCListDownCellDelegate <NSObject>

@optional


@end
@interface BCMePDCListDownCell : UITableViewCell

//@property(nonatomic,copy)void (^refreshCandyList)(void);
//@property(nonatomic,copy)void (^screen)(NSString * );
@property(nonatomic,strong)BCMePDCListMode *model;

+(instancetype)getCellWithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
@property (nonatomic, weak) id <BCMePDCListDownCellDelegate> delegate;

@end
