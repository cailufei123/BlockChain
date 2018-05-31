//
//  CMVersion.h
//  Likien
//
//  Created by 蔡路飞 on 2016/11/22.
//  Copyright © 2016年 leshigames. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMVersion : NSObject
/* 版本编码-字符**/
@property(nonatomic,strong)NSString *  version;
/* 版本编码**/
@property(nonatomic,strong)NSString *  type;
/* 简介**/
@property(nonatomic,strong)NSString *  briefDesc;
/* 详细信息**/
//@property(nonatomic,strong)NSString *  briefDesc;
/* ios下载地址**/
@property(nonatomic,strong)NSString *  url;
/* 1：强更；0不强制**/
@property(nonatomic,strong)NSString *  isForceUpdate;

//briefDesc = "IOS\U7b2c\U4e00\U7248";
//channel = 0;
//id = 3;
//isForceUpdate = 1;
//type = 1;
//url = "http://leplay.duobao.ios";
//version = 120;
@end
