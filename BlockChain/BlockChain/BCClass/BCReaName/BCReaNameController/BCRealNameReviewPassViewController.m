//
//  BCRealNameReviewPassViewController.m
//  BlockChain
//
//  Created by 蔡路飞 on 2018/5/24.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCRealNameReviewPassViewController.h"

@interface BCRealNameReviewPassViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLb;

@property (weak, nonatomic) IBOutlet UILabel *cordIDNumberLb;
@end

@implementation BCRealNameReviewPassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameLb.text = self.model.realName;
      self.cordIDNumberLb.text = self.model.idNo;
     self.navigationItem.title = @"已认证";
//    if (self.model.idNo.length>10) {
//          [self replaceStringWithAsterisk:self.model.idNo startLocation:4 lenght:self.model.idNo.length-4];
//    }
    [self replaceStringWithAsterisk:self.model.idNo startLocation:4 lenght:self.model.idNo.length-4];
}
-(NSString *)replaceStringWithAsterisk:(NSString *)originalStr startLocation:(NSInteger)startLocation lenght:(NSInteger)lenght

{
    
    NSString *newStr = originalStr;
    
    for (int i = 0; i < lenght; i++) {
        
        NSRange range = NSMakeRange(startLocation, 1);
        
        newStr = [newStr stringByReplacingCharactersInRange:range withString:@"*"];
        
        startLocation ++;
        
    }
    
    return newStr;
    
}


@end
