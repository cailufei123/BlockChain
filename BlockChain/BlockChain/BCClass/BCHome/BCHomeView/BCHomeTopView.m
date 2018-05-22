//
//  BCHomeTopView.m
//  BlockChain
//
//  Created by 蔡路飞 on 2018/5/22.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCHomeTopView.h"
#import "BCVerticalBttton.h"
@interface BCHomeTopView()
@property (weak, nonatomic) IBOutlet UIView *horseLampbgView;
@property (weak, nonatomic) IBOutlet UILabel *purpleStoneLb;

@property (weak, nonatomic) IBOutlet UILabel *yellowStoneLb;
@property (weak, nonatomic) IBOutlet UIButton *hideSquareBt;
@property (weak, nonatomic) IBOutlet UIView *stoneBgView;
@property (weak, nonatomic) IBOutlet UIButton *calculationBt;
@property(nonatomic,strong)NSTimer * timer;
@property(nonatomic,assign)CGFloat  duration;
@property (weak, nonatomic) IBOutlet UISegmentedControl *samgent;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLyout;
@property (weak, nonatomic) IBOutlet UIButton *morebt;
@end
@implementation BCHomeTopView

-(void)awakeFromNib{
    [super awakeFromNib];
    self.duration = 1.5;
    self.autoresizesSubviews = NO;
    self.autoresizingMask = NO;
    [self createStone];
   
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
       
    }else if (sender.selectedSegmentIndex == 1){
       
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
 
    CGFloat buttonH = 50;
    CGFloat buttonW = 30;
    
    for (int i = 0; i < 10; i++) {
        CGFloat buttonStartX = [self getRandomNumber:10 to:LFscreenW-30];
        CGFloat butttonStartY = [self getRandomNumber:10 to:150];;
      
        BCVerticalBttton * bt = [[BCVerticalBttton alloc] init];
        [  self.stoneBgView  addSubview:bt];
        [bt setImage:[UIImage imageNamed:@"home_mineral_icon"] forState:UIControlStateNormal];
        [bt setTitle:@"0.001" forState:UIControlStateNormal];
        bt.titleLabel.font = [UIFont systemFontOfSize:10];
        bt.tag = i;
//        [bt setTitleColor:bCwhiteColor forState:UIControlStateNormal];
      
    
        [bt addTarget:self action:@selector(clickBgBtClick:) forControlEvents:UIControlEventTouchUpInside];
        bt.frame = CGRectMake(buttonStartX, butttonStartY, buttonW, buttonH);
        
    }
}
-(void)clickBgBtClick:(UIButton*)bt{
    [UIView animateWithDuration:self.duration animations:^{
       bt.clf_y = -LFscreenH;
    }completion:^(BOOL finished) {
        [bt removeFromSuperview];
    }];
    
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
