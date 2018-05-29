//
//  BCMeTangGuoJiLuUpCell.h
//  BlockChain
//
//  Created by Mac on 2018/5/29.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>


@class BCMePDCMode;
//协议
@protocol BCMeTangGuoJiLuUpCellDelegate <NSObject>

@optional

-(void)xiaQingBtnClickWithModel:(BCMePDCMode *)model;

@end

@interface BCMeTangGuoJiLuUpCell : UITableViewCell
@property (nonatomic, strong)BCMePDCMode *model;
+(instancetype)getCellWithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@property (nonatomic, weak) id <BCMeTangGuoJiLuUpCellDelegate> delegate;

@end
