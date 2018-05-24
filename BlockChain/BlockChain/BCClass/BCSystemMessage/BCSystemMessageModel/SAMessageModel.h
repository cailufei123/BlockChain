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

@property(nonatomic,strong)NSString * extra1;
@property(nonatomic,strong)NSString * extra2;
@property(nonatomic,strong)NSString * extra3;
@property(nonatomic,strong)NSString * msg_content;
@property(nonatomic,strong)NSString * msg_title;
@property(nonatomic,strong)NSString * msg_type;
@property(nonatomic,strong)NSString * skip_id;
@property(nonatomic,strong)NSString * skip_type;
@property(nonatomic,strong)NSString * bageVlue;
@property(nonatomic,strong)NSString * msg_tag;
@property(nonatomic,strong)NSMutableArray * arrary;
@property(nonatomic,strong)NSString * timeStr;
@property(nonatomic,assign)CGFloat cellHight;



@end

