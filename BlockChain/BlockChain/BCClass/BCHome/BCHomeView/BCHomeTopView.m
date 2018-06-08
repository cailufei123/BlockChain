//
//  BCHomeTopView.m
//  BlockChain
//
//  Created by 蔡路飞 on 2018/5/22.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCHomeTopView.h"
#import "BCVerticalBttton.h"
#import "BCHomeModel.h"
//#import <AVFoundation/AVFoundation.h>
@interface BCHomeTopView()<WBAudioPlayerHelperDelegate>
@property (weak, nonatomic) IBOutlet UIView *horseLampbgView;



@property (weak, nonatomic) IBOutlet UIButton *hideSquareBt;
@property (weak, nonatomic) IBOutlet UIView *stoneBgView;
@property (weak, nonatomic) IBOutlet UIButton *calculationBt;
@property(nonatomic,strong)NSTimer * timer;
@property(nonatomic,assign)CGFloat  duration;
@property (weak, nonatomic) IBOutlet UISegmentedControl *samgent;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLyout;
@property (weak, nonatomic) IBOutlet UIButton *morebt;
@property (strong, nonatomic)  NSMutableArray *buttons;
@property (assign, nonatomic)  double  pleStone;
@property (strong, nonatomic)  AVAudioPlayer * player;


