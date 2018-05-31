//
//  BCMeInvitingShareView.h
//  BlockChain
//
//  Created by Mac on 2018/5/28.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BCMeInvitingFriendsModel;

//协议
@protocol BCMeInvitingShareViewDelegate <NSObject>
@optional

//退出分享view
-(void)closeShareView;

@end

@interface BCMeInvitingShareView : UIView
@property(nonatomic,strong)BCMeInvitingFriendsModel *model;

@property(nonatomic,copy)void (^weiXinBtnBlock)(void);
@property(nonatomic,copy)void (^pengYouBtnBlock)(void);
@property(nonatomic,copy)void (^QQBtnBlock)(void);

@property (nonatomic, weak) id <BCMeInvitingShareViewDelegate> delegate;

@end
