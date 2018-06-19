//
//  BCLoginController.m
//  BlockChain
//
//  Created by 蔡路飞 on 2018/5/22.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCLoginController.h"
#import "BCCodeAlertView.h"
#import "BCMeModel.h"

#define timeCount 60

@interface BCLoginController ()<UITextFieldDelegate,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *businessImg;
@property (weak, nonatomic) IBOutlet UITextField *phoneTf;

@property (weak, nonatomic) IBOutlet UITextField *codeTf;
@property (weak, nonatomic) IBOutlet UIButton *getCodeBt;
@property (weak, nonatomic) IBOutlet UIButton *loginBt;
@property (weak, nonatomic) IBOutlet UITextField *nameTf;
@property (weak, nonatomic) IBOutlet UITextField *invitationCodeTf;
@property (weak, nonatomic) IBOutlet UILabel *invitationLb;
@property (weak, nonatomic) IBOutlet UIButton *agreementLb;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollow;
@property(nonatomic,strong)NSTimer * timer;
@property(nonatomic,assign)NSInteger count;
@property (weak, nonatomic) IBOutlet UIView *invitationView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *invitationLyout;
@property (weak, nonatomic) IBOutlet UIButton *noCodeBt;
@property (weak, nonatomic) IBOutlet UIButton *sureBt;
@end

@implementation BCLoginController

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    
}
- (IBAction)noCodeBtClick:(id)sender {
    BCCodeAlertView * codeAlertView  =[BCCodeAlertView loadNameBCCodeAlertViewXib];
    codeAlertView.clf_size = CGSizeMake(LFscreenW-30, 270);
    [GKCover coverFrom:[UIApplication sharedApplication].keyWindow contentView:codeAlertView style:GKCoverStyleTranslucent showStyle:GKCoverShowStyleCenter showAnimStyle:GKCoverShowAnimStyleBottom hideAnimStyle:GKCoverHideAnimStyleNone notClick:NO];
   
}

//按下return keyboard消失
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
     
    self.navigationItem.title = @"登录";
    self.scrollow.delegate = self;
    self.phoneTf.borderStyle = self.codeTf.borderStyle = self.nameTf.borderStyle = self.invitationCodeTf.borderStyle = UITextBorderStyleNone;
    self.phoneTf.delegate =  self.codeTf.delegate =  self.nameTf.delegate =  self.invitationCodeTf.delegate =  self;
    self.count = timeCount;
    [self.getCodeBt addTarget:self action:@selector(getCodeBtCilck) forControlEvents:UIControlEventTouchUpInside];
     [self.loginBt addTarget:self action:@selector(logingBtClick) forControlEvents:UIControlEventTouchUpInside];
    [self.agreementLb addTarget:self action:@selector(agreementBtClick) forControlEvents:UIControlEventTouchUpInside];
    [self.sureBt addTarget:self action:@selector(sureBtClick:) forControlEvents:UIControlEventTouchUpInside];
   
    WeakSelf(weakSelf)
    self.timer = [NSTimer wh_scheduledTimerWithTimeInterval:1 repeats:YES callback:^(NSTimer *timer) {
        [weakSelf timerFireMethod];
    }];
    [self.timer pauseTimer];
//    [self addNoticeForKeyboard];
    // 下划线
    self.invitationView.hidden = YES;
    self.invitationLyout.constant = 40;
    NSString * agreementStr = @"我已阅读并同意《用户协议》";
    NSRange agreement = [agreementStr rangeOfString:@"《用户协议》"];
    NSDictionary *attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:agreementStr ];
    
    [attribtStr addAttributes:attribtDic range:agreement];
    
    self.agreementLb.titleLabel.attributedText = attribtStr;
    
    NSString * invitationStr = @"使用邀请码额外获得10紫钻，没有邀请码？";
    NSRange invitationRange = [invitationStr rangeOfString:@"没有邀请码？"];
    NSDictionary *invitationDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *invitationstr = [[NSMutableAttributedString alloc]initWithString:invitationStr ];
//
    [invitationstr addAttributes:invitationDic range:invitationRange];
//
    self.invitationLb.attributedText = invitationstr;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(wwww)];
    [self.invitationLb addGestureRecognizer:tap];
  
    
}
-(void)wwww{
    
}
-(void)sureBtClick:(UIButton * )bt{
    if (bt.selected) {
        bt.selected = NO;
    }else{
         bt.selected = YES;
    }
    
}

-(void)agreementBtClick{//用户协议
    
}

