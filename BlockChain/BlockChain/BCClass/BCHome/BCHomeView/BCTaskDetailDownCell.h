//
//  BCTaskDetailDownCell.h
//  BlockChain
//
//  Created by Mac on 2018/5/24.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BCTaskDetailModel;
//协议
@protocol BCTaskDetailDownCellDelegate <NSObject>

@optional

-(void)fenXiangBtnClick;//分享

@end
@interface BCTaskDetailDownCell : UITableViewCell

@property(nonatomic,strong)BCTaskDetailModel *model;
@property (nonatomic, weak) id <BCTaskDetailDownCellDelegate> delegate;
+(instancetype)getCellWithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
@end
