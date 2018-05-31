//
//  BCMeChangeMoneyUpCell.h
//  BlockChain
//
//  Created by Mac on 2018/5/24.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BCMeChangeMoneyMode;
//协议
@protocol BCMeChangeMoneyUpCellDelegate <NSObject>

@optional
//-(void)goBtnClick;
-(void)changeValue1:(NSString *)chageValue1;
-(void)changeValue2:(NSString *)chageValue2;
-(void)changeValue3:(NSString *)chageValue3;

@end
@interface BCMeChangeMoneyUpCell : UITableViewCell

@property(nonatomic,strong)BCMeChangeMoneyMode *model;
@property (nonatomic, weak) id <BCMeChangeMoneyUpCellDelegate> delegate;
+(instancetype)getCellWithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;


@end
