//
//  EnterViewController.m
//  华润水泥
//
//  Created by isec on 15/11/3.
//  Copyright © 2015年 isec. All rights reserved.
//

#import "EnterViewController.h"
#import "RegisterViewController.h"
#import "UIView+Additions.h"
#import "UIColor+Hex.h"

#define BACKGROUNDCOLOR [UIColor colorWithRed:239/255.0 green:125/255.0 blue:159/255.0 alpha:1.0]
@interface EnterViewController ()
{
    UITextField *_phoneNumTf;
    UITextField *_passWordTf;
}
@end

@implementation EnterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = BACKGROUNDCOLOR;
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
    
    UIView *passWordView = [[UIView alloc]initWithFrame:CGRectMake(phoneNumView.left, phoneNumView.bottom + 10, 0.6 * phoneNumView.width, 40)];
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
    [showBtn addTarget:self action:@selector(showPassWord:) forControlEvents:UIControlEventTouchUpInside];
    showBtn.layer.cornerRadius = 5;
    [self.view addSubview:showBtn];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame = CGRectMake(phoneNumView.left, passWordView.bottom + 10, phoneNumView.width, 40);
    loginBtn.backgroundColor = [UIColor colorWithHex:0x1F9CA6];
    loginBtn.layer.cornerRadius = 5;
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    UIButton *forgetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    forgetBtn.frame = CGRectMake(loginBtn.right - 80, loginBtn.bottom + 10, 70, 30);
    forgetBtn.backgroundColor = [UIColor clearColor];
    [forgetBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    [forgetBtn setTitleColor:[UIColor colorWithHex:0x1F9CA6] forState:UIControlStateNormal];
    forgetBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [forgetBtn addTarget:self action:@selector(forgetWord) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgetBtn];
}
#pragma mark BtnAction
- (void)showPassWord:(UIButton *)btn
{
    _passWordTf.secureTextEntry = !_passWordTf.secureTextEntry;
    if (!_passWordTf.secureTextEntry) {
        [btn setTitle:@"隐藏密码" forState:UIControlStateNormal];
    }else
    {
        [btn setTitle:@"显示密码" forState:UIControlStateNormal];
    }
}
- (void)login
{
    if (_passWordTf != nil && _phoneNumTf != nil) {
        [ServerLoginOrRegister loginPostPhone:_phoneNumTf.text Pass:_passWordTf.text Block:^(NSDictionary *logindict) {
            NSLog(@"%@",logindict);
        }];
    }
}
- (void)forgetWord
{
    
}
@end
