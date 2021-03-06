//
//  BCMeHeaderView.h
//  BlockChain
//
//  Created by 吴博怡 on 2018/5/22.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  BCMeModel;
//协议
@protocol BCMeHeaderViewDelegate <NSObject>

@optional
//糖果记录
-(void)tangGuoBtnClick;
//更多糖果
-(void)moreTangGuoBtnClick;
//验证码
-(void)QRCodeBtnClick;

@end

@interface BCMeHeaderView : UIView


@property(nonatomic,strong)BCMeModel *model;

@property (nonatomic, weak) id <BCMeHeaderViewDelegate> delegate;

@end
