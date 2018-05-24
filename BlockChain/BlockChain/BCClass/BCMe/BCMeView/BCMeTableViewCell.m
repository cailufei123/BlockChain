//
//  BCMeTableViewCell.m
//  BlockChain
//
//  Created by 吴博怡 on 2018/5/22.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCMeTableViewCell.h"
#import "BCMeModel.h"

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
        //[Util roundBorderView:SXRealValue(60/2) border:0 color:nil view:_moneyImage];
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
        _downPrice =[UILabel LabelWithTextColor:color101010 textFont:FONT(@"PingFangSC-Regular", SXRealValue(11)) textAlignment:NSTextAlignmentRight numberOfLines:1];
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
-(void)setModel:(BCMeModel *)model{
    _model =model;
    if (model!=nil) {
        
    }else{
        //假数据
        self.moneyImage.image =[UIImage imageNamed:@"金币-2"];
        self.moneyName.text =@"TBC";
        self.upPrice.text=[NSString stringWithFormat:@"%.4f",0.145346];
        self.downPrice.text = [NSString stringWithFormat:@"≈¥%.1f",0.12];
    }
}


//-(void)setMode:(BCMeModel *)model{
//    _model =model;
//    if (model!=nil) {
//        _bigView.backgroundColor =[UIColor whiteColor];
//        _downView.backgroundColor =[UIColor whiteColor];
//        _downOneView.backgroundColor =[UIColor whiteColor];
//        _downTwoView.backgroundColor =[UIColor whiteColor];
//        _webView.backgroundColor =[UIColor whiteColor];
//        _jianjieLine.backgroundColor =kNaviColor;
//        _upSeparatorLine.backgroundColor =BGCOLOR_TABLEVIEW;
//        _downSeparatorLine.backgroundColor =BGCOLOR_TABLEVIEW;
//        //强制布局
//        [self.bigExpertIcon sd_setImageFromURLPath:ZZPingString(URL_ImagePrefixPath, mode.photo)];
//        self.avaterBorderImg.image=[UIImage imageNamed:@"touxiang"];
//        [self.smallExpertIcon sd_setExpertHeadIconImageFromURLPath:ZZPingString(URL_ImagePrefixPath, mode.photo)];
//        self.expertName.text = mode.name;//姓名
//        CGSize expertNameSize = [mode.name sizeWithAttributes:@{NSFontAttributeName : SYSTEMFONT(WidthScale(20))}];
//
//        self.jianjieLable.text=@"简介";
//        self.expertTitle.text = mode.title;//咨询师
//        CGSize expertTitleSize = [mode.title sizeWithAttributes:@{NSFontAttributeName : TEXTFONT_XiTi(WidthScale(12))}];
//
//        self.zizhiTitle.text = @"从业资质";//发表内容
//        CGSize zizhiTitleSize = [@"从业资质" sizeWithAttributes:@{NSFontAttributeName : SYSTEMFONT(WidthScale(16))}];
//        self.zhengjianTitle.text = mode.qualification;//认证
//        CGSize zhengjianTitleSize = [mode.qualification sizeWithAttributes:@{NSFontAttributeName : SYSTEMFONT(WidthScale(14))}];
//
//        self.zizhiIcon.image=[UIImage imageNamed:@"renzheng"];
//        self.zhiziHuaTitle.text=@"知子花认证";
//        self.webView.hidden=NO;
//        [self layoutIfNeeded];
//        [self layoutIfNeeded];
//
//        self.bigViewHeight =self.upBigView.zz_height+WidthScale(61/2)+WidthScale(10) +expertNameSize.height +WidthScale(10)+expertTitleSize.height+WidthScale(15)+WidthScale(10);
//        self.downTwoHeight = WidthScale(20)+zizhiTitleSize.height +WidthScale(20)+zhengjianTitleSize.height+WidthScale(20);
//
//        self.middleViewHeight = self.bigViewHeight+self.downOneView.zz_height+self.downTwoHeight;
//
//        NSLog(@"bigView.zz_bottom===%f",self.bigView.zz_height);
//        NSLog(@"self.downOneView.zz_y===%f",self.downOneView.zz_height);
//        NSLog(@"self.downTwoView.zz_height===%f",self.downTwoView.zz_height);
//        NSLog(@"self.middleViewHeight===%f",self.middleViewHeight);
//        //        bigView.zz_bottom===256.000000
//        //        self.downOneView.zz_y===34.000000
//        //        self.downTwoView.zz_height===94.000000
//        //        self.middleViewHeight===392.533333
//
//
//    }
//[picture sd_setImageWithURL:[NSURL URLWithString:introduction.picture] placeholderImage:[UIImage imageNamed:@"fengmian_defultIcon"]];

//}
//self.oneAnswer.preferredMaxLayoutWidth = SCREENWIDTH - self.oneName1.zz_right-WidthScale(25)-WidthScale(10)-WidthScale(20);


- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
