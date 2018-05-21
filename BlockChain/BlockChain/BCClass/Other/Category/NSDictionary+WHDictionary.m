//
//  NSDictionary+WHDictionary.m
//  WHCategory
//
//  Created by 吴浩 on 2017/6/7.
//  Copyright © 2017年 remember17. All rights reserved.
//

#import "NSDictionary+WHDictionary.h"

@implementation NSDictionary (WHDictionary)
- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level
{
    NSArray *allKeys = [self allKeys];
    NSMutableString *str = [[NSMutableString alloc] initWithFormat:@"{\t\n "];
    for (NSString *key in allKeys) {
        id value= self[key];
        [str appendFormat:@"\t \"%@\" = %@,\n",key, value];
    }
    [str appendString:@"}"];
    
    return str;
}
#pragma mark - 网络模型属性
-(void)wh_createNetProperty{
    NSMutableString *codes=[NSMutableString string];
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull value, BOOL * _Nonnull stop) {
        NSString *code;
        if ([value isKindOfClass:[NSString class]]) {
            code=[NSString stringWithFormat:@"@property (nonatomic, copy) NSString *%@;",key];
        }else if ([value isKindOfClass:NSClassFromString(@"__NSCFBoolean")]){
            code=[NSString stringWithFormat:@"@property (nonatomic, copy) BOOL %@;",key];
        }else if ([value isKindOfClass:[NSNumber class]]) {
            code=[NSString stringWithFormat:@"@property (nonatomic, copy) NSNumber *%@;",key];
        }else if ([value isKindOfClass:[NSArray class]]) {
            code=[NSString stringWithFormat:@"@property (nonatomic, copy) NSArray *%@;",key];
        }else if ([value isKindOfClass:[NSDictionary class]]) {
            code=[NSString stringWithFormat:@"@property (nonatomic, copy) NSDictionary *%@;",key];
        }
        [codes appendFormat:@"\n%@\n",code];
    }];
    NSLog(@"%@",codes);
}


#pragma mark - 根据字典key值转模型属性
-(void)wh_createProperty{
    NSMutableString *codes=[NSMutableString string];
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull value, BOOL * _Nonnull stop) {
        NSString *code;
        if ([value isKindOfClass:[NSString class]]) {
            code=[NSString stringWithFormat:@"@property (nonatomic, copy) NSString *%@;",key];
        }else if ([value isKindOfClass:NSClassFromString(@"__NSCFBoolean")]){
            code=[NSString stringWithFormat:@"@property (nonatomic, assign) BOOL %@;",key];
        }else if ([value isKindOfClass:[NSNumber class]]) {
            code=[NSString stringWithFormat:@"@property (nonatomic, assign) NSInteger %@;",key];
        }else if ([value isKindOfClass:[NSArray class]]) {
            code=[NSString stringWithFormat:@"@property (nonatomic, strong) NSArray *%@;",key];
        }else if ([value isKindOfClass:[NSDictionary class]]) {
            code=[NSString stringWithFormat:@"@property (nonatomic, strong) NSDictionary *%@;",key];
        }
        [codes appendFormat:@"\n%@\n",code];
    }];
    NSLog(@"%@",codes);
}


+ (NSDictionary *)dictionaryByMerging:(NSDictionary *)dict1 with:(NSDictionary *)dict2
{
    NSMutableDictionary * result = [NSMutableDictionary dictionaryWithDictionary:dict1];
    NSMutableDictionary * resultTemp = [NSMutableDictionary dictionaryWithDictionary:dict1];
    [resultTemp addEntriesFromDictionary:dict2];
    
    [resultTemp enumerateKeysAndObjectsUsingBlock: ^(id key, id obj, BOOL *stop) {
        if ([dict1 objectForKey:key])
        {
            if ([obj isKindOfClass:[NSDictionary class]])
            {
                NSDictionary * newVal = [[dict1 objectForKey: key] dictionaryByMergingWith: (NSDictionary *) obj];
                [result setObject: newVal forKey: key];
            }
            else
            {
                [result setObject: obj forKey: key];
            }
        }
        else if([dict2 objectForKey:key])
        {
            if ([obj isKindOfClass:[NSDictionary class]])
            {
                NSDictionary * newVal = [[dict2 objectForKey: key] dictionaryByMergingWith: (NSDictionary *) obj];
                [result setObject: newVal forKey: key];
            }
            else
            {
                [result setObject: obj forKey: key];
            }
        }
    }];
    return (NSDictionary *) [result mutableCopy];
    
}

- (NSDictionary *)dictionaryByMergingWith:(NSDictionary *)dict
{
    return [[self class] dictionaryByMerging:self with: dict];
}

#pragma mark - Manipulation
- (NSDictionary *)dictionaryByAddingEntriesFromDictionary:(NSDictionary *)dictionary
{
    NSMutableDictionary *result = [self mutableCopy];
    [result addEntriesFromDictionary:dictionary];
    return result;
}

- (NSDictionary *)dictionaryByRemovingEntriesWithKeys:(NSSet *)keys
{
    NSMutableDictionary *result = [self mutableCopy];
    [result removeObjectsForKeys:keys.allObjects];
    return result;
}


//-(NSString *)descriptionWithLocale:(id)locale
// {
//         NSMutableString *string = [NSMutableString string];
//    
//         // 开头有个{
//         [string appendString:@"{\n"];
//    
//         // 遍历所有的键值对
//         [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
//                 [string appendFormat:@"\t%@", key];
//                 [string appendString:@" : "];
//                 [string appendFormat:@"%@,\n", obj];
//             }];
//    
//         // 结尾有个}
//         [string appendString:@"}"];
//    
//         // 查找最后一个逗号
//         NSRange range = [string rangeOfString:@"," options:NSBackwardsSearch];
//         if (range.location != NSNotFound)
//             [string deleteCharactersInRange:range];
//     
//         return string;
//     }
@end
