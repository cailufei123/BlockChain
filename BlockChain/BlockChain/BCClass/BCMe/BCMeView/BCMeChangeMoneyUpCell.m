//
//  BCMeChangeMoneyUpCell.m
//  BlockChain
//
//  Created by Mac on 2018/5/24.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCMeChangeMoneyUpCell.h"
#import "BCMeChangeMoneyMode.h"

@interface BCMeChangeMoneyUpCell()

@property (nonatomic, strong)UILabel *dizhiLable;//收款人地址
@property (nonatomic, strong)UILabel *dizhi;
@property (nonatomic, strong)UIView *line1;
@property (nonatomic, strong)UIView *line2;
@property (nonatomic, strong)UIView *line3;
@property (nonatomic, strong)UILabel *priceLable;//收款金额
@property (nonatomic, strong)UILabel *price;
@property (nonatomic, strong)UILabel *beiZhuLable;
@property (nonatomic, strong)UILabel *beiZhu;
@property (nonatomic, strong)UIButton *moreBtn;

@end

@implementation BCMeChangeMoneyUpCell

-(UILabel *)dizhiLable{
    if (!_dizhiLable) {
        _dizhiLable =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_dizhiLable];
    }
    return _dizhiLable;
}
-(UILabel *)dizhi{
    if (!_dizhi) {
        _dizhi =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentCenter numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_dizhi];
    }
    return _dizhi;
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
-(UIView *)line3{
    if (!_line3) {
        _line3 = [UIView getViewUserEnabled:NO backGroundColor:colorE5E7E9 tag:0 target:nil action:nil];
        //[Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_line1];
    }
    return _line3;
}
-(UILabel *)priceLable{
    if (!_priceLable) {
        _priceLable =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_priceLable];
    }
    return _priceLable;
}
-(UILabel *)price{
    if (!_price) {
        _price =[UILabel LabelWithTextColor:colorEE3517 textFont:FONT(@"PingFangSC-Regular", SXRealValue(16)) textAlignment:NSTextAlignmentRight numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_price];
    }
    return _price;
}
-(UILabel *)beiZhuLable{
    if (!_beiZhuLable) {
        _beiZhuLable =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_beiZhuLable];
    }
    return _beiZhuLable;
}
-(UILabel *)beiZhu{
    if (!_beiZhu) {
        _beiZhu =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentRight numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_beiZhu];
    }
    return _beiZhu;
}

-(UIButton *)moreBtn{
    if (!_moreBtn) {
        _moreBtn = [UIButton getButtonTitleColor:naverTextColor titleFont:FONT(@"PingFangSC-Semibold", SXRealValue(16)) backGroundColor:nil target:self action:@selector(moreBtnClick:)];
        [_moreBtn  setHitEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -10)];//热区域
//        [Util roundBorderView:0 border:1 color:blackBColor view:_moreBtn];
    }
    return _moreBtn;
}

+(instancetype)getCellWithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //初始化
    static NSString * DetailArticleID = @"BCMeChangeMoneyUpCell";
    BCMeChangeMoneyUpCell *cell = [tableView dequeueReusableCellWithIdentifier:DetailArticleID];
    if (!cell) {
        cell = [[BCMeChangeMoneyUpCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DetailArticleID];
        //选中颜色
        //[Util selectCellBackgroundColor:cell];
    };
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.dizhiLable];
        [self.contentView addSubview:self.dizhi];
        [self.contentView addSubview:self.line1];
        [self.contentView addSubview:self.line2];
        [self.contentView addSubview:self.line3];
        [self.contentView addSubview:self.priceLable];
        [self.contentView addSubview:self.price];
        [self.contentView addSubview:self.beiZhuLable];
        [self.contentView addSubview:self.beiZhu];
        [self.contentView addSubview:self.moreBtn];
        
        
        [self.dizhiLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(16));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-16));
            make.top.mas_equalTo(self.contentView.mas_top).with.offset((SYRealValue(12)));
            make.height.mas_equalTo((SYRealValue(20)));
        }];

        [self.dizhi mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(15));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-10));
            make.top.mas_equalTo(self.dizhiLable.mas_bottom).with.offset((SYRealValue(17)));
            make.height.mas_equalTo((SYRealValue(20)));
        }];
        [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(15));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-15));
            make.top.mas_equalTo(self.dizhi.mas_bottom).with.offset((SYRealValue(17)));
            make.height.mas_equalTo((SYRealValue(0.6)));
        }];
        [self.priceLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(15));
            make.right.mas_equalTo(self.price.mas_left).with.offset(SXRealValue(-10));
            make.top.mas_equalTo(self.line1.mas_bottom).with.offset((SYRealValue(12)));
            make.width.mas_equalTo((SXRealValue(70)));
            make.height.mas_equalTo((SYRealValue(20)));
        }];
        [self.price mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-18));
            make.centerY.mas_equalTo(self.priceLable.mas_centerY);
            make.height.mas_equalTo((SYRealValue(22)));
        }];
        [self.line2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(15));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-15));
            make.top.mas_equalTo(self.priceLable.mas_bottom).with.offset((SYRealValue(12)));
            make.height.mas_equalTo((SYRealValue(0.6)));
        }];
        [self.beiZhuLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(15));
            make.top.mas_equalTo(self.line2.mas_bottom).with.offset((SYRealValue(13)));
            make.width.mas_equalTo((SXRealValue(70)));
            make.height.mas_equalTo((SYRealValue(20)));
        }];
        [self.beiZhu mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.beiZhuLable.mas_right).with.offset(SXRealValue(10));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-26));
            make.centerY.mas_equalTo(self.beiZhuLable.mas_centerY);
            make.height.mas_equalTo((SYRealValue(20)));
        }];
        [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-13));
            make.centerY.mas_equalTo(self.beiZhuLable.mas_centerY);
            make.width.mas_equalTo((SXRealValue(10)));
            make.height.mas_equalTo((SYRealValue(15)));
        }];
        [self.line3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(15));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-15));
            make.top.mas_equalTo(self.beiZhuLable.mas_bottom).with.offset((SYRealValue(13)));
            make.height.mas_equalTo((SYRealValue(0.6)));
            make.bottom.mas_equalTo(self.contentView.mas_bottom).with.offset((SYRealValue(-0.6)));
        }];
    }
    return self;
}
-(void)setModel:(BCMeChangeMoneyMode *)model{
    _model =model;
    if (model!=nil) {
        
    }else{
        //假数据
        self.dizhiLable.text = @"收款人钱包地址";
        self.dizhi.text= @"qwerqwerqfasdfasdf23rweqrwqerwqerqwerqwerqwerqwerqwer";
        self.priceLable.text =@"转账金额";
        self.price.text=[NSString stringWithFormat:@"¥ %.2f",55.1111123123];
        self.beiZhuLable.text= @"备注";
        self.beiZhu.text =@"八大速度发斯蒂芬阿斯蒂芬阿斯蒂芬阿斯蒂芬";
        [self.moreBtn setImage:[UIImage imageNamed:@"right_arrow"] forState:UIControlStateNormal];
    }
}
#pragma mark -跟多按钮
-(void)moreBtnClick:(UIButton *)button{
    
    
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
