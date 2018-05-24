//
//  BCMeChangeMoneyDownCell.m
//  BlockChain
//
//  Created by Mac on 2018/5/24.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCMeChangeMoneyDownCell.h"
#import "BCMeChangeMoneyMode.h"

@interface BCMeChangeMoneyDownCell()

@property (nonatomic, strong)UILabel *tiXianLable;
@property (nonatomic, strong)UIView *line1;
@property (nonatomic, strong)UIView *line2;

@property (nonatomic, strong)UILabel *leftLable;
@property (nonatomic, strong)UILabel *rightLable;
@property (nonatomic, strong)UISlider *slider;

@property (nonatomic, strong)UILabel *hongLable;
@property (nonatomic, strong)UIButton *nextBtn;

@end

@implementation BCMeChangeMoneyDownCell

-(UISlider *)slider{
    if (!_slider) {
        _slider =[[UISlider alloc] init];
        _slider.minimumValue = 0.0;
        _slider.maximumValue = 100.0;
        _slider.value = 50;
        [_slider setContinuous:YES];
        //滑块条最小值处设置的图片，默认为nil
        _slider.minimumValueImage = [UIImage imageNamed:@"001.jpeg"];
        //滑块条最大值处设置的图片，默认为nil
        _slider.maximumValueImage = [UIImage imageNamed:@"001.jpeg"];
        //小于滑块当前值滑块条的颜色，默认为蓝色
        _slider.minimumTrackTintColor = colorC483FB;
        //大于滑块当前值滑块条的颜色，默认为白色
        _slider.maximumTrackTintColor = colorF0F0F0;
        //09.thumbTintColor : 当前滑块的颜色，默认为白色
        //_slider.thumbTintColor = [UIColor yellowColor];
        UIImage *imagea=[self OriginImage:[UIImage imageNamed:@"椭圆形"] scaleToSize:CGSizeMake(SXRealValue(23), SXRealValue(23))];
        [_slider setThumbImage:imagea forState:UIControlStateNormal];
        [_slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
       // [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_tiXianLable];
    }
    return _slider;
}

 /*
  对原来的图片的大小进行处理
  @param image 要处理的图片
  @param size  处理过图片的大小
  */
 -(UIImage *)OriginImage:(UIImage *)image scaleToSize:(CGSize)size
 {
     UIGraphicsBeginImageContext(size);
     [image drawInRect:CGRectMake(0,0, size.width, size.height)];
     UIImage *scaleImage=UIGraphicsGetImageFromCurrentImageContext();
     UIGraphicsEndImageContext();
     return scaleImage;
 }

-(UILabel *)tiXianLable{
    if (!_tiXianLable) {
        _tiXianLable =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(14)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_tiXianLable];
    }
    return _tiXianLable;
}
-(UIView *)line1{
    if (!_line1) {
        _line1 = [UIView getViewUserEnabled:NO backGroundColor:colorE5E7E9 tag:0 target:nil action:nil];
        //[Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_line1];
    }
    return _line1;
}
-(UIView *)line2{
    if (!_line2) {
        _line2 = [UIView getViewUserEnabled:NO backGroundColor:colorE5E7E9 tag:0 target:nil action:nil];
        //[Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_line1];
    }
    return _line2;
}
-(UILabel *)leftLable{
    if (!_leftLable) {
        _leftLable =[UILabel LabelWithTextColor:color808080 textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentCenter numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_leftLable];
    }
    return _leftLable;
}
-(UILabel *)rightLable{
    if (!_rightLable) {
        _rightLable =[UILabel LabelWithTextColor:color808080 textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentCenter numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_rightLable];
    }
    return _rightLable;
}
-(UILabel *)hongLable{
    if (!_hongLable) {
        _hongLable =[UILabel LabelWithTextColor:colorD35353 textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentCenter numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_hongLable];
    }
    return _hongLable;
}

