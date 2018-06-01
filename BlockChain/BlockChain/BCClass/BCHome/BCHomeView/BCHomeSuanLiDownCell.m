//
//  BCHomeSuanLiDownCell.m
//  BlockChain
//
//  Created by Mac on 2018/5/25.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCHomeSuanLiDownCell.h"
#import "BCSuanLiJiLuModel.h"
@interface BCHomeSuanLiDownCell()
//顶部

@property (nonatomic, strong)UILabel *dengLuLable;
@property (nonatomic, strong)UILabel *timeLable;
@property (nonatomic, strong)UILabel *numberLable;
@property(nonatomic,strong)UIView *line1;
@property(nonatomic,strong)UIView *line2;


@end
@implementation BCHomeSuanLiDownCell

-(UIView *)line1{
    if (!_line1) {
        _line1 = [UIView getViewUserEnabled:NO backGroundColor:colorE5E7E9 tag:0 target:nil action:nil];
    }
    return _line1;
}
//-(UIView *)line2{
//    if (!_line2) {
//        _line2 = [UIView getViewUserEnabled:NO backGroundColor:colorE5E7E9 tag:0 target:nil action:nil];
//    }
//    return _line2;
//}


-(UILabel *)dengLuLable{
    if (!_dengLuLable) {
        _dengLuLable =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
        //                    [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_dengLuLable];
    }
    return _dengLuLable;
}
-(UILabel *)timeLable{
    if (!_timeLable) {
        _timeLable =[UILabel LabelWithTextColor:color717171 textFont:FONT(@"PingFangSC-Regular", SXRealValue(9)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
        //                    [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_timeLable];
    }
    return _timeLable;
}
-(UILabel *)numberLable{
    if (!_numberLable) {
        _numberLable =[UILabel LabelWithTextColor:colorB23AF6 textFont:FONT(@"PingFangSC-Regular", SXRealValue(12)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
        //                [Util roundBorderVi
        //    ew:0 border:1 color:[UIColor blackColor] view:_numberLable];
    }
    return _numberLable;
}


+(instancetype)getCellWithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //初始化
    static NSString * DetailArticleID = @"BCHomeSuanLiDownCell";
    BCHomeSuanLiDownCell *cell = [tableView dequeueReusableCellWithIdentifier:DetailArticleID];
    if (!cell) {
        cell = [[BCHomeSuanLiDownCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DetailArticleID];
        //选中颜色
        //[Util selectCellBackgroundColor:cell];
    };
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.dengLuLable];
        [self.contentView addSubview:self.timeLable];
        [self.contentView addSubview:self.numberLable];
        [self.contentView addSubview:self.line1];
//        [self.contentView addSubview:self.line2];
        
        
        [self.dengLuLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(16));
            make.bottom.mas_equalTo(self.contentView.mas_centerY).with.offset((SYRealValue(0)));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-50));
            make.height.mas_equalTo((SYRealValue(21)));
        }];
        
        [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(10));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-10));
            make.top.mas_equalTo(self.contentView.mas_top).with.offset((SYRealValue(0)));
            make.height.mas_equalTo((SYRealValue(0.6)));
        }];
//        [self.line2 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(10));
//            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-10));
//            make.bottom.mas_equalTo(self.contentView.mas_bottom).with.offset((SYRealValue(-0.6)));
//            make.height.mas_equalTo((SYRealValue(0.6)));
//        }];
        
        [self.timeLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(16));
            make.top.mas_equalTo(self.contentView.mas_centerY).with.offset((SYRealValue(0)));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-50));
            make.height.mas_equalTo((SYRealValue(15)));
        }];
        [self.numberLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-15));
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
        }];
        
    }
    return self;
}
-(void)setModel:(BCSuanLiJiLuListModel *)model{
    _model =model;
    if (model!=nil) {
        self.dengLuLable.text = model.remark;
        self.timeLable.text= model.createTime;
        self.numberLable.text= [NSString stringWithFormat:@"+%.1f",model.compute.floatValue];
    }
}
#pragma mark- 去官网
//-(void)guanWangBtnClick:(UIButton *)button{
//    if (self.delegate && [self.delegate respondsToSelector:@selector(gotoGuanWangBtnClick)]) {
//        [self.delegate gotoGuanWangBtnClick];
//    }
//}
@end
