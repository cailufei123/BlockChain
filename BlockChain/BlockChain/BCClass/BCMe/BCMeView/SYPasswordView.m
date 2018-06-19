//
//  SYPasswordView.m
//  PasswordDemo
//
//  Created by aDu on 2017/2/6.
//  Copyright © 2017年 DuKaiShun. All rights reserved.
//

#import "SYPasswordView.h"

#define kDotSize CGSizeMake (10, 10) //密码点的大小
#define kDotCount 6  //密码个数
//#define K_Field_Height self.frame.size.height  //每一个输入框的高度等于当前view的高度
#define K_Field_Height  SYRealValue(50)  //每一个输入框的高度等于当前view的高度

#define TextViewTop    self.line1.xmg_bottom+(SYRealValue(30))
#define TextViewLeft    (SXRealValue(50))

@interface SYPasswordView ()

@property (nonatomic, strong)UILabel *zhifuLable;//支付lable
@property (nonatomic, strong)UIButton *backBtn;
@property (nonatomic, strong)UIView *line1;
@property (nonatomic, strong)UIButton *forgetBtn;//忘记密码


@property (nonatomic, strong) NSMutableArray *dotArray; //用于存放黑色的点点

@end

@implementation SYPasswordView

-(UIView *)line1{
    if (!_line1) {
        _line1 = [UIView getViewUserEnabled:NO backGroundColor:colorE5E7E9 tag:0 target:nil action:nil];
        //[Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_line1];
    }
    return _line1;
}

-(UILabel *)zhifuLable{
    if (!_zhifuLable) {
        _zhifuLable =[UILabel LabelWithTextColor:blackBColor textFont:FONT(@"PingFangSC-Regular", SXRealValue(16)) textAlignment:NSTextAlignmentCenter numberOfLines:1];
        //        [Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_priceLable];
    }
    return _zhifuLable;
}

-(UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn = [UIButton getButtonTitleColor:blackBColor titleFont:FONT(@"PingFangSC-Semibold", SXRealValue(12)) backGroundColor:nil target:self action:@selector(backBtnClick)];
        [_backBtn setImage:[UIImage imageNamed:@"alertview_close"] forState:UIControlStateNormal];
        [_backBtn  setHitEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -10)];//热区域
        // [Util roundBorderView:0 border:1 color:blackBColor view:_moreBtn];
    }
    return _backBtn;
}
-(UIButton *)forgetBtn{
    if (!_forgetBtn) {
        _forgetBtn = [UIButton getButtonTitleColor:color4DAFEA titleFont:FONT(@"PingFangSC-Semibold", SXRealValue(11)) backGroundColor:nil target:self action:@selector(forgetBtnClick)];
        _forgetBtn.titleLabel.textAlignment =NSTextAlignmentRight;
        [_forgetBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
        [_forgetBtn  setHitEdgeInsets:UIEdgeInsetsMake(-10, -10, -10, -10)];//热区域
        //        [Util roundBorderView:0 border:1 color:blackBColor view:_moreBtn];
    }
    return _forgetBtn;
}

//返回
-(void)backBtnClick{
    if (self.delegate && [self.delegate respondsToSelector:@selector(backBtnClick)]) {
        [self.delegate backBtnClick];
    }
}
//
-(void)forgetBtnClick{
    if (self.delegate && [self.delegate respondsToSelector:@selector(forgetBtnClick)]) {
        [self.delegate forgetBtnClick];
    }
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.backBtn.frame =CGRectMake(SXRealValue(10), (SYRealValue(10)), SXRealValue(25), SXRealValue(25));
        self.zhifuLable.text =@"请输入支付密码";
        self.zhifuLable.xmg_x = SXRealValue(35);
        self.zhifuLable.xmg_y =(SYRealValue(10));
        [self.zhifuLable sizeToFit];
        self.zhifuLable.xmg_centerX = self.xmg_centerX;//最后设置centerx
        //[Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_zhifuLable];
        self.line1.frame = CGRectMake(0, self.backBtn.xmg_bottom+(SYRealValue(10)), SCREEN_WIDTH, (SYRealValue(0.6)));

        [self addSubview:self.backBtn];
        [self addSubview:self.zhifuLable];
        [self addSubview:self.line1];
        [self addSubview:self.forgetBtn];
        [self initPwdTextField];

        self.forgetBtn.xmg_x = SCREEN_WIDTH-(SXRealValue(50+50));
        self.forgetBtn.xmg_y = self.textField.xmg_bottom+(SYRealValue(10));
        self.forgetBtn.xmg_width = SXRealValue(50);
        self.forgetBtn.xmg_height = SYRealValue(25);
        //NSLog(@"%@",NSStringFromCGRect(self.forgetBtn.frame));
        [self.textField becomeFirstResponder];
    }
    return self;
}

