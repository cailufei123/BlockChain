//
//  SALoginModel.m
//  SkinAssistant
//
//  Created by 蔡路飞 on 2017/6/15.
//  Copyright © 2017年 LeGame. All rights reserved.
//

#import "SALoginModel.h"
#import <objc/runtime.h>   
@implementation SALoginModel
/**
 *  从文件取出来调用这个方法
 *
 *  @param aDecoder 掉objct方法
 *
 *  @return 返回自己
 */
//-(id)initWithCoder:(NSCoder *)aDecoder{
//    if(self = [super init]){
//
//        self.logPassWordMd5 = [aDecoder decodeObjectForKey:@"logPassWordMd5"];
//        self.loginName = [aDecoder decodeObjectForKey:@"loginName"];
//        self.logPassWord = [aDecoder decodeObjectForKey:@"logPassWord"];
//        self.token = [aDecoder decodeObjectForKey:@"token"];
//        self.message = [aDecoder decodeObjectForKey:@"message"];
//        self.userId = [aDecoder decodeObjectForKey:@"userId"];
//        self.mobile = [aDecoder decodeObjectForKey:@"mobile"];
//
//
//    }
//    return self;
//}
//
///**
// *  从入文件时调用
// *
// *  @param encoder 调用objct方法
// */
//-(void)encodeWithCoder:(NSCoder *)encoder{
//
//    [encoder encodeObject:self.logPassWordMd5 forKey:@"logPassWordMd5"];
//    [encoder encodeObject:self.loginName forKey:@"loginName"];
//    [encoder encodeObject:self.logPassWord forKey:@"logPassWord"];
//    [encoder encodeObject:self.token forKey:@"token"];
//    [encoder encodeObject:self.message forKey:@"message"];
//    [encoder encodeObject:self.userId forKey:@"userId"];
//    [encoder encodeObject:self.mobile forKey:@"mobile"];
//
//
//}

-(void)encodeWithCoder:(NSCoder *)encoder{
    unsigned int count = 0;
    //传入地址就可以改变值  一个函数有多返回值怎么做  传入参数的地址
    Ivar * ivars = class_copyIvarList([SALoginModel class], &count);
    for(int i = 0;i<count ;i++){
        Ivar ivar = ivars[i];
        const char * name = ivar_getName(ivar);
        NSString * key = [NSString stringWithUTF8String:name];
        [encoder encodeObject: [self valueForKey:key] forKey:key];
    }
    
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super init]){
        unsigned int count = 0;
        Ivar * ivars =class_copyIvarList([SALoginModel class], &count);
        for (int i = 0; i<count; i++) {
            Ivar ivar = ivars[i];
            const char * name = ivar_getName(ivar);
            NSString * key = [NSString stringWithUTF8String:name];
            id value = [aDecoder decodeObjectForKey:key];
            [self setValue:value forKey:key];
        }
    }
    return self;
}


@end
