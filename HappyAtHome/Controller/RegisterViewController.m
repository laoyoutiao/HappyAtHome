//
//  RegisterViewController.m
//  华润水泥
//
//  Created by isec on 15/11/3.
//  Copyright © 2015年 isec. All rights reserved.
//

#import "RegisterViewController.h"
#import "UIView+Additions.h"
#import "UIColor+Hex.h"
#import "ServerHeader.h"

#define BACKGROUNDCOLOR [UIColor colorWithRed:239/255.0 green:125/255.0 blue:159/255.0 alpha:1.0]
@interface RegisterViewController ()
{
    UITextField *_phoneNumTf;
    UITextField *_IDCard;
    UITextField *_passWordTf;
}
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册";
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
}

- (void)initUI
{
    UIView *phoneNumView = [[UIView alloc]initWithFrame:CGRectMake(20, 64 + 25, self.view.frame.size.width - 40, 40)];
    phoneNumView.backgroundColor = [UIColor whiteColor];
    phoneNumView.layer.cornerRadius = 3;
    phoneNumView.layer.borderWidth = 0.5;
    phoneNumView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.view addSubview:phoneNumView];
    
    UIImageView *phoneImg = [[UIImageView alloc]initWithFrame:CGRectMake(2, 3, 25, 34)];
    phoneImg.backgroundColor = [UIColor orangeColor];
    [phoneNumView addSubview:phoneImg];
    
    _phoneNumTf = [[UITextField alloc]initWithFrame:CGRectMake(phoneImg.right + 3, 0, phoneNumView.width - phoneImg.width - 10, 40)];
    _phoneNumTf.font = [UIFont systemFontOfSize:16.0];
    _phoneNumTf.placeholder = @"请输入手机号码";
    _phoneNumTf.textAlignment = NSTextAlignmentLeft;
    [phoneNumView addSubview:_phoneNumTf];
    
    UIView *IDCardView = [[UIView alloc]initWithFrame:CGRectMake(phoneNumView.left, phoneNumView.bottom + 10,phoneNumView.width, 40)];
    IDCardView.backgroundColor = [UIColor whiteColor];
    IDCardView.layer.cornerRadius = 3;
    IDCardView.layer.borderWidth = 0.5;
    IDCardView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.view addSubview:IDCardView];
    
    UIImageView *IDCardImg = [[UIImageView alloc]initWithFrame:CGRectMake(2, 3, 25, 34)];
    IDCardImg.backgroundColor = [UIColor orangeColor];
    [IDCardView addSubview:IDCardImg];
    
    _IDCard = [[UITextField alloc]initWithFrame:CGRectMake(IDCardImg.right + 3, 0, _phoneNumTf.width, 40)];
    _IDCard.font = [UIFont systemFontOfSize:16.0];
    _IDCard.placeholder = @"请输入15或18位身份证号码";
    _IDCard.textAlignment = NSTextAlignmentLeft;
    [IDCardView addSubview:_IDCard];
    
    UIView *passWordView = [[UIView alloc]initWithFrame:CGRectMake(IDCardView.left, IDCardView.bottom + 10, 0.6 * IDCardView.width, 40)];
    passWordView.backgroundColor = [UIColor whiteColor];
    passWordView.layer.cornerRadius = 3;
    passWordView.layer.borderWidth = 0.5;
    passWordView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.view addSubview:passWordView];
    
    UIImageView *passWordImg = [[UIImageView alloc]initWithFrame:CGRectMake(2, 3, 25, 34)];
    passWordImg.backgroundColor = [UIColor orangeColor];
    [passWordView addSubview:passWordImg];
    
    _passWordTf = [[UITextField alloc]initWithFrame:CGRectMake(passWordImg.right + 3, 0, passWordView.width - passWordImg.width - 10, 40)];
    _passWordTf.font = [UIFont systemFontOfSize:16.0];
    _passWordTf.placeholder = @"请输入密码";
    _passWordTf.secureTextEntry = YES;
    _passWordTf.textAlignment = NSTextAlignmentLeft;
    [passWordView addSubview:_passWordTf];
    
    UIButton *showBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    showBtn.frame = CGRectMake(passWordView.right + 2, passWordView.top, phoneNumView.width - passWordView.width - 2, 40);
    showBtn.backgroundColor = [UIColor colorWithHex:0x1F9CA6];
    [showBtn setTitle:@"显示密码" forState:UIControlStateNormal];
    [showBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [showBtn addTarget:self action:@selector(showPassWord) forControlEvents:UIControlEventTouchUpInside];
    showBtn.layer.cornerRadius = 5;
    [self.view addSubview:showBtn];
    
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    registerBtn.frame = CGRectMake(phoneNumView.left, passWordView.bottom + 10, phoneNumView.width, 40);
    registerBtn.backgroundColor = [UIColor colorWithHex:0x1F9CA6];
    registerBtn.layer.cornerRadius = 5;
    [registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(registerBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerBtn];
    
    UIButton *agreeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    agreeBtn.frame = CGRectMake(registerBtn.left + 2, registerBtn.bottom + 8, 25, 25);
    agreeBtn.backgroundColor = [UIColor colorWithHex:0x1F9CA6];
    agreeBtn.layer.cornerRadius = 25/2;
    [agreeBtn addTarget:self action:@selector(agreeProtocol) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:agreeBtn];
    
    UILabel *textLabel = [[UILabel alloc]initWithFrame:CGRectMake(agreeBtn.right + 3, agreeBtn.top, registerBtn.width - agreeBtn.width, agreeBtn.height)];
    textLabel.text = @"我已阅读并同意<居家乐用户服务条款>";
    textLabel.textColor = [UIColor colorWithHex:0x1F9CA6];
    textLabel.font = [UIFont systemFontOfSize:13.0];
    textLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:textLabel];
}

- (void)showPassWord
{
    
}

- (void)registerBtnAction
{
    [ServerLoginOrRegister registerPostPhone:@"13425889426" Pass:@"123456" Id:@"440682199308164731"];
}

- (void)agreeProtocol
{
    
}
@end