#pragma mark - 键盘通知
- (void)addNoticeForKeyboard {
    
    //注册键盘出现的通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    //注册键盘消失的通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}

/////键盘显示事件
//- (void) keyboardWillShow:(NSNotification *)notification {
//    //获取键盘高度，在不同设备上，以及中英文下是不同的
//    CGFloat kbHeight = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
//    //计算出键盘顶端到inputTextView panel底端的距离(加上自定义的缓冲距离INTERVAL_KEYBOARD)
//    CGFloat offset = self.bottomView.clf_bottom  - (self.view.frame.size.height - kbHeight);
//    // 取得键盘的动画时间，这样可以在视图上移的时候更连贯
//    double duration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
//    
//    //将视图上移计算好的偏移
//    if(offset > 0) {
//        [UIView animateWithDuration:duration animations:^{
//            [self.scrollow setContentOffset:CGPointMake(0, offset)];
//        }];
//    }
//}

///键盘消失事件
- (void) keyboardWillHide:(NSNotification *)notify {
    // 键盘动画时间
    double duration = [[notify.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    //视图下沉恢复原状
    [UIView animateWithDuration:duration animations:^{
        [self.scrollow setContentOffset:CGPointMake(0, 0)];
    }];
}


-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
    
}
- (IBAction)registBt:(UIButton *)sender {//点击注册
    
    if (self.phoneTf.text.length<=0) {
        [MBManager showBriefAlert:@"手机号不能为空" ];
        return;
    }else if(self.codeTf.text.length<=0){
        [MBManager showBriefAlert:@"验证码不能为空"];
        return;
    }else if(self.nameTf.text.length<=0){
        [MBManager showBriefAlert:@"名字不能为空"];
        return;
    }else if(self.nameTf.text.length<=0){
        [MBManager showBriefAlert:@"名字不能为空"];
        return;
    }
   
}
- (void)logingBtClick {
    if (self.invitationLyout.constant <200) {
        if (self.phoneTf.text.length<=0) {
            [MBManager showBriefAlert:@"手机号不能为空" ];
            return;
        }else if(self.codeTf.text.length<=0){
            [MBManager showBriefAlert:@"验证码不能为空"];
            return;
        }
        NSMutableDictionary * loginDict = diction;
        loginDict[@"mobile"] = self.phoneTf.text;
        loginDict[@"smsCode"] =self.codeTf.text;
                
//        if ([self.phoneTf.text isEqualToString:@"18519059080"]) {//如果是我的账号，直接登录成功，不走接口
//            NSDictionary *dict = @{@"token":@"RkY2MTE4NTJEQzkzOUE5QkExMjdGQTVCQjFGMkU4RjI="};
//            SALoginModel* loginmodel = [SALoginModel mj_objectWithKeyValues:dict];
//            [LFAccountTool save:loginmodel];
//            [MBManager hideAlert];
//            [LKControllerTool chooseRootViewController];
//            [MBManager showBriefAlert:@"登陆成功"];
//            [self loadUpData];
//        }else{//不是我的账户
            [YWRequestData userLoginDict:loginDict success:^(id responseObj) {
                [MBManager showBriefAlert:@"登陆成功"];
                SALoginModel* loginmodel = [SALoginModel mj_objectWithKeyValues:responseObj[@"data"]];
                [LFAccountTool save:loginmodel];
                [MBManager hideAlert];
                [LKControllerTool chooseRootViewController];
                [self loadUpData];
            }];
//        }
       
    }else{
        if (self.phoneTf.text.length<=0) {
            [MBManager showBriefAlert:@"手机号不能为空" ];
            return;
        }else if(self.codeTf.text.length<=0){
            [MBManager showBriefAlert:@"验证码不能为空"];
            return;
        }else if(self.nameTf.text.length<=0){
            [MBManager showBriefAlert:@"名字不能为空"];
            return;
        }
        if (!self.sureBt.selected) {
            [MBManager showBriefAlert:@"同意协议才可注册"];
            return;
        }
        NSMutableDictionary * registDict = diction;
        registDict[@"mobile"] = self.phoneTf.text;
        registDict[@"smsCode"] = self.codeTf.text;
        registDict[@"name"] = self.nameTf.text;
        registDict[@"code"] = self.invitationCodeTf.text;
        
        
        [YWRequestData registUserDict:registDict success:^(id responseObj) {
            SALoginModel* loginmodel = [SALoginModel mj_objectWithKeyValues:responseObj[@"data"]];
            loginmodel.mobile =self.phoneTf.text;
            [LFAccountTool save:loginmodel];
            [MBManager showBriefAlert:@"注册成功"];
             [self loadUpData];
         
               [LKControllerTool chooseRootViewController];
//            NSMutableDictionary * loginDict = diction;
//            loginDict[@"mobile"] = self.phoneTf.text;
//            loginDict[@"smsCode"] =self.codeTf.text;
//            [YWRequestData userLoginDict:loginDict success:^(id responseObj) {
//
//                [MBManager showBriefAlert:@"登陆成功"];
//                SALoginModel* loginmodel = [SALoginModel mj_objectWithKeyValues:responseObj[@"data"]];
//                [LFAccountTool save:loginmodel];
//                [MBManager hideAlert];
//
//                 [self loadUpData];
//            }];
        }];
    }

   

}
-(void)loadUpData{
    NSMutableDictionary * candyDict = diction;
    candyDict[@"token"] = loginToken;
    [BCRequestData getUser_InfoDict:candyDict success:^(id responseObject) {
        BCMeModel *model = [BCMeModel mj_objectWithKeyValues:REQUEST_DATA];
        [LFAccountTool saveMe:model];
    } erorr:^(id error) {//请求失败
       
    }];
}
-(void)timerFireMethod{
    if (self.count<=0){
        self.getCodeBt.userInteractionEnabled = YES;
        self.getCodeBt.selected = NO;
        [self.getCodeBt setTitle:@"发送验证码" forState:UIControlStateNormal];
        [self.timer pauseTimer];
    }else{
        self.getCodeBt.selected = YES;
        self.getCodeBt.userInteractionEnabled = NO;
        [self.getCodeBt setTitle:[NSString stringWithFormat:@"(%02ld秒)可重发", self.count-- ] forState:UIControlStateNormal];
    }
    
    
}
-(void)getCodeBtCilck{
    self.count = timeCount;
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    dic[@"mobile"] = self.phoneTf.text;
    [YWRequestData registUserSendcodeDict:dic success:^(id responseObject) {
        if ([responseObject[@"status"] isEqual:@(19)]) {
            self.invitationView.hidden = NO;
            self.invitationLyout.constant = 200;
            
        }
       
        [self.timer resumeTimer];
    }];
   
}
-(void)dealloc{
    [self.timer invalidate];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
