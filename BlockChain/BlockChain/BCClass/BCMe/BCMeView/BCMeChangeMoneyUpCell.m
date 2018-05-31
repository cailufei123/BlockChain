//
//  BCMeChangeMoneyUpCell.m
//  BlockChain
//
//  Created by Mac on 2018/5/24.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCMeChangeMoneyUpCell.h"
#import "BCMeChangeMoneyMode.h"

@interface BCMeChangeMoneyUpCell()<UITextFieldDelegate,UITextViewDelegate>

@property (nonatomic, strong)UILabel *dizhiLable;//收款人地址
@property (nonatomic, strong)UITextField *textField1;
@property (nonatomic, strong)UILabel *priceLable;//转账金额

@property (nonatomic, strong)UITextField *textField2;//收款金额
@property (nonatomic, strong)UILabel *price;

@property (nonatomic, strong)UILabel *beiZhuLable;
@property (nonatomic, strong)UITextField *textField3;
@property (nonatomic, strong)UIButton *moreBtn;
@property (nonatomic, strong)UIView *line1;
@property (nonatomic, strong)UIView *line2;
@property (nonatomic, strong)UIView *line3;


@end

@implementation BCMeChangeMoneyUpCell

-(UILabel *)dizhiLable{
    if (!_dizhiLable) {
        _dizhiLable =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentLeft numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_dizhiLable];
    }
    return _dizhiLable;
}

//-(UITextView *)textField1{
//    if (!_textField1) {
//        _textField1 = [[UITextView alloc]init];
//        _textField1.font = FONT(@"PingFangSC-Regular", SXRealValue(13));
//        _textField1.delegate = self;
//        _textField1.textAlignment = NSTextAlignmentLeft;
//        //ViewBorderRadius(_textView, 6, 0.5, RGBCOLOR(204, 204, 204));
//        _textField1.returnKeyType =  UIReturnKeySend;
//
//    }
//    return _textField1;
//}

-(UITextField *)textField1{
    if (!_textField1) {
        _textField1 = [[UITextField alloc] init];
        _textField1.font = FONT(@"PingFangSC-Regular", SXRealValue(13));
        _textField1.textColor = blackTextColor;
        _textField1.tag=1;
        _textField1.placeholder = @"";
        _textField1.keyboardType = UIKeyboardTypeDefault;
        [_textField1 addTarget:self action:@selector(textValueChanged:) forControlEvents:UIControlEventEditingChanged];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldChange:) name:UITextFieldTextDidChangeNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldChange:) name:UITextViewTextDidChangeNotification object:nil];
        _textField1.delegate = self;
        //[_textField1 setValue:RGBCOLOR(159, 158, 163) forKeyPath:@"_placeholderLabel.textColor"];
        // 提前在Xcode上设置图片中间拉伸
        //_textField1.background = [UIImage imageWithColor:RGBCOLOR(238, 238, 238)];
        _textField1.clearButtonMode = UITextFieldViewModeWhileEditing;
        // 通过init初始化的控件大多都没有尺寸
//        UIImageView *searchIcon = [[UIImageView alloc] init];
//        searchIcon.image = [UIImage imageNamed:@"hz_home_searchIcon"];
        // contentMode：default is UIViewContentModeScaleToFill，要设置为UIViewContentModeCenter：使图片居中，防止图片填充整个imageView
//        searchIcon.contentMode = UIViewContentModeCenter;
//        searchIcon.size = CGSizeMake(30, 30);
//        self.leftView = searchIcon;
        _textField1.leftViewMode = UITextFieldViewModeAlways;
//        _dizhi =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentCenter numberOfLines:1];
//        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_textField1];
    }
    return _textField1;
}

