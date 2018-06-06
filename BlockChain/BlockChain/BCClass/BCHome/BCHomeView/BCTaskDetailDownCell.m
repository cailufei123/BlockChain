//
//  BCTaskDetailDownCell.m
//  BlockChain
//
//  Created by Mac on 2018/5/24.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCTaskDetailDownCell.h"
#import "BCTaskDetailModel.h"


@interface BCTaskDetailDownCell()

@property (nonatomic, strong)UILabel *renWuLable;
@property (nonatomic, strong)UIView *line;
@property (nonatomic, strong)UIView *line1;
@property (nonatomic, strong)UIView *line2;

@property (nonatomic, strong)UILabel *lable1;
@property (nonatomic, strong)UILabel *lable2;
@property (nonatomic, strong)UILabel *lable3;

@property (nonatomic, strong)UILabel *number1;
@property (nonatomic, strong)UILabel *number2;
@property (nonatomic, strong)UILabel *number3;

@property (nonatomic, strong)UIButton *fenXiangBtn;
@property (nonatomic, strong)UILabel *message;


@end
@implementation BCTaskDetailDownCell


-(UILabel *)renWuLable{
    if (!_renWuLable) {
        _renWuLable =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(15)) textAlignment:NSTextAlignmentCenter numberOfLines:1];
        //        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_lingQu];
    }
    return _renWuLable;
}
-(UIView *)line{
    if (!_line) {
        _line = [UIView getViewUserEnabled:NO backGroundColor:colorE5E7E9 tag:0 target:nil action:nil];
        //[Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_line];
    }
    return _line;
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
-(UILabel *)lable1{
    if (!_lable1) {
        _lable1 =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(11)) textAlignment:NSTextAlignmentCenter numberOfLines:1];
//                [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_lable1];
    }
    return _lable1;
}
-(UILabel *)lable2{
    if (!_lable2) {
        _lable2 =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(11)) textAlignment:NSTextAlignmentCenter numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_lable2];
    }
    return _lable2;
}
-(UILabel *)lable3{
    if (!_lable3) {
        _lable3 =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(11)) textAlignment:NSTextAlignmentCenter numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_lable3];
    }
    return _lable3;
}
-(UILabel *)number1{
    if (!_number1) {
        _number1 =[UILabel LabelWithTextColor:colorA354D0 textFont:FONT(@"PingFangSC-Regular", SXRealValue(23)) textAlignment:NSTextAlignmentCenter numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_number1];
    }
    return _number1;
}
-(UILabel *)number2{
    if (!_number2) {
        _number2 =[UILabel LabelWithTextColor:colorA354D0 textFont:FONT(@"PingFangSC-Regular", SXRealValue(23)) textAlignment:NSTextAlignmentCenter numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_number2];
    }
    return _number2;
}
-(UILabel *)number3{
    if (!_number3) {
        _number3 =[UILabel LabelWithTextColor:colorA354D0 textFont:FONT(@"PingFangSC-Regular", SXRealValue(23)) textAlignment:NSTextAlignmentCenter numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_number3];
    }
    return _number3;
}

-(UIButton *)fenXiangBtn{
    if (!_fenXiangBtn) {
        _fenXiangBtn = [UIButton getButtonTitleColor:naverTextColor titleFont:FONT(@"PingFangSC-Semibold", SXRealValue(15)) backGroundColor:colorB378D5 target:self action:@selector(fenXiangBtnClick:)];
        [_fenXiangBtn  setHitEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -10)];//热区域
         [Util roundBorderView:(SXRealValue(2)) border:0 color:blackBColor view:_fenXiangBtn];
    }
    return _fenXiangBtn;
}
-(UILabel *)message{
    if (!_message) {
        _message =[UILabel LabelWithTextColor:color919191 textFont:FONT(@"PingFangSC-Regular", SXRealValue(11)) textAlignment:NSTextAlignmentCenter numberOfLines:2];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_message];
    }
    return _message;
}


+(instancetype)getCellWithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //初始化
    static NSString * DetailArticleID = @"BCTaskDetailDownCell";
    BCTaskDetailDownCell *cell = [tableView dequeueReusableCellWithIdentifier:DetailArticleID];
    if (!cell) {
        cell = [[BCTaskDetailDownCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DetailArticleID];
        //选中颜色
        //[Util selectCellBackgroundColor:cell];
    };
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.renWuLable];
        [self.contentView addSubview:self.line];
        [self.contentView addSubview:self.line1];
        [self.contentView addSubview:self.line2];
        [self.contentView addSubview:self.lable1];
        [self.contentView addSubview:self.lable2];
        [self.contentView addSubview:self.lable3];
        [self.contentView addSubview:self.number1];
        [self.contentView addSubview:self.number2];
        [self.contentView addSubview:self.number3];
        [self.contentView addSubview:self.fenXiangBtn];
        [self.contentView addSubview:self.message];

        [self.renWuLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.contentView.mas_top).with.offset((SYRealValue(18)));
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(10));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-10));
            //make.height.mas_equalTo((SYRealValue(20)));
        }];
        [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(0));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(0));
            make.top.mas_equalTo(self.renWuLable.mas_bottom).with.offset((SYRealValue(18)));
            make.height.mas_equalTo((SYRealValue(0.6)));
        }];
        [self.lable1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.line.mas_bottom).with.offset((SYRealValue(16)));
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(0));
            make.width.mas_equalTo(SCREENWIDTH/3);
