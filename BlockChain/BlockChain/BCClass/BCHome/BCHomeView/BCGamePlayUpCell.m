//
//  BCGamePlayUpCell.m
//  BlockChain
//
//  Created by Mac on 2018/6/4.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCGamePlayUpCell.h"
#import "BCGamePlayMode.h"

@interface BCGamePlayUpCell()

/** 雷鹿财务con*/
@property (nonatomic, strong)UIImageView *liLuCaiFuIcon;
@property (nonatomic, strong)UIView *line;

@property(nonatomic,strong)UILabel *lable1;
@property(nonatomic,strong)UILabel *lable2;
@property(nonatomic,strong)UILabel *lable3;



@end
@implementation BCGamePlayUpCell


-(UIImageView *)liLuCaiFuIcon{
    if (!_liLuCaiFuIcon) {
        _liLuCaiFuIcon = [[UIImageView alloc] init];
        //_myIcon.contentMode = UIViewContentModeScaleAspectFill;
        //[Util roundBorderView:SXRealValue(60/2) border:0 color:nil view:_myIcon];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_liLuCaiFuIcon];
    }
    return _liLuCaiFuIcon;
}


-(UIView *)line{
    if (!_line) {
        _line= [[UIView alloc] init];
    }
    return _line;
}
-(UILabel *)lable1{
    if (!_lable1) {
        _lable1 = [UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(15)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//            [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_lable1];
    }
    return _lable1;
}
-(UILabel *)lable2{
    if (!_lable2) {
        _lable2 = [UILabel LabelWithTextColor:color636161 textFont:FONT(@"PingFangSC-Regular", SXRealValue(12)) textAlignment:NSTextAlignmentLeft numberOfLines:0];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_lable2];
    }
    return _lable2;
}
-(UILabel *)lable3{
    if (!_lable3) {
        _lable3 = [UILabel LabelWithTextColor:color636161 textFont:FONT(@"PingFangSC-Regular", SXRealValue(12)) textAlignment:NSTextAlignmentLeft numberOfLines:2];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_lable3];
    }
    return _lable3;
}

+(instancetype)getCellWithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //初始化
    static NSString * DetailArticleID = @"BCGamePlayUpCell";
    BCGamePlayUpCell *cell = [tableView dequeueReusableCellWithIdentifier:DetailArticleID];
    if (!cell) {
        cell = [[BCGamePlayUpCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DetailArticleID];
        //选中颜色
        //[Util selectCellBackgroundColor:cell];
    };
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        [self.contentView addSubview:self.liLuCaiFuIcon];
        [self.contentView addSubview:self.lable1];
        [self.contentView addSubview:self.lable2];
        [self.contentView addSubview:self.lable3];


        [self.liLuCaiFuIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.contentView.mas_top).with.offset((SYRealValue(37)));
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(80));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-80));
            make.height.mas_equalTo((SCREEN_WIDTH-2*(SXRealValue(80)))*59/215);

        }];
    
        [self.lable1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(17));
            make.top.mas_equalTo(self.liLuCaiFuIcon.mas_bottom).with.offset((SYRealValue(37)));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-17));
            make.height.mas_equalTo((SYRealValue(22)));
        }];
        [self.lable2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(17));
            make.top.mas_equalTo(self.lable1.mas_bottom).with.offset((SYRealValue(15)));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-17));
        }];
        [self.lable3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(17));
            make.top.mas_equalTo(self.lable2.mas_bottom).with.offset((SYRealValue(30)));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-17));
            make.height.mas_equalTo((SYRealValue(40)));
            make.bottom.mas_equalTo(self.contentView.mas_bottom).with.offset((SYRealValue(-30)));
        }];
        
    }
    return self;
}
-(void)setModel:(BCGamePlayMode *)model{
    _model =model;
    if (model!=nil) {
        _liLuCaiFuIcon.image = [UIImage imageNamed:@"雷鹿财富logoc-2"];
        self.backgroundColor = naverTextColor;
        _lable1.text =@"什么是财富币？";
        _lable2.text = @"财富币LLMC(LeiLook Money Coin)是基于用户活动产生的奖励，可以用于雷鹿财富的消费与兑换等，可以在即将开放的糖果店兑换各种您喜爱的糖果。48小时不收取的财富币将停止产生。";
        _lable3.text =@"财富币总量有限，产量逐年减少，随着时间的推移获取难度越来越大，早起参与的用户更有优势。";
        
    }
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
