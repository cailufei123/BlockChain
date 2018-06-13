//
//  BCMeInvitingFriendsView.m
//  BlockChain
//
//  Created by Mac on 2018/5/26.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCMeInvitingFriendsView.h"
#import "BCMeInvitingFriendsModel.h"



@interface BCMeInvitingFriendsView()
//顶部
@property (nonatomic, strong)UIView *bigView;
@property (nonatomic, strong)UIImageView *bigImageView;

@property (nonatomic, strong)UIImageView *caiFuIcon;
@property (nonatomic, strong)UIView *middleView;

@property (nonatomic, strong)UILabel *yaoQingLable;
@property (nonatomic, strong)UILabel *yaoQing;
@property (nonatomic, strong)UILabel *messageLable;
@property (nonatomic, strong)UIView *xuXianView;
@property (nonatomic, strong)UIImageView *QcodeIcon;//二维码


@property (nonatomic, strong)UILabel *changAnLable;//长按识别码
@property (nonatomic, strong)UIButton *loadingBtn;//下载唐人
@property(nonatomic,strong)UILongPressGestureRecognizer *longRecognizer;
@property(nonatomic,strong)NSTimer * timer;
@property(nonatomic,assign)BOOL isReapt;
@end

@implementation BCMeInvitingFriendsView


-(UIView *)bigView{
    if (!_bigView) {
        _bigView = [[UIView alloc] init];
        _bigView.backgroundColor =naverTextColor;
        //[Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_downView];
    }
    return _bigView;
}
-(UIView *)middleView{
    if (!_middleView) {
        _middleView = [[UIView alloc] init];
        _middleView.backgroundColor =naverTextColor;
        [Util roundBorderView:(SXRealValue(6)) border:0 color:[UIColor blackColor] view:_middleView];
    }
    return _middleView;
}
-(UIImageView *)bigImageView{
    if (!_bigImageView) {
        _bigImageView = [[UIImageView alloc] init];
        //_myIcon.contentMode = UIViewContentModeScaleAspectFill;
        //[Util roundBorderView:SXRealValue(60/2) border:0 color:nil view:_ziChanIcon];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_bigImageView];
    }
    return _bigImageView;
}
-(UIImageView *)caiFuIcon{
    if (!_caiFuIcon) {
        _caiFuIcon = [[UIImageView alloc] init];
        _caiFuIcon.contentMode = UIViewContentModeScaleAspectFit;
        //[Util roundBorderView:SXRealValue(60/2) border:0 color:nil view:_ziChanIcon];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_caiFuIcon];
    }
    return _caiFuIcon;
}

-(UILabel *)yaoQingLable{
    if (!_yaoQingLable) {
        _yaoQingLable =[UILabel LabelWithTextColor:color5D1C90 textFont:FONT(@"PingFangSC-Medium", SXRealValue(16)) textAlignment:NSTextAlignmentCenter numberOfLines:1];
//                [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_yaoQingLable];
    }
    return _yaoQingLable;
}
-(UILabel *)yaoQing{
    if (!_yaoQing) {
        _yaoQing =[UILabel LabelWithTextColor:color8D35D3 textFont:FONT(@"PingFangSC-Medium", SXRealValue(33)) textAlignment:NSTextAlignmentCenter numberOfLines:1];
        // [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_yaoQingLable];
    }
    return _yaoQing;
}

