//
//  BCReaNameController.m
//  BlockChain
//
//  Created by 蔡路飞 on 2018/5/24.
//  Copyright © 2018年 蔡路飞. All rights reserved.
//

#import "BCReaNameController.h"

@interface BCReaNameController ()
@property (weak, nonatomic) IBOutlet UITextField *realNameTf;
@property (weak, nonatomic) IBOutlet UITextField *cardIDnumberTf;
@property (weak, nonatomic) IBOutlet UIButton *frontBt;
@property (weak, nonatomic) IBOutlet UIImageView *frontImg;
@property (weak, nonatomic) IBOutlet UIImageView *backImg;
@property (weak, nonatomic) IBOutlet UIButton *backBt;
@property (weak, nonatomic) IBOutlet UIImageView *handImg;
@property (weak, nonatomic) IBOutlet UIButton *handbt;

@property (weak, nonatomic) IBOutlet UIButton *nextBt;
@end

@implementation BCReaNameController

- (void)viewDidLoad {
    [super viewDidLoad];
       self.view.backgroundColor = bagColor;
    self.navigationItem.title = @"实名认证";
    self.realNameTf.borderStyle = UITextBorderStyleNone;
      self.cardIDnumberTf.borderStyle = UITextBorderStyleNone;
}



@end
