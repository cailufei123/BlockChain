//
//  BCTaskDetailModel.m
//  BlockChain
//
//  Created by Mac on 2018/5/24.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCTaskDetailModel.h"

@implementation BCTaskDetailModel

@end

@implementation TaskInfo
+(NSDictionary *)mj_replacedKeyFromPropertyName{
    
    return @{@"ID":@"id"};
}
-(NSString *)createTime{
    
    NSTimeInterval time = [_createTime doubleValue];
    
    NSDate *createDate = [[NSDate alloc]initWithTimeIntervalSince1970:time/1000.0];
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    
    
    fmt.dateFormat = @"yyyy-MM-dd HH:mm";
    return [fmt stringFromDate:createDate];
}
@end
@implementation PartnerInfo

@end
@implementation UserInfo

@end