//            make.height.mas_equalTo((SYRealValue(8)));
        }];
        [self.lable2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.line.mas_bottom).with.offset((SYRealValue(16)));
            make.left.mas_equalTo(self.lable1.mas_right).with.offset(SXRealValue(0));
            make.width.mas_equalTo(SCREENWIDTH/3);
//            make.height.mas_equalTo((SYRealValue(8)));
        }];
        [self.lable3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.line.mas_bottom).with.offset((SYRealValue(16)));
            make.left.mas_equalTo(self.lable2.mas_right).with.offset(SXRealValue(0));
            make.width.mas_equalTo(SCREENWIDTH/3);
//            make.height.mas_equalTo((SYRealValue(8)));
        }];
        [self.number1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.lable1.mas_bottom).with.offset((SYRealValue(1)));
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(0));
            make.width.mas_equalTo(SCREENWIDTH/3);
            //make.height.mas_equalTo((SYRealValue(13.3)));
        }];
        [self.number2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.lable2.mas_bottom).with.offset((SYRealValue(1)));
            make.left.mas_equalTo(self.number1.mas_right).with.offset(SXRealValue(0));
            make.width.mas_equalTo(SCREENWIDTH/3);
            //            make.height.mas_equalTo((SYRealValue(8)));
        }];
        [self.number3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.lable3.mas_bottom).with.offset((SYRealValue(1)));
            make.left.mas_equalTo(self.number2.mas_right).with.offset(SXRealValue(0));
            make.width.mas_equalTo(SCREENWIDTH/3);
            //make.height.mas_equalTo((SYRealValue(8)));
        }];
        [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SCREENWIDTH/3);
            make.top.mas_equalTo(self.line.mas_bottom).with.offset((SYRealValue(18)));
            make.width.mas_equalTo((SXRealValue(0.6)));
            make.height.mas_equalTo((SYRealValue(13.3)));
        }];
        [self.line2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SCREENWIDTH/3*2);
            make.top.mas_equalTo(self.line.mas_bottom).with.offset((SYRealValue(18)));
            make.width.mas_equalTo((SXRealValue(0.6)));
            make.height.mas_equalTo((SYRealValue(13.3)));
        }];
        [self.fenXiangBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.number1.mas_bottom).with.offset((SYRealValue(27)));
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(15));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-15));
            make.height.mas_equalTo((SCREENWIDTH-2*(SXRealValue(15)))*40/346);
        }];
        [self.message mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.fenXiangBtn.mas_bottom).with.offset((SYRealValue(8)));
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(0));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(0));
            //make.height.mas_equalTo((SYRealValue(20)));
            make.bottom.mas_equalTo(self.contentView.mas_bottom).with.offset((SYRealValue(-22)));
        }];

    }
    return self;
}

-(void)setModel:(BCTaskDetailModel *)model{
    _model =model;
    if (model!=nil) {
    //假数据
    self.renWuLable.text =[NSString stringWithFormat:@"任务奖励:%@%@+%@算力",model.taskInfo.eachCoin,model.taskInfo.code,model.taskInfo.compute];
    self.lable1.text= @"当前算力";
    self.lable2.text =@"可完成";
    self.lable3.text =@"已完成";
    self.number1.text= [NSString stringWithFormat:@"%@",model.userInfo.compute];
    self.number2.text= [NSString stringWithFormat:@"%@次",model.taskInfo.max];
    self.number3.text= [NSString stringWithFormat:@"%@次",model.taskInfo.doneCount];
    [self.fenXiangBtn setTitle:@"分享" forState:UIControlStateNormal];
    self.message.text= @"好友使用任务邀请码注册成功即可获得奖励\n成功分享3次即可完成1次任务";
    }
}

#pragma mark -分享按钮
-(void)fenXiangBtnClick:(UIButton *)button{
    if (self.delegate && [self.delegate respondsToSelector:@selector(fenXiangBtnClick)]) {
        [self.delegate fenXiangBtnClick];
    }
}


- (void)awakeFromNib {
    [super awakeFromNib];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