@end
@implementation BCHomeTopView
- (NSMutableArray *)buttons{
    if (_buttons == nil) {
        _buttons = [NSMutableArray new];
    }
    return _buttons;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    self.duration = 1.5;
    self.autoresizesSubviews = NO;
    self.autoresizingMask = NO;
   
   
    [self animateWithDuration];
     WeakSelf(weakSelf)

    self.timer = [NSTimer wh_scheduledTimerWithTimeInterval:self.duration*2 repeats:YES callback:^(NSTimer *timer) {
        [weakSelf animateWithDuration];
    }];
//    if (kDevice_Is_iPhoneX) {
//        self.topLyout.constant = kStatusBarHeight;
//    }
      self.topLyout.constant = kStatusBarHeight;
//      [self.timer pauseTimer];
   
    self.samgent.tintColor = [SVGloble colorWithHexString:@"#B378D5"];
//         self.samgent.layer.borderColor = [SVGloble colorWithHexString:@"#9A9A9A"].CGColor; //
    
//    segmentedControl.tintColor = [UIColor clearColor];
    //    选中的颜色
    [  self.samgent setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];
    //    未选中的颜色
    [  self.samgent setTitleTextAttributes:@{NSForegroundColorAttributeName:[SVGloble colorWithHexString:@"#9A9A9A"]} forState:UIControlStateNormal];
//      self.samgent.layer.borderWidth = 1.5;   UISegmentedControlStyleBar                //    边框宽度，重新画边框，若不重新画，可能会出现圆角处无边框的情况
//
//      self.samgent.layer.borderColor = [UIColor blackColor].CGColor; //     边框颜色
       [ self.samgent addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
  
    [self setButton];
    
    [self.hideSquareBt addTarget:self action:@selector(hideSquareBtClick) forControlEvents:UIControlEventTouchUpInside];
     [self.calculationBt addTarget:self action:@selector(calculationBtClick) forControlEvents:UIControlEventTouchUpInside];
     [self.morebt addTarget:self action:@selector(moreBtClick) forControlEvents:UIControlEventTouchUpInside];
     [self.purpleStoneBt addTarget:self action:@selector(purpleStoneBtClick) forControlEvents:UIControlEventTouchUpInside];
     [self.tellowStoneBt addTarget:self action:@selector(tellowStoneBtClick) forControlEvents:UIControlEventTouchUpInside];
    [self loadHomeCandyLis ];
}
-(void)setLists:(NSMutableArray *)lists{
    _lists = lists;
    [self createCenterStone];
}

//创建按钮
-(void)createCenterStone{
   
    [self.stoneBgView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.buttons removeAllObjects];
    CGFloat buttonH = 50;
    CGFloat buttonW = 35;
    
  
        
        
       
        
        BCVerticalBttton * bt = [[BCVerticalBttton alloc] init];
        bt.clf_width = buttonW;
        bt.clf_height = buttonH;
        [bt setImage:[UIImage imageNamed:@"home_mineral_icon"] forState:UIControlStateNormal];
        [bt setTitle:@"生长中" forState:UIControlStateNormal];
        bt.titleLabel.font = [UIFont systemFontOfSize:10];
    
        bt.clf_centerY = 160;
       bt.clf_centerX = LFscreenW/2;
     
        [  self.stoneBgView  addSubview:bt];
        
        [bt addTarget:self action:@selector(clickB) forControlEvents:UIControlEventTouchUpInside];
    
        
  
}

-(void)clickB{
    if ( self.refreshCandyList) {
        self.refreshCandyList();
    }
}


-(void)setCandyLists:(NSMutableArray *)candyLists{
    _candyLists = candyLists;
    [self createStone] ;
}
-(void)purpleStoneBtClick{
    if (self.purpleStone) {
        self.purpleStone();
    }
}
-(void)tellowStoneBtClick{
    if (self.yellowStoneBt) {
        self.yellowStoneBt();
    }
}
-(void)hideSquareBtClick{
    if (self.hideSquare) {
        self.hideSquare();
    }
    
}
-(void)calculationBtClick{
    if (self.calculation) {
        self.calculation();
    }
    
}
-(void)moreBtClick{
    if (self.more) {
        self.more();
    }
    
    
}
-(void)setButton{
    
    // underline Terms and condidtions
    NSMutableAttributedString* tncString = [[NSMutableAttributedString alloc] initWithString:@"领取更多糖果"];
    
    //设置下划线...
    /*
     NSUnderlineStyleNone                                    = 0x00, 无下划线
     NSUnderlineStyleSingle                                  = 0x01, 单行下划线
     NSUnderlineStyleThick NS_ENUM_AVAILABLE(10_0, 7_0)      = 0x02, 粗的下划线
     NSUnderlineStyleDouble NS_ENUM_AVAILABLE(10_0, 7_0)     = 0x09, 双下划线
     */
    [tncString addAttribute:NSUnderlineStyleAttributeName
                      value:@(NSUnderlineStyleSingle)
                      range:(NSRange){0,[tncString length]}];
    //此时如果设置字体颜色要这样
    [tncString addAttribute:NSForegroundColorAttributeName value:[SVGloble colorWithHexString:@"#787878"]  range:NSMakeRange(0,[tncString length])];
    
    //设置下划线颜色...
    [tncString addAttribute:NSUnderlineColorAttributeName value:[SVGloble colorWithHexString:@"#787878"] range:(NSRange){0,[tncString length]}];
    [self.morebt setAttributedTitle:tncString forState:UIControlStateNormal];
}
-(void)change:(UISegmentedControl *)sender{
   
    if (sender.selectedSegmentIndex == 0) {
       
        self.screen(@"0");
    }else if (sender.selectedSegmentIndex == 1){
        self.screen(@"1");
    }
}


-(void)animateWithDuration{
    [UIView animateWithDuration:self.duration delay:0 options:(UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAllowUserInteraction) animations:^{
          self.stoneBgView.frame = CGRectMake(0,  self.stoneBgView.clf_y+=10, LFscreenW, 180);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:self.duration delay:0 options:(UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAllowUserInteraction) animations:^{
              self.stoneBgView.frame = CGRectMake(0,  self.stoneBgView.clf_y-=10, LFscreenW, 180);
        } completion:^(BOOL finished) {
            
        }];
    }];
   
    
//    [UIView animateWithDuration:self.duration animations:^{
//        self.stoneBgView.frame = CGRectMake(0,  self.stoneBgView.clf_y+=10, LFscreenW, 180);
//    }completion:^(BOOL finished) {
//        [UIView animateWithDuration:self.duration animations:^{
//            self.stoneBgView.frame = CGRectMake(0,  self.stoneBgView.clf_y-=10, LFscreenW, 180);
//        }];
//    }];
//
}
//创建按钮
-(void)createStone{
//    UIView * bg = [[UIView alloc] init];
//    self.stoneBgView.frame = CGRectMake(0, 0, LFscreenW, 180);
//    [self.stoneBgView addSubview:bg];
    [self.stoneBgView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.buttons removeAllObjects];
    CGFloat buttonH = 50;
    CGFloat buttonW = 35;

    for (int i = 0; i < _candyLists.count; i++) {
       
        
        HomeCandyListModel * candyListModel = _candyLists[i];
       
        BCVerticalBttton * bt = [[BCVerticalBttton alloc] init];
        bt.clf_width = buttonW;
        bt.clf_height = buttonH;
        [bt setImage:[UIImage imageNamed:@"home_mineral_icon"] forState:UIControlStateNormal];
        [bt setTitle:candyListModel.drill forState:UIControlStateNormal];
        bt.titleLabel.font = [UIFont systemFontOfSize:10];
        bt.tag = i;
//        [bt setTitleColor:bCwhiteColor forState:UIControlStateNormal];
        do {
            bt.frame = [self randomFrameForLabel:bt];
        } while ([self frameIntersects:bt.frame]);
        
        [self.buttons addObject:bt];
         [  self.stoneBgView  addSubview:bt];
    
        [bt addTarget:self action:@selector(clickBgBtClick:) forControlEvents:UIControlEventTouchUpInside];
//        bt.frame = CGRectMake(buttonStartX, butttonStartY, buttonW, buttonH);
        
    }
}

