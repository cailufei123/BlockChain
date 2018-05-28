//
//  BCSetViewController.m
//  BlockChain
//
//  Created by 蔡路飞 on 2018/5/23.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCSetViewController.h"
#import "BCReaNameController.h"
#import "BCRealNameInReviewViewController.h"
#import "BCRealNameReviewFailureViewController.h"
#import "BCRealNameReviewPassViewController.h"
#import "SAMessageViewController.h"
#import "BCSetPayPasswordViewController.h"
@interface BCSetViewController ()
@property (weak, nonatomic) IBOutlet UILabel *acountLb;
@property (weak, nonatomic) IBOutlet UILabel *realNameLb;
@property (weak, nonatomic) IBOutlet UILabel *payPasswordLb;

@property (weak, nonatomic) IBOutlet UILabel *versionLb;
@property(copy,nonatomic)NSString * realNameSkipstr;
@end

@implementation BCSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationItem.title = @"设置";
    self.view.backgroundColor = bagColor;
    NSString * agreementStr = @"去认证";
    NSRange agreement = [agreementStr rangeOfString:agreementStr];
    NSDictionary *attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:agreementStr ];
    [attribtStr addAttributes:attribtDic range:agreement];
    
    self.realNameLb.attributedText = attribtStr;
self.realNameSkipstr = @"1";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)meaageTap:(id)sender {
    SAMessageViewController * messageV = [[SAMessageViewController alloc] init];
    [self.navigationController pushViewController:messageV animated:YES];
}
- (IBAction)realnameTap:(id)sender {
    if ([self.realNameSkipstr isEqualToString:@"1"]) {
        BCReaNameController * reaNamv = [[BCReaNameController alloc] init];
        [self.navigationController pushViewController:reaNamv animated:YES];
    }else if([self.realNameSkipstr isEqualToString:@"2"]) {
        BCRealNameInReviewViewController * reaNamv = [[BCRealNameInReviewViewController alloc] init];
        [self.navigationController pushViewController:reaNamv animated:YES];
    }else if([self.realNameSkipstr isEqualToString:@"3"]) {
        BCRealNameReviewFailureViewController * reaNamv = [[BCRealNameReviewFailureViewController alloc] init];
        [self.navigationController pushViewController:reaNamv animated:YES];
    }else if([self.realNameSkipstr isEqualToString:@"4"]) {
        BCRealNameReviewPassViewController * reaNamv = [[BCRealNameReviewPassViewController alloc] init];
        [self.navigationController pushViewController:reaNamv animated:YES];
    }
   
}
- (IBAction)paypasswordTap:(id)sender {

    BCSetPayPasswordViewController * reaNamv = [[BCSetPayPasswordViewController alloc] init];
    [self.navigationController pushViewController:reaNamv animated:YES];
}
- (IBAction)invitationFriendTap:(id)sender {
    
}
- (IBAction)aboutMeTap:(id)sender {
    
}
- (IBAction)loginOutClick:(id)sender {
    [self outLogin];
}

-(void)outLogin{
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    
    dict[@"token"] = loginToken;
    [MBManager showWaitingWithTitle:@"正在退出.."];
    
    [LFHttpTool post:USER_OUTLOGIN params:dict progress:^(id downloadProgress) {
        
    } success:^(id responseObj) {
        
        [MBManager hideAlert];
        
        if ([responseObj[@"status"]isEqual:@(0)]) {
            [MBManager showBriefAlert:@"退出成功"];
            
            NSString* filename = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.data"];
            
            NSFileManager *defaultManager = [NSFileManager defaultManager];
            if ([defaultManager isDeletableFileAtPath:filename]) {
                [defaultManager removeItemAtPath:filename error:nil];
            }
            
             [LKControllerTool chooseRootViewController];
            
            
        }
    } failure:^(NSError *error) {
        [MBManager hideAlert];
        [MBManager showBriefAlert:@"网络不给力"];
    }];
    
    
}
@end
