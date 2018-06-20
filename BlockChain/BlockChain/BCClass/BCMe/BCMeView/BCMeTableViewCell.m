//
//  BCMeTableViewCell.m
//  BlockChain
//
//  Created by 吴博怡 on 2018/5/22.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCMeTableViewCell.h"
#import "BCTangGuoListMode.h"

@interface BCMeTableViewCell()
/** 充值icon*/
@property (nonatomic, strong)UIImageView *moneyImage;
/** 充值内容*/
@property (nonatomic, strong)UILabel *moneyName;
/** 顶部价格*/
@property (nonatomic, strong)UILabel *upPrice;
/** 底部价格*/
@property (nonatomic, strong)UILabel *downPrice;
/** 专家等级*/
@property (nonatomic, strong)UIButton *expertTitle;
/**分割线线*/
@property (nonatomic, strong)UIView *separatorLine;

@end
@implementation BCMeTableViewCell

-(UIImageView *)moneyImage{
    if (!_moneyImage) {
        _moneyImage = [[UIImageView alloc] init];
        //_myIcon.contentMode = UIViewContentModeScaleAspectFill;
        [Util roundBorderView:SXRealValue(23/2) border:0 color:nil view:_moneyImage];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_moneyImage];
    }
    return _moneyImage;
}
-(UILabel *)moneyName{
    if (!_moneyName) {
        _moneyName =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(14)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_moneyName];
    }
    return _moneyName;
}
-(UILabel *)upPrice{
    if (!_upPrice) {
        _upPrice =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(14)) textAlignment:NSTextAlignmentRight numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_upPrice];
    }
    return _upPrice;
}
-(UILabel *)downPrice{
    if (!_downPrice) {
        _downPrice =[UILabel LabelWithTextColor:colorD35353 textFont:FONT(@"PingFangSC-Regular", SXRealValue(11)) textAlignment:NSTextAlignmentRight numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_downPrice];
    }
    return _downPrice;
}
-(UIView *)separatorLine{
    if (!_separatorLine) {
        _separatorLine = [[UIView alloc] init];
        _separatorLine.backgroundColor =colorE5E7E9;
        //  [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_downView];
    }
    return _separatorLine;
}

+(instancetype)getCellWithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //初始化
    static NSString * DetailArticleID = @"BCMeTableViewCell";
    BCMeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DetailArticleID];
    if (!cell) {
        cell = [[BCMeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DetailArticleID];
        //选中颜色
        //[Util selectCellBackgroundColor:cell];
    };
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.moneyImage];
        [self.contentView addSubview:self.moneyName];
        [self.contentView addSubview:self.upPrice];
        [self.contentView addSubview:self.downPrice];
        [self.contentView addSubview:self.separatorLine];


        [self.moneyImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(19));
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.width.mas_equalTo(SXRealValue(23));
            make.height.mas_equalTo(SXRealValue(23));
        }];
        [self.moneyName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.moneyImage.mas_right).with.offset(SXRealValue(18));
            make.centerY.equalTo(self.contentView.mas_centerY);
        }];
        
        [self.upPrice mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.contentView.mas_centerY).with.offset(-1);
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-19));
            make.left.mas_equalTo(self.moneyName.mas_right).with.offset(SXRealValue(10));
        }];
        [self.downPrice mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.contentView.mas_centerY).with.offset(1);
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-19));
            make.left.mas_equalTo(self.moneyName.mas_right).with.offset(SXRealValue(10));
        }];
        [self.separatorLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(50));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(0));
            make.bottom.mas_equalTo(self.contentView.mas_bottom).with.offset((SYRealValue(-0.6)));
            make.height.mas_equalTo((SYRealValue(0.6)));
        }];
    }
    return self;
}
-(void)setModel:(BCTangGuoListMode *)model{
    _model =model;
    if (model!=nil) {
        [self.moneyImage sd_setImageWithURL:[NSURL URLWithString:model.icon] placeholderImage:[UIImage imageNamed:@"金币-2"]];
        self.moneyName.text =model.code;
        self.upPrice.text=[NSString stringWithFormat:@"%@",model.coin];
        if (model.rmb.wby_isPureInt) {//整型
            self.downPrice.text = [NSString stringWithFormat:@"≈¥%.1f",[model.rmb floatValue]];
        }else{
            self.downPrice.text = [NSString stringWithFormat:@"≈¥%@",model.rmb];
        }
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
