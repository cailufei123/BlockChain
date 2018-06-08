//
//  BCNoDataView.h
//  BlockChain
//
//  Created by Mac on 2018/6/8.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import <UIKit/UIKit.h>

//@class  BCMeModel;
//协议
@protocol BCMeNoDataViewDelegate <NSObject>


@optional
////糖果记录
//-(void)tangGuoBtnClick;
////更多糖果
//-(void)moreTangGuoBtnClick;
////验证码
//-(void)QRCodeBtnClick;

@end

@interface BCMeNoDataView : UIView

/** 无网络中间图片*/
@property (nonatomic, strong)UIImageView *centerIcon;
/** 无网络中间文字*/
@property (nonatomic, strong)UILabel *message;

@property (nonatomic, weak) id <BCMeNoDataViewDelegate> delegate;
@end
