//
//  BCTaskTopView.m
//  BlockChain
//
//  Created by 蔡路飞 on 2018/5/23.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCTaskTopView.h"
#import "SDCycleScrollView.h"
@interface BCTaskTopView()<SDCycleScrollViewDelegate,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *dayLoginLb;
@property (weak, nonatomic) IBOutlet UILabel *dayLoginStrengthLb;
@property (weak, nonatomic) IBOutlet UIButton *dayLoginStrengthBt;

@property (weak, nonatomic) IBOutlet UILabel *tbcLb;
@property (weak, nonatomic) IBOutlet UILabel *tbcStrengthLb;
@property (weak, nonatomic) IBOutlet UIButton *tbcStrengthBt;
@property (weak, nonatomic) IBOutlet UILabel *invitationLb;

@property (weak, nonatomic) IBOutlet UILabel *invitationStrenthLb;
@property (weak, nonatomic) IBOutlet UIButton *invitationStrenthBt;
@property(nonatomic,strong) SDCycleScrollView *cycleScrollView;
@end
@implementation BCTaskTopView
-(void)awakeFromNib{
    [super awakeFromNib];
    self.autoresizesSubviews = NO;
    self.autoresizingMask = NO;
    [self setbannerImagView];
//     self.cycleScrollView.imageURLStringsGroup = nil;
}

-(void)setbannerImagView{
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, LFscreenW, 150) delegate:self placeholderImage:[UIImage imageNamed:@"banner默认"]];
    self.cycleScrollView = cycleScrollView;
    cycleScrollView.delegate = self;
    cycleScrollView. bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    cycleScrollView.currentPageDotColor = assistColor; // 自定义分页控件小圆标颜色
    cycleScrollView.pageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    [self.imgView addSubview:cycleScrollView];
}
//- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
//{
//
//}
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
  
}
+(instancetype)loadNameBCTaskTopViewViewXib {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}
@end
