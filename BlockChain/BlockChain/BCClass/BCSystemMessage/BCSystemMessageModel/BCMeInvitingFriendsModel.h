//
//  BCMeInvitingFriendsModel.h
//  BlockChain
//
//  Created by Mac on 2018/5/26.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BCMeInvitingFriendsModel : NSObject

@property(nonatomic,strong)UIImage *QImage;//根据token生成的二维码
@property(nonatomic,copy)NSString *token;

@end