-(UITextField *)textField2{
    if (!_textField2) {
        _textField2 = [[UITextField alloc] init];
        _textField2.font = FONT(@"PingFangSC-Regular", SXRealValue(13));
        _textField2.textColor = colorD35353;
        _textField2.placeholder = @"5 HOC";
        _textField2.tag=2;
//        _textField2.keyboardType = UIKeyboardTypeDefault;
        _textField2.keyboardType = UIKeyboardTypeNumberPad;
        [_textField2 addTarget:self action:@selector(textValueChanged:) forControlEvents:UIControlEventEditingChanged];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldChange:) name:UITextFieldTextDidChangeNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldChange:) name:UITextViewTextDidChangeNotification object:nil];
        _textField2.delegate = self;
        //[_textField1 setValue:RGBCOLOR(159, 158, 163) forKeyPath:@"_placeholderLabel.textColor"];
        // 提前在Xcode上设置图片中间拉伸
        //_textField1.background = [UIImage imageWithColor:RGBCOLOR(238, 238, 238)];
        _textField2.clearButtonMode = UITextFieldViewModeWhileEditing;
        // 通过init初始化的控件大多都没有尺寸
        //        UIImageView *searchIcon = [[UIImageView alloc] init];
        //        searchIcon.image = [UIImage imageNamed:@"hz_home_searchIcon"];
        // contentMode：default is UIViewContentModeScaleToFill，要设置为UIViewContentModeCenter：使图片居中，防止图片填充整个imageView
        //        searchIcon.contentMode = UIViewContentModeCenter;
        //        searchIcon.size = CGSizeMake(30, 30);
        //        self.leftView = searchIcon;
        _textField2.leftViewMode = UITextFieldViewModeAlways;
        //        _dizhi =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentCenter numberOfLines:1];
//                [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_textField2];
    }
    return _textField2;
}
-(UITextField *)textField3{
    if (!_textField3) {
        _textField3 = [[UITextField alloc] init];
        _textField3.font = FONT(@"PingFangSC-Regular", SXRealValue(13));
        _textField3.textColor = blackTextColor;
        _textField3.tag=3;
        _textField3.placeholder = @"";
        _textField3.keyboardType = UIKeyboardTypeDefault;
        [_textField3 addTarget:self action:@selector(textValueChanged:) forControlEvents:UIControlEventEditingChanged];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldChange:) name:UITextFieldTextDidChangeNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldChange:) name:UITextViewTextDidChangeNotification object:nil];
        _textField3.delegate = self;
        //[_textField3 setValue:RGBCOLOR(159, 158, 163) forKeyPath:@"_placeholderLabel.textColor"];
        // 提前在Xcode上设置图片中间拉伸
        //_textField1.background = [UIImage imageWithColor:RGBCOLOR(238, 238, 238)];
        _textField3.clearButtonMode = UITextFieldViewModeWhileEditing;
        // 通过init初始化的控件大多都没有尺寸
        //        UIImageView *searchIcon = [[UIImageView alloc] init];
        //        searchIcon.image = [UIImage imageNamed:@"hz_home_searchIcon"];
        // contentMode：default is UIViewContentModeScaleToFill，要设置为UIViewContentModeCenter：使图片居中，防止图片填充整个imageView
        //        searchIcon.contentMode = UIViewContentModeCenter;
        //        searchIcon.size = CGSizeMake(30, 30);
        //        self.leftView = searchIcon;
        _textField3.leftViewMode = UITextFieldViewModeAlways;
        //        _dizhi =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentCenter numberOfLines:1];
//                [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_textField3];
    }
    return _textField3;
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
//-(UILabel *)beiZhu{
//    if (!_beiZhu) {
//        _beiZhu =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(13)) textAlignment:NSTextAlignmentRight numberOfLines:1];
////        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_beiZhu];
//    }
//    return _beiZhu;
//}

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
        [self.contentView addSubview:self.textField1];
        [self.contentView addSubview:self.priceLable];
        [self.contentView addSubview:self.line1];
        [self.contentView addSubview:self.line2];
        [self.contentView addSubview:self.line3];
        [self.contentView addSubview:self.textField2];
        [self.contentView addSubview:self.textField3];
        [self.contentView addSubview:self.beiZhuLable];
