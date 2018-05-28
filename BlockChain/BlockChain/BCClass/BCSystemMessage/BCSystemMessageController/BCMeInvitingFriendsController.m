//
//  BCMeInvitingFriendsController.m
//  BlockChain
//
//  Created by Mac on 2018/5/26.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCMeInvitingFriendsController.h"
#import "BCMeInvitingFriendsView.h"

@interface BCMeInvitingFriendsController ()<BCMeInvitingFriendsViewDelegate>
@property(nonatomic,strong)BCMeInvitingFriendsView *invitingView;
@end

@implementation BCMeInvitingFriendsController

- (void)viewWillAppear:(BOOL)animated {
    //去掉背景图片
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    //去掉底部线条
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"millcolorGrad"] forBarMetrics:UIBarMetricsDefault];
}

-(BCMeInvitingFriendsView *)invitingView{
    if (!_invitingView) {
        _invitingView = [[BCMeInvitingFriendsView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
        BCMeInvitingFriendsModel *model;
        _invitingView.model =model;
        _invitingView.delegate =self;
    }
    return _invitingView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏
    [self setNaviTitle];
    [self.view addSubview:self.invitingView];
}

-(void)setNaviTitle{
    self.navigationItem.title=@"邀请好友";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:FONT(@"PingFangSC-Regular", SXRealValue(16)),
       NSForegroundColorAttributeName:naverTextColor}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
