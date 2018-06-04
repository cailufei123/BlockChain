//
//  BCGamePlayDownCell.m
//  BlockChain
//
//  Created by Mac on 2018/6/4.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCGamePlayDownCell.h"

#import "BCGamePlayMode.h"

@interface BCGamePlayDownCell()

@property(nonatomic,strong)UILabel *lable1;
@property(nonatomic,strong)UILabel *lable2;
@property (nonatomic, strong)UIView *line;

@end

@implementation BCGamePlayDownCell

-(UIView *)line{
    if (!_line) {
        _line= [[UIView alloc] init];
    }
    return _line;
}
-(UILabel *)lable1{
    if (!_lable1) {
        _lable1 = [UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(15)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_lable1];
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



+(instancetype)getCellWithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //初始化
    static NSString * DetailArticleID = @"BCGamePlayDownCell";
    BCGamePlayDownCell *cell = [tableView dequeueReusableCellWithIdentifier:DetailArticleID];
    if (!cell) {
        cell = [[BCGamePlayDownCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DetailArticleID];
        //选中颜色
        //[Util selectCellBackgroundColor:cell];
    };
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        //初始化CAGradientlayer对象，使它的大小为UIView的大小
        [self.contentView addSubview:self.lable1];
        [self.contentView addSubview:self.lable2];
        [self.contentView addSubview:self.line];

        
        [self.lable1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(17));
            make.top.mas_equalTo(self.contentView.mas_top).with.offset((SYRealValue(27)));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-17));
            make.height.mas_equalTo((SYRealValue(22)));
        }];
        [self.lable2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(17));
            make.top.mas_equalTo(self.lable1.mas_bottom).with.offset((SYRealValue(15)));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-17));
            make.bottom.mas_equalTo(self.contentView.mas_bottom).with.offset((SYRealValue(-30)));
        }];
        [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(0));
            make.top.mas_equalTo(self.contentView.mas_top).with.offset((SYRealValue(0)));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(0));
            make.height.mas_equalTo((SYRealValue(0.6)));
        }];
        
  
    }
    return self;
}
-(void)setModel:(BCGamePlayMode *)model{
    _model =model;
    if (model!=nil) {
        self.lable1.text = model.text1;
        self.lable2.text = model.text2;
        self.line.backgroundColor = colorE5E7E9;
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