-(UIButton *)nextBtn{
    if (!_nextBtn) {
        _nextBtn = [UIButton getButtonTitleColor:naverTextColor titleFont:FONT(@"PingFangSC-Semibold", SXRealValue(16)) backGroundColor:colorB378D5 target:self action:@selector(nextBtnClick:)];
        [_nextBtn  setHitEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -10)];//热区域
//        [Util roundBorderView:0 border:1 color:blackBColor view:_nextBtn];
    }
    return _nextBtn;
}




+(instancetype)getCellWithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //初始化
    static NSString * DetailArticleID = @"BCMeChangeMoneyDownCell";
    BCMeChangeMoneyDownCell *cell = [tableView dequeueReusableCellWithIdentifier:DetailArticleID];
    if (!cell) {
        cell = [[BCMeChangeMoneyDownCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DetailArticleID];
        //选中颜色
        //[Util selectCellBackgroundColor:cell];
    };
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

        [self.contentView addSubview:self.tiXianLable];
        [self.contentView addSubview:self.line1];
        [self.contentView addSubview:self.line2];
        [self.contentView addSubview:self.leftLable];
        [self.contentView addSubview:self.rightLable];
        [self.contentView addSubview:self.slider];
        [self.contentView addSubview:self.hongLable];
        [self.contentView addSubview:self.nextBtn];

        [self.tiXianLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(16));
            make.right.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(-15));
            make.top.mas_equalTo(self.contentView.mas_top).with.offset((SYRealValue(15)));
            make.width.mas_equalTo((SXRealValue(70)));
            make.height.mas_equalTo((SYRealValue(20)));
        }];
        
        [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(16));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(0));
            make.top.mas_equalTo(self.tiXianLable.mas_bottom).with.offset((SYRealValue(15)));
            make.height.mas_equalTo((SYRealValue(0.6)));
        }];
        
        [self.leftLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(16));
            make.top.mas_equalTo(self.line1.mas_bottom).with.offset((SYRealValue(15)));
            make.width.mas_equalTo((SXRealValue(20)));
            make.height.mas_equalTo((SYRealValue(20)));
        }];
        [self.rightLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-16));
            make.top.mas_equalTo(self.line1.mas_bottom).with.offset((SYRealValue(15)));
            make.width.mas_equalTo((SXRealValue(20)));
            make.height.mas_equalTo((SYRealValue(20)));
        }];
        [self.slider mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.leftLable.mas_right).with.offset(SXRealValue(33));
            make.right.mas_equalTo(self.rightLable.mas_left).with.offset(SXRealValue(-33));
            make.centerY.mas_equalTo(self.leftLable.mas_centerY);
        }];
        [self.hongLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(0));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(0));
            make.top.mas_equalTo(self.leftLable.mas_bottom).with.offset((SYRealValue(19)));
            make.height.mas_equalTo((SYRealValue(20)));
        }];
        [self.line2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.hongLable.mas_bottom).with.offset((SYRealValue(15)));
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(16));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(0));
            make.height.mas_equalTo((SYRealValue(0.6)));
        }];
    
        [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(15));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-15));
            make.top.mas_equalTo(self.line2.mas_bottom).with.offset((SYRealValue(21)));
            make.bottom.mas_equalTo(self.contentView.mas_bottom).with.offset((SYRealValue(-21)));
            make.height.mas_equalTo((SCREENWIDTH-(SYRealValue(30)))*40/346);
        }];

    }
    return self;
}
-(void)setModel:(BCMeChangeMoneyMode *)model{
    _model =model;
//    if (model!=nil) {
//
//    }else{
        //假数据
        self.tiXianLable.text = @"提现费用";
        self.leftLable.text= @"慢";
        self.rightLable.text =@"快";
        self.hongLable.text=[NSString stringWithFormat:@"%.7f Ether",0.1111123123];
        [self.nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
//    }
}
#pragma mark- 下一步按钮点击
-(void)nextBtnClick:(UIButton *)button{
    
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)sliderValueChanged:(UISlider *)slider{
    NSLog(@"slider value%f",slider.value);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
