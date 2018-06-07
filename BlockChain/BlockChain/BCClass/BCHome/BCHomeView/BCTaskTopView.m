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

@property(nonatomic,strong) PlatTaskLogModel *invitationModel;
@property(nonatomic,strong) PlatTaskLogModel *loginTaskLogModel;
@property(nonatomic,strong) PlatTaskLogModel *tbcModel;
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
-(void)setImgs:(NSMutableArray *)imgs{
      self.cycleScrollView.imageURLStringsGroup = imgs;
}
-(void)setPlatTaskLogModels:(NSMutableArray *)platTaskLogModels{
    LFLog(@"%@",platTaskLogModels);
    for (PlatTaskLogModel * platTaskLogModel in platTaskLogModels) {
        if ([platTaskLogModel.taskId isEqualToString:@"1011"]) {//邀请好友
            self.invitationModel = platTaskLogModel;
            self.invitationLb.text =  platTaskLogModel.taskName;
            self.invitationStrenthLb.text =  platTaskLogModel.taskDesc;
            if ([platTaskLogModel.status isEqualToString:@"0"]) { //status;//0时没完成任务，1 时完成任务
                [self.invitationStrenthBt setBackgroundColor:[SVGloble colorWithHexString:@"#C692E1"]];
                 [self.invitationStrenthBt setTitle:[NSString stringWithFormat:@"+%@算力",platTaskLogModel.prizeCompute] forState:UIControlStateNormal];
                [self.invitationStrenthBt layercornerRadius:11];
                  self.invitationStrenthBt.selected = NO;
            }else if([platTaskLogModel.status isEqualToString:@"1"]){
                [self.invitationStrenthBt setBackgroundColor:[UIColor whiteColor]];
                [self.invitationStrenthBt setImage:[UIImage imageNamed:@"完成"] forState:UIControlStateNormal];
//                [self.invitationStrenthBt layercornerRadius:11];
                  self.invitationStrenthBt.selected = YES;
                  [self.invitationStrenthBt setTitle:@"已完成" forState:UIControlStateNormal];
            }
           
        }else if([platTaskLogModel.taskId isEqualToString:@"1012"]) {//每日登录,
              self.loginTaskLogModel= platTaskLogModel;
            self.dayLoginLb.text =  platTaskLogModel.taskName;
            self.dayLoginStrengthLb.text =  platTaskLogModel.taskDesc;
            if ([platTaskLogModel.status isEqualToString:@"0"]) { //status;//0时没完成任务，1 时完成任务
                [self.dayLoginStrengthBt setBackgroundColor:[SVGloble colorWithHexString:@"#C692E1"]];
                [self.dayLoginStrengthBt setTitle:[NSString stringWithFormat:@"+%@算力",platTaskLogModel.prizeCompute] forState:UIControlStateNormal];
                [self.dayLoginStrengthBt layercornerRadius:11];
                  self.dayLoginStrengthBt.selected = NO;
            }else if([platTaskLogModel.status isEqualToString:@"1"]){
                [self.dayLoginStrengthBt setBackgroundColor:[UIColor whiteColor]];
                [self.dayLoginStrengthBt setImage:[UIImage imageNamed:@"完成"] forState:UIControlStateNormal];
                 [self.dayLoginStrengthBt setTitle:@"已完成" forState:UIControlStateNormal];
                //                [self.invitationStrenthBt layercornerRadius:11];
                  self.dayLoginStrengthBt.selected = YES;
            }
           
        }else if([platTaskLogModel.taskId isEqualToString:@"1013"]) {//收取10次TBC,
            self. tbcModel = platTaskLogModel;
            self.tbcLb.text =  platTaskLogModel.taskName;
            self.tbcStrengthLb.text =  platTaskLogModel.taskDesc;
            if ([platTaskLogModel.status isEqualToString:@"0"]) { //status;//0时没完成任务，1 时完成任务
                [self.tbcStrengthBt setBackgroundColor:[SVGloble colorWithHexString:@"#C692E1"]];
                [self.tbcStrengthBt setTitle:[NSString stringWithFormat:@"+%@算力",platTaskLogModel.prizeCompute] forState:UIControlStateNormal];
                [self.tbcStrengthBt layercornerRadius:11];
                  self.tbcStrengthBt.selected = NO;
            }else if([platTaskLogModel.status isEqualToString:@"1"]){
                [self.tbcStrengthBt setBackgroundColor:[UIColor whiteColor]];
                [self.tbcStrengthBt setImage:[UIImage imageNamed:@"完成"] forState:UIControlStateNormal];
                //                [self.invitationStrenthBt layercornerRadius:11];
                  self.tbcStrengthBt.selected = YES;
                  [self.tbcStrengthBt setTitle:@"已完成" forState:UIControlStateNormal];
            }
           
        }
    }
    
}
- (IBAction)tbcTap:(id)sender {
    self.skipPage(self.tbcModel);
}
- (IBAction)loginTap:(id)sender {
     self.skipPage(self.loginTaskLogModel);
}
- (IBAction)invirationTap:(id)sender {
     self.skipPage(self.invitationModel);
}
@end
