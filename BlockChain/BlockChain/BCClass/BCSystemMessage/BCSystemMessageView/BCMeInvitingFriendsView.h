//
//  BCMeInvitingFriendsView.h
//  BlockChain
//
//  Created by Mac on 2018/5/26.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BCMeInvitingFriendsModel;

//协议
@protocol BCMeInvitingFriendsViewDelegate <NSObject>
@optional

@end

@interface BCMeInvitingFriendsView : UIView


@property(nonatomic,strong)BCMeInvitingFriendsModel *model;
@property (nonatomic, weak) id <BCMeInvitingFriendsViewDelegate> delegate;

@end
