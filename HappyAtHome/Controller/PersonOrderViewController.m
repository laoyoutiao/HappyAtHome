//
//  PersonOrderViewController.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/3.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "PersonOrderViewController.h"
#import "UIColor+Hex.h"

typedef NS_ENUM(NSInteger, TypeBtn)
{
    WaitTypeBtn = 0,
    SendTypeBtn = 1,
    GiveTypeBtn = 2
};

@interface PersonOrderViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *TitleButtonView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *TitleButtonViewTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *TableViewTop;
@property (strong, nonatomic) UIButton *waitBtn;
@property (strong, nonatomic) UIButton *SendBtn;
@property (strong, nonatomic) UIButton *GiveBtn;
@end

@implementation PersonOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self SetNavigation];
    [self SetFixedData];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)SetFixedData
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
    
    [self SetTypeButtonWithTitle:_waitBtn Type:WaitTypeBtn];
    [self SetTypeButtonWithTitle:_SendBtn Type:SendTypeBtn];
    [self SetTypeButtonWithTitle:_GiveBtn Type:GiveTypeBtn];
    
}

- (void)SetTypeButtonWithTitle:(UIButton *)btn Type:(TypeBtn)type
{
    switch (type) {
        case 0:
            btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, (self.view.frame.size.width - 20) / 3, _TableViewTop.constant - _TitleButtonViewTop.constant)];
            [btn setTitle:@"待发货" forState:UIControlStateNormal];
            break;
            
        case 1:
            btn = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 20) / 3, 0, (self.view.frame.size.width - 20) / 3, _TableViewTop.constant - _TitleButtonViewTop.constant)];
            [btn setTitle:@"派送中" forState:UIControlStateNormal];
            break;
            
        case 2:
            btn = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 20) / 3 * 2, 0, (self.view.frame.size.width - 20) / 3, _TableViewTop.constant - _TitleButtonViewTop.constant)];
            [btn setTitle:@"已签收" forState:UIControlStateNormal];
            break;
            
        default:
            break;
    }
    
    [_TitleButtonView addSubview:btn];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
}

- (void)SetNavigation
{
    self.title = @"我的订单";
}

- (void)SetTitleButton
{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
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
    UIImageView *imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
    imageview.center = CGPointMake(5 + imageview.frame.size.width / 2, 5 + imageview.frame.size.height / 2);
    [cell addSubview:imageview];
    UILabel *ordernumLbl = [[UILabel alloc] initWithFrame:CGRectMake(10 + imageview.frame.size.width, 5, cell.frame.size.width - 10 - imageview.frame.size.width, imageview.frame.size.height / 3)];
    ordernumLbl.text = @"订单编号";
    [cell addSubview:ordernumLbl];
    UILabel *priceLbl = [[UILabel alloc] initWithFrame:CGRectMake(ordernumLbl.frame.origin.x, 5 + ordernumLbl.frame.origin.y, ordernumLbl.frame.size.width, ordernumLbl.frame.size.height)];
    priceLbl.text = @"价钱";
    [cell addSubview:ordernumLbl];
    UILabel *timeLbl = [[UILabel alloc] initWithFrame:CGRectMake(ordernumLbl.frame.origin.x, 5 + priceLbl.frame.origin.y, ordernumLbl.frame.size.width, ordernumLbl.frame.size.height)];
    timeLbl.text = @"时间";
    [cell addSubview:ordernumLbl];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
