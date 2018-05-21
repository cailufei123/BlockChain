//
//  NSArray+decription.m
//  Auction
//
//  Created by 蔡路飞 on 2017/9/18.
//  Copyright © 2017年 Cailufei. All rights reserved.
//

#import "NSArray+decription.h"

@implementation NSArray (decription)
- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *str = [NSMutableString stringWithFormat:@"%lu (\n", (unsigned long)self.count];
    
    for (id obj in self) {
        [str appendFormat:@"\t%@, \n", obj];
    }
    
    [str appendString:@")"];
    
    return str;
}
@end