- (CGRect)randomFrameForLabel:(UIButton *)button {
//    button.clf_width = 30;
//    button.clf_height = 50;
//    CGFloat maxWidth = LFscreenW - 30;
//    CGFloat maxHeight = 180-50;
    
    return CGRectMake( [self getRandomNumber:10 to:LFscreenW-30], [self getRandomNumber:10 to:150],
                      30, 50);
}
//-(AVAudioPlayer *)player{
//    
//    if (_player == nil) {
//        
//        NSError *error = nil;
//          NSURL *fileURL = [[NSBundle mainBundle]URLForResource:@"diamond" withExtension:@".mp3"];
//        _player = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:&error];
//        
//        _player.volume = 1.0;
//        
//        _player.delegate = self;
//        
//        if (error) {
//            
//            NSLog(@"player error:%@",error);
//            
//        }
//        
//    }
//    
//    NSLog(@"play");
//    
//    return _player;
//    
//}
//
//


-(void)clickBgBtClick:(UIButton*)bt{
   

    [WBAudioPlayerHelper shareInstance].delegate = self;
    [[WBAudioPlayerHelper shareInstance] stopAudio];
    //     NSURL *fileURL = [[NSBundle mainBundle]URLForResource:@"diamond" withExtension:@".mp3"];
    [[WBAudioPlayerHelper shareInstance] managerAudioWithLocalPath:@"diamond.mp3" playOrPause:YES];
    [[WBAudioPlayerHelper shareInstance] audioPlayer];
  
      HomeCandyListModel * candyListModel = _candyLists[bt.tag];
    NSMutableDictionary *  candycainDict = diction;
    candycainDict[@"token"] = loginToken;
     candycainDict[@"id"] = candyListModel.ID;
 
    LFLog(@"%@ %@",GAIN_DIAMOND,candycainDict);
      LFLog(@"%@ %@",GAIN_DIAMOND,candycainDict);
    // 领取紫钻的接口-----
    [YWRequestData gainPurpleStoneDict:candycainDict success:^(id responseObj) {
        NSMutableDictionary * candyDict = diction;
        candyDict[@"token"] = loginToken;
        candyDict[@"size"] = @"1";
        LFLog(@"%@",candyDict);
        
          [self.purpleStoneBt setTitle:[NSString stringWithFormat:@"紫钻：%lf",self.pleStone +=[candyListModel.drill doubleValue] ] forState:UIControlStateNormal];
      
        [UIView animateWithDuration:self.duration animations:^{
            bt.clf_y = -LFscreenH;
        }completion:^(BOOL finished) {
//            [YWRequestData homePageDict:candyDict success:^(id responseObj) {
//                
//             
//                //            [self.tellowStoneBt setTitle:[NSString stringWithFormat:@"算力：%@",responseObj[@"data"][@"compute"]]forState:UIControlStateNormal];
//                
//            }];
         
            [self.buttons removeObject:bt];
            [bt removeFromSuperview];
            
            if (self.buttons.count<=0) {
                if ( self.refreshCandyList) {
                    self.refreshCandyList();
                }
            }
        }];
    }];
//    [YWRequestData candycainDict:candycainDict success:^(id responseObj) {
//
//    }];

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//
//
//    AFURLSessionManager *manager1 = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
//    //        NSString *requestUrlStr = PAY_WX;
//    NSMutableURLRequest *req = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:CANDY_GAIN parameters:candycainDict error:nil];
//    // 设置postBody
////    NSData *data =[self.wishPoolModel.vcMsg dataUsingEncoding:NSUTF8StringEncoding];
////    [req setHTTPBody:data];
//    [[manager1 dataTaskWithRequest:req uploadProgress:^(NSProgress * _Nonnull uploadProgress) {
//
//    } downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
//
//    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
//
//        if (!error) {
//            if (self.buttons.count<=0) {
//                                if ( self.refreshCandyList) {
//                                    self.refreshCandyList();
//                                }
//                            }
//        }else{
//            LFLog(@"%@",error);
//        }
//
//    }]resume];
//
    
    
    
    
    
    
    
    
    
    
}
-(void)loadHomeCandyLis{
  
    NSMutableDictionary * candyDict = diction;
    candyDict[@"token"] = loginToken;
    candyDict[@"size"] = @"1";
    LFLog(@"%@",candyDict);
    [YWRequestData homePageDict:candyDict success:^(id responseObj) {
        NSString * pleStoneStr = [NSString stringWithFormat:@"%@",responseObj[@"data"][@"coin"] ] ;
        self.pleStone = [pleStoneStr doubleValue];
        [self.purpleStoneBt setTitle:[NSString stringWithFormat:@"紫钻：%@",responseObj[@"data"][@"coin"]]forState:UIControlStateNormal];
        [self.tellowStoneBt setTitle:[NSString stringWithFormat:@"算力：%@",responseObj[@"data"][@"compute"]]forState:UIControlStateNormal];
    
    }];
    
}
- (BOOL)frameIntersects:(CGRect)frame {
    for (UIButton *label in self.buttons) {
        if (CGRectIntersectsRect(frame, label.frame)) {
            return YES;
        }
    }
    return NO;
}
+(instancetype)loadNameBCHomeTopViewXib {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}
-(int)getRandomNumber:(int)from to:(int)to
{
    return (int)(from + (arc4random() % (to - from + 1)));
}
-(void)dealloc{
    [self.timer hyb_invalidate];
}
@end
