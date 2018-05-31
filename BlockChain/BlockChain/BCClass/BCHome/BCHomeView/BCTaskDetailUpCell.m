//
//  BCTaskDetailUpCell.m
//  BlockChain
//
//  Created by Mac on 2018/5/24.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCTaskDetailUpCell.h"
#import "BCTaskDetailModel.h"

@interface BCTaskDetailUpCell()

@property (nonatomic, strong)UILabel *time;
@property (nonatomic, strong)UILabel *message;
@property (nonatomic, strong)UILabel *jieShaoLable;
@property (nonatomic, strong)UILabel *jieShao;
@property (nonatomic, strong)UILabel *lingQuLable;
@property (nonatomic, strong)UILabel *lingQu;

@end
@implementation BCTaskDetailUpCell

-(UILabel *)time{
    if (!_time) {
        _time =[UILabel LabelWithTextColor:color717171 textFont:FONT(@"PingFangSC-Regular", SXRealValue(9)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//                [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_time];
    }
    return _time;
}
-(UILabel *)message{
    if (!_message) {
        _message =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(15)) textAlignment:NSTextAlignmentLeft numberOfLines:0];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_message];
    }
    return _message;
}
-(UILabel *)jieShaoLable{
    if (!_jieShaoLable) {
        _jieShaoLable =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(15)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_jieShaoLable];
    }
    return _jieShaoLable;
}
-(UILabel *)jieShao{
    if (!_jieShao) {
        _jieShao =[UILabel LabelWithTextColor:color636161 textFont:FONT(@"PingFangSC-Regular", SXRealValue(12)) textAlignment:NSTextAlignmentLeft numberOfLines:0];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_jieShao];
    }
    return _jieShao;
}

-(UILabel *)lingQuLable{
    if (!_lingQuLable) {
        _lingQuLable =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(15)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_lingQuLable];
    }
    return _lingQuLable;
}
-(UILabel *)lingQu{
    if (!_lingQu) {
        _lingQu =[UILabel LabelWithTextColor:color636161 textFont:FONT(@"PingFangSC-Regular", SXRealValue(11)) textAlignment:NSTextAlignmentLeft numberOfLines:0];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_lingQu];
    }
    return _lingQu;
}

+(instancetype)getCellWithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //初始化
    static NSString * DetailArticleID = @"BCTaskDetailUpCell";
    BCTaskDetailUpCell *cell = [tableView dequeueReusableCellWithIdentifier:DetailArticleID];
    if (!cell) {
        cell = [[BCTaskDetailUpCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DetailArticleID];
        //选中颜色
        //[Util selectCellBackgroundColor:cell];
    };
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.time];
        [self.contentView addSubview:self.message];
        [self.contentView addSubview:self.jieShaoLable];
        [self.contentView addSubview:self.jieShao];
        [self.contentView addSubview:self.lingQuLable];
        [self.contentView addSubview:self.lingQu];

        [self.time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(16));
            make.top.mas_equalTo(self.contentView.mas_top).with.offset((SYRealValue(13)));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-16));
//            make.height.mas_equalTo((SYRealValue(14)));
        }];
        [self.message mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(16));
            make.top.mas_equalTo(self.time.mas_bottom).with.offset((SYRealValue(8)));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-41));
//            make.height.mas_equalTo((SYRealValue(44)));
        }];
        [self.jieShaoLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(16));
            make.top.mas_equalTo(self.message.mas_bottom).with.offset((SYRealValue(20)));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-16));
//            make.height.mas_equalTo((SYRealValue(24)));
        }];
        [self.jieShao mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(17));
            make.top.mas_equalTo(self.jieShaoLable.mas_bottom).with.offset((SYRealValue(11)));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-17));
//            make.height.mas_equalTo((SYRealValue(90)));
        }];
        [self.lingQuLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(17));
            make.top.mas_equalTo(self.jieShao.mas_bottom).with.offset((SYRealValue(15)));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-17));
//            make.height.mas_equalTo((SYRealValue(20)));
        }];
        [self.lingQu mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(17));
            make.top.mas_equalTo(self.lingQuLable.mas_bottom).with.offset((SYRealValue(15)));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-17));
//            make.height.mas_equalTo((SYRealValue(90)));
            make.bottom.mas_equalTo(self.contentView.mas_bottom).with.offset((SYRealValue(-19)));
        }];
    }
    return self;
}
-(void)setModel:(BCTaskDetailModel *)model{
    _model =model;
//    if (model!=nil) {
//        
//        
//    }else{
//        //假数据
//        self.time.text = model.taskInfo.createTime;
//        self.message.text=model.taskInfo.name;
//        self.jieShaoLable.text =@"项目介绍";
//        self.jieShao.text= model.taskInfo.taskDesc;
//        self.lingQuLable.text= @"糖果领取流程";
//        self.lingQu.text = model.partnerInfo.brief;
//    }
    //假数据
    self.time.text = model.taskInfo.createTime;
    self.message.text=model.taskInfo.name;
    self.jieShaoLable.text =@"项目介绍";
    self.jieShao.text= model.taskInfo.taskDesc;
    self.lingQuLable.text= @"糖果领取流程";
    self.lingQu.text = model.partnerInfo.brief;
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
