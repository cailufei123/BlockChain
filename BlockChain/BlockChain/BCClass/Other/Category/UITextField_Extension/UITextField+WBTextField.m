//
//  UITextField+WBTextField.m
//  BlockChain
//
//  Created by Mac on 2018/6/4.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "UITextField+WBTextField.h"

@implementation UITextField (WBTextField)


/**
 *  报告界面专用label
 */
//+ (instancetype)getTextFieldWithTextFont:(UIFont)font textColor:(UICo *)textColor font:(CGFloat)font{
//    
//           UITextField *textField = [[UITextField alloc] init];
//            textField.font = font;
//            textField.textColor = colorD35353;
//            textField.placeholder = @"5 HOC";
//            textField.tag=2;
//    //        _textField2.keyboardType = UIKeyboardTypeDefault;
//            textField.keyboardType = UIKeyboardTypeNumberPad;
//            [textField addTarget:self action:@selector(textValueChanged:) forControlEvents:UIControlEventEditingChanged];
//            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldChange:) name:UITextFieldTextDidChangeNotification object:nil];
//            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldChange:) name:UITextViewTextDidChangeNotification object:nil];
//            textField.delegate = self;
//            [textField setValue:RGBCOLOR(159, 158, 163) forKeyPath:@"_placeholderLabel.textColor"];
//            // 提前在Xcode上设置图片中间拉伸
//            textField.background = [UIImage imageWithColor:RGBCOLOR(238, 238, 238)];
//            textField.clearButtonMode = UITextFieldViewModeWhileEditing;
//            // 通过init初始化的控件大多都没有尺寸
////            UIImageView *searchIcon = [[UIImageView alloc] init];
////            searchIcon.image = [UIImage imageNamed:@"hz_home_searchIcon"];
////            contentMode：
////           default is UIViewContentModeScaleToFill，要设置为UIViewContentModeCenter：
////    //使图片居中，防止图片填充整个imageView
////            searchIcon.contentMode = UIViewContentModeCenter;
////            searchIcon.size = CGSizeMake(30, 30);
////            self.leftView = searchIcon;
//            _textField2.leftViewMode = UITextFieldViewModeAlways;
//}
@end
