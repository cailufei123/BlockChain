//
//  NSArray+WHArray.m
//  WHCategory
//
//  Created by 吴浩 on 2017/6/7.
//  Copyright © 2017年 remember17. All rights reserved.
//

#import "NSArray+WHArray.h"

@implementation NSArray (WHArray)
- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level
{
    NSMutableString *str = [NSMutableString stringWithFormat:@"%lu (\n", (unsigned long)self.count];
    
    for (id obj in self) {
        [str appendFormat:@"\t%@, \n", obj];
    }
    
    [str appendString:@")"];
    
    return str;
}

- (NSArray *)wh_reverseArray {
    NSMutableArray *arrayTemp = [NSMutableArray arrayWithCapacity:[self count]];
    NSEnumerator *enumerator = [self reverseObjectEnumerator];
    
    for (id element in enumerator) {
        [arrayTemp addObject:element];
    }
    
    return arrayTemp;
}
//- (NSString *)descriptionWithLocale:(id)locale
// {
//         NSMutableString *string = [NSMutableString string];
//    
//         // 开头有个[
//         [string appendString:@"[\n"];
//    
//         // 遍历所有的元素
//         [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//                 [string appendFormat:@"\t%@,\n", obj];
//             }];
//    
//         // 结尾有个]
//         [string appendString:@"]"];
//    
//         // 查找最后一个逗号
//         NSRange range = [string rangeOfString:@"," options:NSBackwardsSearch];
//         if (range.location != NSNotFound)
//             [string deleteCharactersInRange:range];
//     
//         return string;
//     }
@end
