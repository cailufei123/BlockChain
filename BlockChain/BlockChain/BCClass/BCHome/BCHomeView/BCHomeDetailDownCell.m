//
//  BCHomeDetailTableViewCell.m
//  BlockChain
//
//  Created by Mac on 2018/5/25.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCHomeDetailDownCell.h"
#import "BCHomeDetailModel.h"

@interface BCHomeDetailDownCell()
//顶部

@property (nonatomic, strong)UILabel *biaoYuLable;
@property (nonatomic, strong)UILabel *biaoYu;
@property (nonatomic, strong)UILabel *faXingLable;
@property (nonatomic, strong)UILabel *faXing;
@property (nonatomic, strong)UILabel *faXingPriceLable;
@property (nonatomic, strong)UILabel *faXingPrice;
@property (nonatomic, strong)UILabel *guanWangLable;
//@property (nonatomic, strong)UIButton *guanWangBtn;
@property (nonatomic, strong)UILabel *guanWang;

@property(nonatomic,strong)UIView *line1;
@property(nonatomic,strong)UIView *line2;
@property(nonatomic,strong)UIView *line3;
@property(nonatomic,strong)UIView *line4;

@end
@implementation BCHomeDetailDownCell

-(UIView *)line1{
    if (!_line1) {
        _line1 = [UIView getViewUserEnabled:NO backGroundColor:nil tag:0 target:nil action:nil];
    }
    return _line1;
}
-(UIView *)line2{
    if (!_line2) {
        _line2 = [UIView getViewUserEnabled:NO backGroundColor:nil tag:0 target:nil action:nil];
    }
    return _line2;
}
-(UIView *)line3{
    if (!_line3) {
        _line3 = [UIView getViewUserEnabled:NO backGroundColor:nil tag:0 target:nil action:nil];
    }
    return _line3;
}
-(UIView *)line4{
    if (!_line4) {
        _line4 = [UIView getViewUserEnabled:NO backGroundColor:nil tag:0 target:nil action:nil];
    }
    return _line4;
}

-(UILabel *)biaoYuLable{
    if (!_biaoYuLable) {
        _biaoYuLable =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(15)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//            [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_biaoYuLable];
    }
    return _biaoYuLable;
}
-(UILabel *)biaoYu{
    if (!_biaoYu) {
        _biaoYu =[UILabel LabelWithTextColor:color484848 textFont:FONT(@"PingFangSC-Regular", SXRealValue(12)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_biaoYu];
    }
    return _biaoYu;
}
-(UILabel *)faXingLable{
    if (!_faXingLable) {
        _faXingLable =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(15)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_faXingLable];
    }
    return _faXingLable;
}
-(UILabel *)faXing{
    if (!_faXing) {
        _faXing =[UILabel LabelWithTextColor:color484848 textFont:FONT(@"PingFangSC-Regular", SXRealValue(12)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_faXing];
    }
    return _faXing;
}
-(UILabel *)faXingPriceLable{
    if (!_faXingPriceLable) {
        _faXingPriceLable =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(15)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_faXingPriceLable];
    }
    return _faXingPriceLable;
}
-(UILabel *)faXingPrice{
    if (!_faXingPrice) {
        _faXingPrice =[UILabel LabelWithTextColor:color484848 textFont:FONT(@"PingFangSC-Regular", SXRealValue(12)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_faXingPrice];
    }
    return _faXingPrice;
}
-(UILabel *)guanWangLable{
    if (!_guanWangLable) {
        _guanWangLable =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(15)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_guanWangLable];
    }
    return _guanWangLable;
}
-(UILabel *)guanWang{
    if (!_guanWang) {
        _guanWang =[UILabel LabelWithTextColor:color506CCD textFont:FONT(@"PingFangSC-Regular", SXRealValue(12)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//                [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_guanWang];
        _guanWang.userInteractionEnabled =YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(guanWangBtnClick)];
        [_guanWang addGestureRecognizer:tap];
    }
    return _guanWang;
}



+(instancetype)getCellWithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //初始化
    static NSString * DetailArticleID = @"BCHomeDetailDownCell";
    BCHomeDetailDownCell *cell = [tableView dequeueReusableCellWithIdentifier:DetailArticleID];
    if (!cell) {
        cell = [[BCHomeDetailDownCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DetailArticleID];
        //选中颜色
        //[Util selectCellBackgroundColor:cell];
    };
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.biaoYuLable];
        [self.contentView addSubview:self.biaoYu];
        [self.contentView addSubview:self.faXingLable];
        [self.contentView addSubview:self.faXing];
        [self.contentView addSubview:self.faXingPriceLable];
        [self.contentView addSubview:self.faXingPrice];
        [self.contentView addSubview:self.guanWangLable];
//        [self.contentView addSubview:self.guanWangBtn];
        [self.contentView addSubview:self.guanWang];
        
        [self.contentView addSubview:self.line1];
        [self.contentView addSubview:self.line2];
        [self.contentView addSubview:self.line3];
        [self.contentView addSubview:self.line4];
        
        [self.biaoYuLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(16));
            make.top.mas_equalTo(self.contentView.mas_top).with.offset((SYRealValue(11)));
            make.width.mas_equalTo((SXRealValue(65)));
            make.height.mas_equalTo((SYRealValue(22)));
        }];
        [self.biaoYu mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.biaoYuLable.mas_right).with.offset(SXRealValue(28));
            make.bottom.mas_equalTo(self.biaoYuLable.mas_bottom).with.offset((SYRealValue(0)));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-50));
            make.height.mas_equalTo((SYRealValue(20)));
        }];
        [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(0));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(0));
            make.top.mas_equalTo(self.biaoYuLable.mas_bottom).with.offset((SYRealValue(11)));
            make.height.mas_equalTo((SYRealValue(0.6)));
        }];
        [self.faXingLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(16));
            make.top.mas_equalTo(self.line1.mas_bottom).with.offset((SYRealValue(11)));
            make.width.mas_equalTo((SXRealValue(65)));
            make.height.mas_equalTo((SYRealValue(22)));
        }];
        [self.faXing mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.faXingLable.mas_right).with.offset(SXRealValue(28));
            make.centerY.mas_equalTo(self.faXingLable.mas_centerY);
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-50));
            make.height.mas_equalTo((SYRealValue(20)));
        }];
        [self.line2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(0));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(0));
            make.top.mas_equalTo(self.faXingLable.mas_bottom).with.offset((SYRealValue(11)));
            make.height.mas_equalTo((SYRealValue(0.6)));
        }];
        [self.faXingPriceLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(16));
            make.top.mas_equalTo(self.line2.mas_bottom).with.offset((SYRealValue(11)));
            make.width.mas_equalTo((SXRealValue(65)));
            make.height.mas_equalTo((SYRealValue(22)));
        }];
        [self.faXingPrice mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.faXingPriceLable.mas_right).with.offset(SXRealValue(28));
            make.centerY.mas_equalTo(self.faXingPriceLable.mas_centerY);
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-50));
            make.height.mas_equalTo((SYRealValue(20)));
        }];
        [self.line3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(0));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(0));
            make.top.mas_equalTo(self.faXingPriceLable.mas_bottom).with.offset((SYRealValue(11)));
            make.height.mas_equalTo((SYRealValue(0.6)));
        }];
        [self.guanWangLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(16));
            make.top.mas_equalTo(self.line3.mas_bottom).with.offset((SYRealValue(11)));
            make.width.mas_equalTo((SXRealValue(65)));
            make.height.mas_equalTo((SYRealValue(22)));
        }];
