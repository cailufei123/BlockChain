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


//
//
//        [self.dizhiLable mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(16));
//            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-16));
//            make.top.mas_equalTo(self.contentView.mas_top).with.offset((SYRealValue(12)));
//            make.height.mas_equalTo((SYRealValue(20)));
//        }];
//
//        [self.dizhi mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(15));
//            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-10));
//            make.top.mas_equalTo(self.dizhiLable.mas_bottom).with.offset((SYRealValue(17)));
//            make.height.mas_equalTo((SYRealValue(20)));
//        }];
//        [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(15));
//            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-15));
//            make.top.mas_equalTo(self.dizhi.mas_bottom).with.offset((SYRealValue(17)));
//            make.height.mas_equalTo((SYRealValue(0.6)));
//        }];
    }
    return self;
}

-(void)setModel:(BCTaskDetailModel *)model{
    _model =model;
    if (model!=nil) {
        
    }else{
        //假数据
        self.renWuLable.text = @"任务奖励: 5KFC";
        self.lable1.text= @"当前算力";
        self.lable2.text =@"可完成";
        self.lable3.text =@"已完成";
        self.number1.text= [NSString stringWithFormat:@"%@次",@"102"];
        self.number2.text= [NSString stringWithFormat:@"%@次",@"102"];
        self.number3.text= [NSString stringWithFormat:@"%@次",@"102"];
        [self.fenXiangBtn setImage:[UIImage imageNamed:@"right_arrow"] forState:UIControlStateNormal];
    }
}

#pragma mark -跟多按钮
-(void)moreBtnClick:(UIButton *)button{
    
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