-(UILabel *)messageLable{
    if (!_messageLable) {
        _messageLable =[UILabel LabelWithTextColor:color5E5858 textFont:FONT(@"PingFangSC-Regular", SXRealValue(11)) textAlignment:NSTextAlignmentCenter numberOfLines:2];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_messageLable];
    }
    return _messageLable;
}
-(UIView *)xuXianView{
    if (!_xuXianView) {
        _xuXianView = [[UIView alloc] init];
        //[Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_xuXianView];
    }
    return _xuXianView;
}
-(UIImageView *)QcodeIcon{
    if (!_QcodeIcon) {
        _QcodeIcon = [[UIImageView alloc] init];
        _QcodeIcon.userInteractionEnabled=YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture)];
        [_QcodeIcon addGestureRecognizer:tap];
        [self addLongTap];
        //_myIcon.contentMode = UIViewContentModeScaleAspectFill;
        //[Util roundBorderView:SXRealValue(60/2) border:0 color:nil view:_ziChanIcon];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_QcodeIcon];
    }
    return _QcodeIcon;
}
-(void)addLongTap{
    /*第一次创建手势识别器*/
    UILongPressGestureRecognizer* longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc]
                                                                
                                                                initWithTarget:self
                                                                
                                                                action:@selector(handleLongPressGestures:)];
    /* numberOfTouchesRequired这个属性保存了有多少个手指点击了屏幕,因此你要确保你每次的点击手指数目是一样的,默认值是为 0. */
    longPressGestureRecognizer.numberOfTouchesRequired = 1;
    /*最大100像素的运动是手势识别所允许的*/
    longPressGestureRecognizer.allowableMovement = 100.0f;
    /*这个参数表示,两次点击之间间隔的时间长度。*/
    longPressGestureRecognizer.minimumPressDuration = 1.0;
    [_QcodeIcon addGestureRecognizer:longPressGestureRecognizer];
    self.longRecognizer =longPressGestureRecognizer;

}
-(void)removeLongTap{
    [_QcodeIcon removeGestureRecognizer:self.longRecognizer];
}

-(UILabel *)changAnLable{
    if (!_changAnLable) {
        _changAnLable =[UILabel LabelWithTextColor:color484848 textFont:FONT(@"PingFangSC-Regular", SXRealValue(15)) textAlignment:NSTextAlignmentCenter numberOfLines:1];
//            [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_yaoQingLable];
    }
    return _changAnLable;
}
-(UIButton *)loadingBtn{
    if (!_loadingBtn) {
        _loadingBtn = [UIButton getButtonTitleColor:color6237A6 titleFont:FONT(@"PingFangSC-Regular", SXRealValue(15)) backGroundColor:nil target:self action:@selector(loadingBtnClick:)];
        _loadingBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        //_sureBtn.titleLabel.textColor =naverTextColor;
        [_loadingBtn  setHitEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -10)];//热区域
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_loadingBtn];
    }
    return _loadingBtn;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self =[super initWithFrame:frame]) {
        //顶部
        [self.middleView addSubview:self.yaoQingLable];
        [self.middleView addSubview:self.yaoQing];
        [self.middleView addSubview:self.messageLable];
        [self.middleView addSubview:self.xuXianView];
        [self.middleView addSubview:self.QcodeIcon];
        [self.middleView addSubview:self.changAnLable];
        [self.middleView addSubview:self.loadingBtn];

        [self.bigView addSubview:self.bigImageView];
        [self.bigView addSubview:self.caiFuIcon];
        [self.bigView addSubview:self.middleView];
        [self addSubview:self.bigView];


        [self.bigView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
        }];
        [self.bigImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
        }];
        [self.caiFuIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.bigView.mas_top).with.offset(kTopHeight+(SYRealValue(13)));
            make.left.mas_equalTo(self.bigView.mas_left).with.offset(SXRealValue(77));
            make.right.mas_equalTo(self.bigView.mas_right).with.offset(SXRealValue(-87));
            //make.centerX.mas_equalTo(self.bigView.mas_centerX);
            make.height.mas_equalTo((SCREENWIDTH-(SXRealValue(77+87)))*58/211);
        }];
        [self.middleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.caiFuIcon.mas_bottom).with.offset((SYRealValue(30)));
            make.left.mas_equalTo(self.bigView.mas_left).with.offset(SXRealValue(40));
            make.right.mas_equalTo(self.bigView.mas_right).with.offset(SXRealValue(-40));