- (void)initPwdTextField
{
    //每个密码输入框的宽度
    CGFloat width = (self.frame.size.width-2*TextViewLeft) / kDotCount;
   
    //生成分割线
    for (int i = 0; i < kDotCount - 1; i++) {
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.textField.frame) + (i + 1) * width, TextViewTop, 1, K_Field_Height)];
        lineView.backgroundColor = [UIColor grayColor];
        [self addSubview:lineView];
    }
    
    self.dotArray = [[NSMutableArray alloc] init];
    //生成中间的点
    for (int i = 0; i < kDotCount; i++) {
        UIView *dotView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.textField.frame) + (width - kDotCount) / 2 + i * width, CGRectGetMinY(self.textField.frame) + (K_Field_Height - kDotSize.height) / 2, kDotSize.width, kDotSize.height)];
        dotView.backgroundColor = [UIColor blackColor];
        dotView.layer.cornerRadius = kDotSize.width / 2.0f;
        dotView.clipsToBounds = YES;
        dotView.hidden = YES; //先隐藏
        [self addSubview:dotView];
        //把创建的黑色点加入到数组中
        [self.dotArray addObject:dotView];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    //NSLog(@"变化%@", string);
    if([string isEqualToString:@"\n"]) {
        //按回车关闭键盘
        [textField resignFirstResponder];
        return NO;
    } else if(string.length == 0) {
        //判断是不是删除键
        return YES;
    }
    else if(textField.text.length >= kDotCount) {
        //输入的字符个数大于6，则无法继续输入，返回NO表示禁止输入
        //NSLog(@"输入的字符个数大于6，忽略输入");
        return NO;
    } else {
        return YES;
    }
}

/**
 *  清除密码
 */
- (void)clearUpPassword
{
    self.textField.text = @"";
    [self textFieldDidChange:self.textField];
}

/**
 *  重置显示的点
 */
- (void)textFieldDidChange:(UITextField *)textField
{
    //NSLog(@"%@", textField.text);
    for (UIView *dotView in self.dotArray) {
        dotView.hidden = YES;
    }
    for (int i = 0; i < textField.text.length; i++) {
        ((UIView *)[self.dotArray objectAtIndex:i]).hidden = NO;
    }
    if (textField.text.length == kDotCount) {
        //获取输入密码
        if (self.delegate && [self.delegate respondsToSelector:@selector(getPassWord:)]) {
            [self.delegate getPassWord:textField.text];
        }
        //NSLog(@"输入完毕");
    }
}

#pragma mark - init

- (UITextField *)textField
{
    if (!_textField) {
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(TextViewLeft,TextViewTop , self.frame.size.width-2*TextViewLeft, K_Field_Height)];
        _textField.backgroundColor = [UIColor whiteColor];
        //输入的文字颜色为白色
        _textField.textColor = [UIColor whiteColor];
        //输入框光标的颜色为白色
        _textField.tintColor = [UIColor whiteColor];
        _textField.delegate = self;
        _textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _textField.keyboardType = UIKeyboardTypeNumberPad;
        _textField.layer.borderColor = [[UIColor grayColor] CGColor];
        _textField.layer.borderWidth = 1;
        [_textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        [self addSubview:_textField];
        //替换完成按钮
        //[Util roundBorderView:0 border:1 color:[UIColor blackColor] view:_textField];
        _textField.inputAccessoryView = [Util getNoWanChengBtn];
    }
    return _textField;
}
-(void)wanChengBtnClick{
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    return YES;
}
@end
