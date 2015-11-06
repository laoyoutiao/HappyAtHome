//
//  PersonCouponsViewController.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/5.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "PersonCouponsViewController.h"
#import "UIColor+Hex.h"

typedef NS_ENUM(NSInteger, TypeBtn)
{
    UnUseTypeBtn = 0,
    UseTypeBtn = 1,
    TimeOutTypeBtn = 2
};

@interface PersonCouponsViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *TableView;
@property (weak, nonatomic) IBOutlet UIView *TitleButtonView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *TitleButtonViewTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *TableViewTop;
@property (strong, nonatomic) NSArray *DataArray;
@property (strong, nonatomic) UIButton *UnUseBtn;
@property (strong, nonatomic) UIButton *UseBtn;
@property (strong, nonatomic) UIButton *TimeOutBtn;
@end

@implementation PersonCouponsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self SetNavigation];
    [self SetFixedData];
    [self SetTitleView];
    // Do any additional setup after loading the view.
}

- (void)SetFixedData
{
    //默认 使用
    
}

- (void)SetTitleView
{
    _TitleButtonView.layer.masksToBounds = YES;
    _TitleButtonView.layer.cornerRadius = 5;
    _TitleButtonView.layer.borderColor = [UIColor colorWithHex:0x8ECAFC].CGColor;
    _TitleButtonView.layer.borderWidth = 2;
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, (self.view.frame.size.width - 20) / 3, 4);
    CGPathAddLineToPoint(path, NULL, (self.view.frame.size.width - 20) / 3, _TableViewTop.constant - _TitleButtonViewTop.constant - 4);
    CGPathMoveToPoint(path, NULL, (self.view.frame.size.width - 20) /3 * 2, 4);
    CGPathAddLineToPoint(path, NULL, (self.view.frame.size.width - 20) / 3* 2, _TableViewTop.constant - _TitleButtonViewTop.constant - 4);
    CAShapeLayer *masklayer = [CAShapeLayer layer];
    masklayer.path = path;
    masklayer.strokeColor = [UIColor colorWithHex:0x93C4EC].CGColor;
    masklayer.frame = _TitleButtonView.frame;
    [_TitleButtonView.layer addSublayer:masklayer];
    
    _UnUseBtn = [[UIButton alloc] init];
    _UseBtn = [[UIButton alloc] init];
    _TimeOutBtn = [[UIButton alloc] init];
    [self SetTypeButtonWithTitle:_UnUseBtn Type:UnUseTypeBtn];
    [self SetTypeButtonWithTitle:_UseBtn Type:UseTypeBtn];
    [self SetTypeButtonWithTitle:_TimeOutBtn Type:TimeOutTypeBtn];
}

- (void)SetTypeButtonWithTitle:(UIButton *)btn Type:(TypeBtn)type
{
    switch (type) {
        case 0:
            btn.frame = CGRectMake(0, 0, (self.view.frame.size.width - 20) / 3, _TableViewTop.constant - _TitleButtonViewTop.constant);
            btn.tag = 100;
            [btn setTitleColor:[UIColor colorWithHex:0x8ECAFC] forState:UIControlStateNormal];
            [btn setTitle:@"未使用" forState:UIControlStateNormal];
            break;
            
        case 1:
            btn.frame = CGRectMake((self.view.frame.size.width - 20) / 3, 0, (self.view.frame.size.width - 20) / 3, _TableViewTop.constant - _TitleButtonViewTop.constant);
            btn.tag = 101;
            [btn setTitle:@"已使用" forState:UIControlStateNormal];
            break;
            
        case 2:
            btn.frame =CGRectMake((self.view.frame.size.width - 20) / 3 * 2, 0, (self.view.frame.size.width - 20) / 3, _TableViewTop.constant - _TitleButtonViewTop.constant);
            btn.tag = 102;
            [btn setTitle:@"已过期" forState:UIControlStateNormal];
            break;
            
        default:
            break;
    }
    
    [btn addTarget:self action:@selector(clickTitleBtn:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    [_TitleButtonView addSubview:btn];
}

- (void)clickTitleBtn:(UIButton *)btn
{
    [btn setTitleColor:[UIColor colorWithHex:0x8ECAFC] forState:UIControlStateNormal];
    switch (btn.tag) {
        case 100:
            //未使用
            [_UseBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [_TimeOutBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            break;
            
        case 101:
            //使用
            [_UnUseBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [_TimeOutBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            break;
            
        case 102:
            //过期
            [_UseBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [_UnUseBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            break;
            
        default:
            break;
    }
    [_TableView reloadData];
}

- (void)SetNavigation
{
    self.title = @"我的养老券";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_DataArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
