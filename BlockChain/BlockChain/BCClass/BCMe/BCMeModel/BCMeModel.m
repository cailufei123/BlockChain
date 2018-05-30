//
//  BCMeModel.m
//  BlockChain
//
//  Created by 吴博怡 on 2018/5/22.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCMeModel.h"

@implementation BCMeModel


+(NSDictionary *)mj_replacedKeyFromPropertyName{
    
    return @{@"ID":@"id"};
}

-(void)encodeWithCoder:(NSCoder *)encoder{
    unsigned int count = 0;
    //传入地址就可以改变值  一个函数有多返回值怎么做  传入参数的地址
    Ivar * ivars = class_copyIvarList([BCMeModel class], &count);
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
        Ivar * ivars =class_copyIvarList([BCMeModel class], &count);
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