//            make.height.mas_equalTo((SCREENWIDTH-2*(SXRealValue(40)))*420/296);
//            make.bottom.mas_equalTo(self.bigView.mas_bottom).with.offset((SYRealValue(-98)));
        }];
        [self.yaoQingLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.middleView.mas_top).with.offset((SYRealValue(17)));
            make.left.mas_equalTo(self.middleView.mas_left).with.offset(SXRealValue(0));
            make.right.mas_equalTo(self.middleView.mas_right).with.offset(SXRealValue(0));
            make.height.mas_equalTo((SYRealValue(24)));
        }];
        [self.yaoQing mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.yaoQingLable.mas_bottom).with.offset((SYRealValue(0)));
            make.left.mas_equalTo(self.middleView.mas_left).with.offset(SXRealValue(0));
            make.right.mas_equalTo(self.middleView.mas_right).with.offset(SXRealValue(0));
            make.height.mas_equalTo((SYRealValue(64)));
        }];
        [self.messageLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.yaoQing.mas_bottom).with.offset((SYRealValue(0)));
            make.left.mas_equalTo(self.middleView.mas_left).with.offset(SXRealValue(25));
            make.right.mas_equalTo(self.middleView.mas_right).with.offset(SXRealValue(-25));
            make.height.mas_equalTo((SYRealValue(34)));
        }];
        [self.xuXianView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.messageLable.mas_bottom).with.offset((SYRealValue(12)));
            make.left.mas_equalTo(self.middleView.mas_left).with.offset(SXRealValue(0));
            make.right.mas_equalTo(self.middleView.mas_right).with.offset(SXRealValue(0));
            make.height.mas_equalTo((SYRealValue(1)));
        }];
        [self.QcodeIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.xuXianView.mas_bottom).with.offset((SYRealValue(15)));
            make.centerX.mas_equalTo(self.middleView.mas_centerX);
            make.width.mas_equalTo((SXRealValue(185)));
            make.height.mas_equalTo((SYRealValue(179)));
        }];
        [self.changAnLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.QcodeIcon.mas_bottom).with.offset((SYRealValue(15)));
            make.left.mas_equalTo(self.middleView.mas_left).with.offset(SXRealValue(0));
            make.right.mas_equalTo(self.middleView.mas_right).with.offset(SXRealValue(0));
            make.height.mas_equalTo((SYRealValue(18)));
        }];
        [self.loadingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.changAnLable.mas_bottom).with.offset((SYRealValue(0)));
            make.centerX.mas_equalTo(self.middleView.mas_centerX);
            make.bottom.mas_equalTo(self.middleView.mas_bottom).with.offset((SYRealValue(-10)));
            make.width.mas_equalTo((SYRealValue(100)));
            make.height.mas_equalTo((SYRealValue(35)));
        }];
        //底部
        [self layoutIfNeeded];
        [Util drawLineOfDashByCAShapeLayer:self.xuXianView lineLength:(SXRealValue(10)) lineSpacing:SXRealValue(10) lineColor:color9884AF lineDirection:YES];
    }
    return self;
}

-(void)setModel:(BCMeInvitingFriendsModel *)model{
    _model =model;
    if (model!=nil) {
        //假数据
        self.bigImageView.image=[UIImage imageNamed:@"背景－2"];
        self.caiFuIcon.image=[UIImage imageNamed:@"雷鹿财富logo白-2"];
        self.yaoQingLable.text = @"我的邀请码";
        self.yaoQing.text = model.token;
        self.messageLable.text =@"赶快和我一起领糖果，使用邀请码注册更有惊喜大礼包等你来拿";
        self.QcodeIcon.image =model.QImage;
        self.changAnLable.text = @"长按识别二维码";
        [self.loadingBtn setTitle:@"下载雷鹿财富" forState:UIControlStateNormal];
    }
}
//


    
 
    



#pragma mark -下载唐人街
-(void)loadingBtnClick:(UIButton *)button{
    if (self.delegate && [self.delegate respondsToSelector:@selector(loadingBtnClick)]) {
        [self.delegate loadingBtnClick];
    }
    
}
#pragma mark-长按识别二维码
- (void) handleLongPressGestures:(UILongPressGestureRecognizer *)paramSender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(showShareView)]) {
        if (self.isReapt==YES) return;
        [self.delegate showShareView];
        self.isReapt =YES;
        WS(weakSelf);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            weakSelf.isReapt =NO;
        });
    }
}
//点击显示分享
-(void)tapGesture{
        if (self.delegate && [self.delegate respondsToSelector:@selector(showShareView)]) {
            [self.delegate showShareView];
            self.isReapt =NO;
        }
}



@end
