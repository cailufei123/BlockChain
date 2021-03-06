//
//  BCHomeSuanLiUpCell.m
//  BlockChain
//
//  Created by Mac on 2018/5/25.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCHomeSuanLiUpCell.h"
#import "BCSuanLiJiLuModel.h"

@interface BCHomeSuanLiUpCell()
//顶部

@property (nonatomic, strong)UIView *bigView;
@property (nonatomic, strong)UIImageView *bigIcon;

@property (nonatomic, strong)UIView *upBigView;

@property (nonatomic, strong)UILabel *suLiLable;
@property (nonatomic, strong)UILabel *suLiNumber;
@property (nonatomic, strong)UIImageView *suLiImage;

@property (nonatomic, strong)UILabel *smLabel;
@property (nonatomic, strong)UILabel *suLiMessage;

@property (nonatomic, strong)UIView *downView;
@property(nonatomic,strong)CAGradientLayer *gradientLayer;
@end
@implementation BCHomeSuanLiUpCell


//最大高度
#define HeaderViewHeight   ((SYRealValue(67+33+23))+kTopHeight+(SYRealValue(235)))  //顶部view高度
//顶部总体高度
#define upBigViewHeight   ((SYRealValue(197)))
//顶部总体高度


-(UIView *)bigView{
    if (!_bigView) {
        _bigView = [[UIView alloc] init];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_bigView];
    }
    return _bigView;
}
-(UIImageView *)suLiImage{
    if (!_suLiImage) {
        _suLiImage = [[UIImageView alloc] init];
        //_myIcon.contentMode = UIViewContentModeScaleAspectFill;
//                [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_suLiImage];
    }
    return _suLiImage;
}
-(UIImageView *)bigIcon{
    if (!_bigIcon) {
        _bigIcon = [[UIImageView alloc] init];
        _bigIcon.contentMode = UIViewContentModeScaleAspectFit;
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_bigIcon];
    }
    return _bigIcon;
}

-(UIView *)upBigView{
    if (!_upBigView) {
        _upBigView = [[UIView alloc] init];
//      [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_upBigView];
    }
    return _upBigView;
}

-(UILabel *)suLiLable{
    if (!_suLiLable) {
        _suLiLable =[UILabel LabelWithTextColor:colorDEC0FF textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentCenter numberOfLines:1];
//            [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_suLiLable];
    }
    return _suLiLable;
}
-(UILabel *)suLiNumber{
    if (!_suLiNumber) {
        _suLiNumber =[UILabel LabelWithTextColor:naverTextColor textFont:FONT(@"PingFangSC-Semibold", SXRealValue(47)) textAlignment:NSTextAlignmentCenter numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_suLiNumber];
    }
    return _suLiNumber;
}
-(UILabel *)smLabel{
    if (!_smLabel) {
        _smLabel =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(14)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_smLabel];
    }
    return _smLabel;
}
-(UILabel *)suLiMessage{
    if (!_suLiMessage) {
        _suLiMessage =[UILabel LabelWithTextColor:color636161 textFont:FONT(@"PingFangSC-Regular", SXRealValue(12)) textAlignment:NSTextAlignmentLeft numberOfLines:0];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_suLiMessage];
    }
    return _suLiMessage;
}
-(UIView *)downView{
    if (!_downView) {
        _downView = [[UIView alloc] init];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_downView];
    }
    return _downView;
}