//        [self.contentView addSubview:self.moreBtn];
        
        
        [self.dizhiLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(16));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-16));
            make.top.mas_equalTo(self.contentView.mas_top).with.offset((SYRealValue(12)));
            make.height.mas_equalTo((SYRealValue(20)));
        }];

        [self.textField1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(15));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-15));
            make.top.mas_equalTo(self.dizhiLable.mas_bottom).with.offset((SYRealValue(17)));
            make.height.mas_equalTo((SYRealValue(20)));
        }];
        [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(15));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-15));
            make.top.mas_equalTo(self.textField1.mas_bottom).with.offset((SYRealValue(17)));
            make.height.mas_equalTo((SYRealValue(0.6)));
        }];
        
        [self.priceLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(15));
            //make.right.mas_equalTo(self.price.mas_left).with.offset(SXRealValue(-15));
            make.top.mas_equalTo(self.line1.mas_bottom).with.offset((SYRealValue(12)));
            make.width.mas_equalTo((SXRealValue(60)));
            make.height.mas_equalTo((SYRealValue(20)));
        }];
        [self.textField2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.priceLable.mas_right).with.offset(SXRealValue(8));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-15));
            make.top.mas_equalTo(self.line1.mas_bottom).with.offset((SYRealValue(12)));
            make.height.mas_equalTo((SYRealValue(20)));
        }];

        [self.line2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(15));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-15));
            make.top.mas_equalTo(self.textField2.mas_bottom).with.offset((SYRealValue(12)));
            make.height.mas_equalTo((SYRealValue(0.6)));
        }];
        [self.beiZhuLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(SXRealValue(15));
            make.top.mas_equalTo(self.line2.mas_bottom).with.offset((SYRealValue(13)));
            make.width.mas_equalTo((SXRealValue(30)));
            make.height.mas_equalTo((SYRealValue(20)));
        }];
        [self.textField3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.beiZhuLable.mas_right).with.offset(SXRealValue(8));
            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-15));
            make.centerY.mas_equalTo(self.beiZhuLable.mas_centerY);
            make.height.mas_equalTo((SYRealValue(20)));
        }];
//        [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.mas_equalTo(self.contentView.mas_right).with.offset(SXRealValue(-13));
//            make.centerY.mas_equalTo(self.beiZhuLable.mas_centerY);
//            make.width.mas_equalTo((SXRealValue(10)));
//            make.height.mas_equalTo((SYRealValue(15)));
//        }];
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
        self.dizhiLable.text = @"收款人钱包";
        self.priceLable.text =@"转账金额";
//        self.price.text=[NSString stringWithFormat:@"¥ %.2f",55.1111123123];
        self.beiZhuLable.text= @"备注";
        //self.beiZhu.text =@"八大速度发斯蒂芬阿斯蒂芬阿斯蒂芬阿斯蒂芬";
        [self.moreBtn setImage:[UIImage imageNamed:@"right_arrow"] forState:UIControlStateNormal];
        [self.priceLable sizeToFit];
        [self.beiZhuLable sizeToFit];
    }
}
#pragma mark -跟多按钮
-(void)moreBtnClick:(UIButton *)button{
    
    
}

#pragma mark - 搜索框的实时监听
- (void)textValueChanged:(UITextField *)textField{
    if (textField==self.textField1) {
        if (textField.markedTextRange == nil) {//收款人钱包
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(changeValue1:)]) {
                [self.delegate changeValue1:textField.text];
            }
        }
    }else if (textField==self.textField2){//转账金额
        if (kStringIsEmpty(textField.text)) {
            self.textField2.placeholder = @"5 HOC";
        }else{
            self.textField2.placeholder = @"";
        }
        if (self.delegate && [self.delegate respondsToSelector:@selector(changeValue2:)]) {
            [self.delegate changeValue2:textField.text];
        }
    }else{//备注
        if (self.delegate && [self.delegate respondsToSelector:@selector(changeValue3:)]) {
            [self.delegate changeValue3:textField.text];
        }
    }
   
}
//键盘弹起收起监听
- (void)textFieldChange:(UITextField *)textField{
    if (textField==self.textField1) {
        
        
    }else if (textField==self.textField2){

        
    }else{

    }
    //判断输入(不能输入特殊字符)
//    [RestrictionInput restrictionInputTextField:self.homeSearchBar maxNumber:100 showView:self.view showErrorMessage:@"请输入正规字符"];
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
