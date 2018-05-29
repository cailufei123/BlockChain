//
//  BCHomeModel.m
//  BlockChain
//
//  Created by 蔡路飞 on 2018/5/28.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCHomeModel.h"

@implementation BCHomeModel

@end
@implementation HomeCandyListModel
+(NSDictionary *)mj_replacedKeyFromPropertyName{
    
    return @{@"ID":@"id"};
}
@end
@implementation WinPeopleModel
+(NSDictionary *)mj_replacedKeyFromPropertyName{
    
    return @{@"ID":@"id"};
}


@end
@implementation CandyListModel
+(NSDictionary *)mj_replacedKeyFromPropertyName{
    
    return @{@"ID":@"id"};
}
//-(void)setSlogan:(NSString *)slogan{
//
//    _slogan = @"lsakmdflkasjdl;fkjals;kdjfal;skjdfl;kasjdfl;kjals;kdjfl;askjdlf;kjasl;dkjfla;skjdfl;akjsl;dkfjal;sslogan了看见第三方拉斯科据了解阿斯兰的会计法拉斯科京东分类；卡视角kjfl";
//}
@end
@implementation PlatTaskLogModel
+(NSDictionary *)mj_replacedKeyFromPropertyName{
    
    return @{@"ID":@"id"};
}

@end
@implementation TaskInfoModel
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

-(void)setName:(NSString *)name{
    _name = name;
    _cellHeight += [name textSizeW:LFscreenW-32 textFont:16];

}
-(void)setTaskDesc:(NSString *)taskDesc{
        _taskDesc = taskDesc;
   _cellHeight += [taskDesc textSizeW:LFscreenW-32 textFont:16];
}
@end

