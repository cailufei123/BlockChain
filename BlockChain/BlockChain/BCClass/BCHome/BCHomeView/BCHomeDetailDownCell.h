//
//  BCHomeDetailTableViewCell.h
//  BlockChain
//
//  Created by Mac on 2018/5/25.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>


@class BCHomeDetailModel;

//协议
@protocol BCHomeDetailDownCellDelegate <NSObject>
@optional

-(void)gotoGuanWangBtnClick;

@end

@interface BCHomeDetailDownCell : UITableViewCell
@property(nonatomic,strong)BCHomeDetailModel *model;
@property (nonatomic, weak) id <BCHomeDetailDownCellDelegate> delegate;
+(instancetype)getCellWithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;


@end