//        [self.guanWangBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(self.guanWangLable.mas_right).with.offset(SXRealValue(20));
//            make.centerY.mas_equalTo(self.guanWangLable.mas_centerY);
//            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-50));
//            make.height.mas_equalTo((SYRealValue(20)));
//        }];
        [self.guanWang mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.guanWangLable.mas_right).with.offset(SXRealValue(28));
            make.centerY.mas_equalTo(self.guanWangLable.mas_centerY);
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-20));
            make.height.mas_equalTo((SYRealValue(20)));
        }];
        [self.line4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(0));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(0));
            make.top.mas_equalTo(self.guanWangLable.mas_bottom).with.offset((SYRealValue(11)));
            make.height.mas_equalTo((SYRealValue(0.6)));
            make.bottom.mas_equalTo(self.contentView.mas_bottom).with.offset((SYRealValue(0)));
        }];
        
    }
    return self;
}
-(void)setModel:(BCHomeDetailModel *)model{
    _model = model;
    if (_model!=nil) {
        self.biaoYuLable.text = @"标语";
        self.biaoYu.text=  model.partnerInfo.slogan;
        self.faXingLable.text= @"发行总量";
        self.faXing.text= [NSString stringWithFormat:@"%@枚", model.partnerInfo.pubCount];
        self.faXingPriceLable.text= @"发行价格";
        self.faXingPrice.text= [NSString stringWithFormat:@"1ETH=%@%@",model.partnerInfo.price,model.partnerInfo.code];
        self.guanWangLable.text= @"官方网站";
        self.guanWang.text =model.partnerInfo.site;
        _line1.backgroundColor =colorE5E7E9;
        _line2.backgroundColor =colorE5E7E9;
        _line3.backgroundColor =colorE5E7E9;
        _line4.backgroundColor =colorE5E7E9;
    }    
}
#pragma mark- 去官网
-(void)guanWangBtnClick{
    NSString *path = _model.partnerInfo.site;
    
    if([path hasPrefix:@"http://"]){//有链接
        path = [NSString stringWithFormat:@"%@",path];
    }else{
        path = [NSString stringWithFormat:@"http://%@",path];
    }
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:path] options:@{UIApplicationOpenURLOptionUniversalLinksOnly: @NO} completionHandler:^(BOOL success) {
        
    }];
    if (self.delegate && [self.delegate respondsToSelector:@selector(gotoGuanWangBtnClick)]) {
        [self.delegate gotoGuanWangBtnClick];
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
