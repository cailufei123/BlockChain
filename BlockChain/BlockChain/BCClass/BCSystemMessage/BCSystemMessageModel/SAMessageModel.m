//
//  SAMessageModel.m
//  SkinAssistant
//
//  Created by 蔡路飞 on 2017/7/13.
//  Copyright © 2017年 LeGame. All rights reserved.
//

#import "SAMessageModel.h"

@implementation SAMessageModel

-(NSString *)msg_content{
    CGFloat textH = [NSString textF:_msg_content textSizeW:LFscreenW-52 textFont:14];

    _cellHight = textH + 20;
    return _msg_content;
}
@end
@implementation SABodyModel

@end