+(instancetype)getCellWithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //初始化
    static NSString * DetailArticleID = @"BCHomeSuanLiUpCell";
    BCHomeSuanLiUpCell *cell = [tableView dequeueReusableCellWithIdentifier:DetailArticleID];
    if (!cell) {
        cell = [[BCHomeSuanLiUpCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DetailArticleID];
        //选中颜色
        //[Util selectCellBackgroundColor:cell];
    };
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
       
        //初始化CAGradientlayer对象，使它的大小为UIView的大小
        [self.contentView addSubview:self.bigView];
        [self.contentView addSubview:self.upBigView];
        [self.upBigView addSubview:self.suLiImage];
        [self.upBigView addSubview:self.suLiLable];
        [self.upBigView addSubview:self.suLiNumber];
        
        [self.downView addSubview:self.smLabel];
        [self.downView addSubview:self.suLiMessage];
        [self.contentView addSubview:self.downView];
        
        
        [self.bigView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.contentView.mas_top).with.offset(0);
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(0);
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(0);
            make.height.mas_equalTo(upBigViewHeight+kTopHeight);
        }];
        [self.upBigView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.contentView.mas_top).with.offset(kTopHeight);
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(0);
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(0);
            make.height.mas_equalTo(upBigViewHeight);
        }];
        
        [self.suLiLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.upBigView.mas_top).with.offset(0);
            make.centerX.equalTo(self.upBigView.mas_centerX);
            make.width.mas_equalTo(SCREENWIDTH);
            make.height.mas_equalTo((SYRealValue(20)));
        }];
       
        [self.suLiNumber mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.upBigView.mas_left).with.offset(SXRealValue(0));
            make.right.mas_equalTo(self.upBigView.mas_right).with.offset(SXRealValue(0));
            make.top.mas_equalTo(self.suLiLable.mas_bottom).with.offset(0);
            make.centerX.equalTo(self.upBigView.mas_centerX);
            make.height.mas_equalTo((SYRealValue(68)));
        }];
        
        [self.suLiImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.suLiNumber.mas_bottom).with.offset(0);
            make.left.mas_equalTo(self.upBigView.mas_left).with.offset(SXRealValue(0));
            make.right.mas_equalTo(self.upBigView.mas_right).with.offset(SXRealValue(0));
            make.bottom.mas_equalTo(self.upBigView.mas_bottom).with.offset(SXRealValue(0));
        }];
        [self.downView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(0);
            make.top.mas_equalTo(self.suLiImage.mas_bottom).with.offset(0);
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(0);
            make.bottom.mas_equalTo(self.contentView.mas_bottom).with.offset(0);

        }];

        [self.smLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.downView.mas_left).with.offset(SXRealValue(18));
            make.right.mas_equalTo(self.downView.mas_right).with.offset(SXRealValue(-18));
            make.top.mas_equalTo(self.downView.mas_top).with.offset((SYRealValue(14)));
            make.height.mas_equalTo((SYRealValue(23)));
        }];
        [self.suLiMessage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.downView.mas_left).with.offset(SXRealValue(18));
            make.right.mas_equalTo(self.downView.mas_right).with.offset(SXRealValue(-18));
            make.top.mas_equalTo(self.smLabel.mas_bottom).with.offset((SYRealValue(17)));
            make.bottom.mas_equalTo(self.downView.mas_bottom).with.offset((SYRealValue(-17)));
        }];

    }
    return self;
}
-(void)setModel:(BCSuanLiJiLuModel *)model{
    _model =model;
    if (model!=nil) {
        self.suLiImage.image =[UIImage imageNamed:@"brokenline_bg"];
        self.suLiLable.text = @"当前算力";
        self.suLiNumber.text= [NSString stringWithFormat:@"%.1f",model.compute.floatValue];
        self.smLabel.text= @"什么是算力";
        self.suLiMessage.text= @"算力是用户获取财富币的影响因子，同一时间内算力越高，获得的财富币越多，后续的版本中算力也将关系到用户等级以及相应的用户权限";
        //顶部
        [self.bigView gradientFreme:CGRectMake(0, 0, SCREENWIDTH, upBigViewHeight+kTopHeight) startColor:color5E4FC9 endColor:colorC483FB];
        [self layoutIfNeeded];
        [self setNeedsLayout];
//        NSLog(@"bigView===%@",NSStringFromCGRect(self.bigView.frame));
//        NSLog(@"suLiLable==%@",NSStringFromCGRect(self.suLiLable.frame));
//        NSLog(@"suLiNumber==%@",NSStringFromCGRect(self.suLiNumber.frame));
//        NSLog(@"1111==%f",self.bigView.xmg_bottom);
//        NSLog(@"2222==%f",self.suLiNumber.xmg_bottom);
//        NSLog(@"3333==%f",self.bigView.xmg_bottom+self.suLiNumber.xmg_bottom+(SYRealValue(17)));
        //计算出高度
        //model.UpBigHeight = self.bigView.xmg_bottom+self.suLiNumber.xmg_bottom+(SYRealValue(17));
    }
}


#pragma mark- 去官网
//-(void)guanWangBtnClick:(UIButton *)button{
//    if (self.delegate && [self.delegate respondsToSelector:@selector(gotoGuanWangBtnClick)]) {
//        [self.delegate gotoGuanWangBtnClick];
//    }
//}
@end
