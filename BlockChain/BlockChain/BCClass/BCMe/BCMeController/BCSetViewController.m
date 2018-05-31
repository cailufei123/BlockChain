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
#import "BCMeModel.h"
#import "ATServiceAgreementController.h"
#import "BCMeInvitingFriendsController.h"

@interface BCSetViewController ()
@property (weak, nonatomic) IBOutlet UILabel *acountLb;
@property (weak, nonatomic) IBOutlet UILabel *realNameLb;
@property (weak, nonatomic) IBOutlet UILabel *payPasswordLb;

@property (weak, nonatomic) IBOutlet UILabel *versionLb;
@property(copy,nonatomic)NSString * realNameSkipstr;
@end

@implementation BCSetViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadUpData];
}
-(void)loadUpData{
    NSMutableDictionary * candyDict = diction;
    candyDict[@"token"] = loginToken;
    [BCRequestData getUser_InfoDict:candyDict success:^(id responseObject) {
        LFLog(@"%@",responseObject);
        BCMeModel *model = [BCMeModel mj_objectWithKeyValues:REQUEST_DATA];
        self.model=model;
        [self statusl];
    } erorr:^(id error) {//请求失败
      
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationItem.title = @"设置";
    self.view.backgroundColor = bagColor;
  
    [self statusl];


    
  
}
-(void)statusl{
    NSString * agreementStr = @"去认证";
    if ([self.model.authStatus isEqualToString:@"1"]) {
        agreementStr = @"审核中";
    }else if ([self.model.authStatus isEqualToString:@"2"]){
        agreementStr = @"认证通过";
    }else if ([self.model.authStatus isEqualToString:@"3"]){
        agreementStr = @"认证失败";
      
    }else{
        agreementStr = @"去认证";
    }
  
    NSRange agreement = [agreementStr rangeOfString:agreementStr];
    NSDictionary *attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:agreementStr ];
    [attribtStr addAttributes:attribtDic range:agreement];
    self.realNameLb.attributedText = attribtStr;
    
    if ([self.model.isPayPassSet isEqualToString:@"0"]) {
        
        self.payPasswordLb.text = @"设置支付密码";
    }else if ([self.model.isAuthed isEqualToString:@"1"]){

         self.payPasswordLb.text = @"重置支付密码";
    }
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
    
    if ([self.model.authStatus isEqualToString:@"1"]) {
        BCRealNameInReviewViewController * reaNamv = [[BCRealNameInReviewViewController alloc] init];
        [self.navigationController pushViewController:reaNamv animated:YES];
    }else if ([self.model.authStatus isEqualToString:@"2"]){
        BCRealNameReviewPassViewController * reaNamv = [[BCRealNameReviewPassViewController alloc] init];
        reaNamv.model = self.model;
        [self.navigationController pushViewController:reaNamv animated:YES];
    }else if ([self.model.authStatus isEqualToString:@"3"]){
        BCRealNameReviewFailureViewController * reaNamv = [[BCRealNameReviewFailureViewController alloc] init];
        [self.navigationController pushViewController:reaNamv animated:YES];
    }else{
        BCReaNameController * reaNamv = [[BCReaNameController alloc] init];
        [self.navigationController pushViewController:reaNamv animated:YES];
    }
   
   
}
- (IBAction)paypasswordTap:(id)sender {
    
    if ([self.model.isPayPassSet isEqualToString:@"0"]) {
        BCSetPayPasswordViewController * reaNamv = [[BCSetPayPasswordViewController alloc] init];
        reaNamv.title = @"设置支付密码";
        [self.navigationController pushViewController:reaNamv animated:YES];
    }else if ([self.model.isAuthed isEqualToString:@"2"]){
        BCSetPayPasswordViewController * reaNamv = [[BCSetPayPasswordViewController alloc] init];
          reaNamv.title = @"重置支付密码";
        [self.navigationController pushViewController:reaNamv animated:YES];
    }
   
}
- (IBAction)invitationFriendTap:(id)sender {
   
    BCMeInvitingFriendsController * serviceAgreementVc = [[BCMeInvitingFriendsController alloc] init];
   
    [self.navigationController pushViewController:serviceAgreementVc animated:YES];
}
- (IBAction)aboutMeTap:(id)sender {
    ATServiceAgreementController * serviceAgreementVc = [[ATServiceAgreementController alloc] init];
    serviceAgreementVc.htmlurl = ABOUT_US;
    serviceAgreementVc.htmltitle = @"关于我们";
    [self.navigationController pushViewController:serviceAgreementVc animated:YES];
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
