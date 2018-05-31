//
//  BCMeChangeMoneyDownCell.h
//  BlockChain
//
//  Created by Mac on 2018/5/24.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BCMeChangeMoneyMode;

//协议
@protocol BCMeChangeMoneyDownCellDelegate <NSObject>
@optional
//-(void)goBtnClick;

-(void)nextBtnClick;
-(void)getSliderValue:(NSString* )sliderValue;

@end
@interface BCMeChangeMoneyDownCell : UITableViewCell

@property(nonatomic,strong)BCMeChangeMoneyMode *model;
@property (nonatomic, weak) id <BCMeChangeMoneyDownCellDelegate> delegate;
+(instancetype)getCellWithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end
