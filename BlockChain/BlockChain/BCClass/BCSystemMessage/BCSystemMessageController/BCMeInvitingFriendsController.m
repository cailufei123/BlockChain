//
//  BCMeInvitingFriendsController.m
//  BlockChain
//
//  Created by Mac on 2018/5/26.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCMeInvitingFriendsController.h"
#import "BCMeInvitingFriendsView.h"
#import "BCMeInvitingShareView.h"
#import "BCMeInvitingFriendsModel.h"

@interface BCMeInvitingFriendsController ()<BCMeInvitingFriendsViewDelegate,BCMeInvitingShareViewDelegate>
@property(nonatomic,strong)BCMeInvitingFriendsView *invitingView;
@property(nonatomic,strong)BCMeInvitingShareView *shareView;
@property(nonatomic,assign)BOOL isShow;
@property(nonatomic,strong)UIView *BGView1;
@property(nonatomic,strong)BCMeInvitingFriendsModel *model;
@end

@implementation BCMeInvitingFriendsController
-(BCMeInvitingFriendsModel *)model{
    if (!_model) {
        _model = [[BCMeInvitingFriendsModel alloc] init];
    }
    return _model;
}

- (void)viewWillAppear:(BOOL)animated {
    //去掉背景图片
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    //去掉底部线条
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"millcolorGrad"] forBarMetrics:UIBarMetricsDefault];
}
//邀请码view
-(BCMeInvitingFriendsView *)invitingView{
    if (!_invitingView) {
        _invitingView = [[BCMeInvitingFriendsView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
        self.model.token = loginMe.shareCode;//码
        NSLog(@"lastInviteCount===%@",loginMe.shareCode);
        

//        NSString *path = [USER_DEFAULT valueForKey:@"downUrl"];
//        self.model.QImage =[Util getColorQrcodeWithToken:path SmallCenterImage:[UIImage imageNamed:@"lg"] imageWidth:SXRealValue(60) color1:CI_RGBACOLOR(129, 0, 244, 1)  color2:CI_RGBACOLOR(255, 255, 255, 0)];
        // 获取对应颜色的二维码
        UIImage*Qimage=[Util getColorQimageWithPath:[USER_DEFAULT valueForKey:@"downUrl"] withImageView:nil WithSize:500 withCenterIcon:[UIImage imageNamed:@"lg"] centerIconWidth:SXRealValue(80) withRed:129.0f andGreen:0.0f andBlue:224.0f];
        self.model.QImage =Qimage;
        _invitingView.model =self.model;
        _invitingView.delegate =self;
    }
    return _invitingView;
}

//弹出分享view
-(BCMeInvitingShareView *)shareView{
    WS(weakSelf);
    if (!_shareView) {
        CGFloat  showHeight;
        if (IS_IPhoneX) {
            showHeight =SCREENHEIGHT/2+(SYRealValue(63));
        }else{
            showHeight=SCREENHEIGHT/2+(SYRealValue(84));
        }
        _shareView = [[BCMeInvitingShareView alloc] initWithFrame:CGRectMake(0, showHeight, SCREENWIDTH, SCREENHEIGHT)];
        
        _shareView.model =self.model;
        _shareView.weiXinBtnBlock = ^{//微信分享
            NSLog(@"微信");
            UIImage *image = [Util captureImageFromView:weakSelf.view];
            [ATSKIPTOOl shareImageAndTextWithText:nil thumImage:nil shareImage:image shareType:UMShareType_WeiXinType currentViewController:weakSelf success:^{
                NSLog(@"分享成功");
            }];
        };
        _shareView.pengYouBtnBlock = ^{//朋友圈分享
            UIImage *image = [Util captureImageFromView:weakSelf.view];
            [ATSKIPTOOl shareImageAndTextWithText:nil thumImage:nil shareImage:image shareType:UMShareType_WeiXinPengyouQuan currentViewController:weakSelf success:^{
                NSLog(@"分享成功");
            }];
        };
        _shareView.QQBtnBlock = ^{// QQ分享
            UIImage *image = [Util captureImageFromView:weakSelf.view];
            [ATSKIPTOOl shareImageAndTextWithText:nil thumImage:nil shareImage:image shareType:UMShareType_QQ currentViewController:weakSelf success:^{
                NSLog(@"分享成功");
            }];
        };
            NSLog(@"QQ分享");
        _shareView.delegate =self;
        };
    return _shareView;
}

-(UIView *)BGView1{
    if (!_BGView1) {
        _BGView1                 = [[UIView alloc] init];
        _BGView1.frame           = [[UIScreen mainScreen] bounds];
        _BGView1.tag             = 102;
        _BGView1.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
        _BGView1.opaque = NO;
       UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeShareView)];
        tap.numberOfTapsRequired = 1;
        tap.cancelsTouchesInView = NO;
        [_BGView1 addGestureRecognizer:tap];
    }
    return _BGView1;
}
-(void)showShareView{
    if (_isShow==NO) {
        _isShow=YES;
        //--UIWindow的优先级最高，Window包含了所有视图，在这之上添加视图，可以保证添加在最上面
        UIWindow *appWindow = [[UIApplication sharedApplication] keyWindow];
        [appWindow addSubview:self.BGView1];
        [appWindow addSubview:self.shareView];
        
        // ------View出现动画
        self.shareView.transform = CGAffineTransformMakeTranslation(0.01, SCREENHEIGHT);
        [UIView animateWithDuration:0.3 animations:^{
            self.shareView.transform = CGAffineTransformMakeTranslation(0.01, 0.01);
        }];
    }else{
        _isShow=NO;
        [self closeShareView];
    }
}

#pragma mark - 关闭语音view
-(void)closeShareView{
    WS(weakSelf);
    [UIView animateWithDuration:0.3 animations:^{
        self.shareView.transform = CGAffineTransformMakeTranslation(0.01, SCREENHEIGHT);
        //self.voiceView.alpha = 0.2;
        //self.BGView1.alpha = 0;
    } completion:^(BOOL finished) {
        //释放内存
        //[self.voiceView shiFangCeiChun];
        [self.shareView removeFromSuperview];
        [self.BGView1 removeFromSuperview];
        self.shareView=nil;
        self.BGView1=nil;
        self.shareView=nil;
        weakSelf.isShow=NO;
    }];
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
