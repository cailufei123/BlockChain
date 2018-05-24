//
//  SAMessageModel.h
//  SkinAssistant
//
//  Created by 蔡路飞 on 2017/7/13.
//  Copyright © 2017年 LeGame. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface SABodyModel : NSObject

@end


@interface SAMessageModel : NSObject
//@property(nonatomic,strong)NSString * subtitle;
//@property(nonatomic,strong)NSString * title;
//@property(nonatomic,strong)NSString * type;
//@property(nonatomic,strong)SAMessageModel * body;


@property(nonatomic,strong)NSString * msg_content;// 内容
@property(nonatomic,strong)NSString * msg_title;//标题
@property(nonatomic,strong)NSString * msg_type;// 0系统消息  1任务相关
@property(nonatomic,strong)NSString * skip_id;
@property(nonatomic,strong)NSString * skip_type;//skip_type  0不跳转  1消息详情
@property(nonatomic,strong)NSString * bageVlue;
@property(nonatomic,strong)NSString * msg_tag;// 0正常   1站类信

@property(nonatomic,strong)NSString * msg_id;// 0正常   1站类信
@property(nonatomic,strong)NSMutableArray * arrary;
@property(nonatomic,strong)NSString * timeStr;
@property(nonatomic,assign)CGFloat cellHight;



@end

