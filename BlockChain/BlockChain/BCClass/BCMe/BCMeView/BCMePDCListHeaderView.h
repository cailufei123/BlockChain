//
//  BCMePDCListHeaderView.h
//  BlockChain
//
//  Created by Mac on 2018/5/23.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BCMePDCUpMode;
//协议
@protocol BCMePDCListHeaderViewDelegate <NSObject>

@optional

-(void)xiaQingBtnClickWithModel:(BCMePDCUpMode *)model;

@end


@interface BCMePDCListHeaderView : UIView
@property (nonatomic, strong)BCMePDCUpMode *model;

@property (nonatomic, weak) id <BCMePDCListHeaderViewDelegate> delegate;


@end
