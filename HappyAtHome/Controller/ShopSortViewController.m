//
//  ShopSortViewController.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/19.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "ShopSortViewController.h"
#import "MyHeader.h"

typedef NS_ENUM(NSInteger, TypeBtn)
{
    GoodsTypeBtn = 0,
    PriceTypeBtn = 1,
    SalesTypeBtn = 2
};

@interface ShopSortViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_goodsArray;
    UIButton *GoodsBtn;
    UIButton *PriceBtn;
    UIButton *SalesBtn;
}

@end

@implementation ShopSortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigation];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UI Or Data

- (void)setNavigation
{
    self.title = @"商城分类";
}

- (void)getGoodsModel:(NSArray *)goodsarray
{
    _goodsArray = goodsarray;
}

#pragma mark TableViewDelegate Or DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ceilf([_goodsArray count] / 2);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenSize.width, 30)];
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 5;
    view.layer.borderColor = [UIColor colorWithHex:0x8ECAFC].CGColor;
    view.layer.borderWidth = 2;
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, (self.view.frame.size.width - 20) / 3, 2);
    CGPathAddLineToPoint(path, NULL, (self.view.frame.size.width - 20) / 3,  28);
    CGPathMoveToPoint(path, NULL, (self.view.frame.size.width - 20) /3 * 2, 2);
    CGPathAddLineToPoint(path, NULL, (self.view.frame.size.width - 20) / 3* 2, 28);
    CAShapeLayer *masklayer = [CAShapeLayer layer];
    masklayer.path = path;
    masklayer.strokeColor = [UIColor colorWithHex:0x93C4EC].CGColor;
    masklayer.frame = view.frame;
    [view.layer addSublayer:masklayer];
    
    GoodsBtn = [[UIButton alloc] init];
    PriceBtn = [[UIButton alloc] init];
    SalesBtn = [[UIButton alloc] init];
    [view addSubview:[self setTypeButtonWithTitle:GoodsBtn Type:GoodsTypeBtn]];
    [view addSubview:[self setTypeButtonWithTitle:PriceBtn Type:PriceTypeBtn]];
    [view addSubview:[self setTypeButtonWithTitle:SalesBtn Type:SalesTypeBtn]];

    return view;
}

- (UIButton *)setTypeButtonWithTitle:(UIButton *)btn Type:(TypeBtn)type
{
    switch (type) {
        case 0:
            btn.frame = CGRectMake(0, 0, (self.view.frame.size.width - 20) / 3, 30);
            btn.tag = 100;
            [btn setTitleColor:[UIColor colorWithHex:0x8ECAFC] forState:UIControlStateNormal];
            [btn setTitle:@"待发货" forState:UIControlStateNormal];
            break;
            
        case 1:
            btn.frame = CGRectMake((self.view.frame.size.width - 20) / 3, 0, (self.view.frame.size.width - 20) / 3, 30);
            btn.tag = 101;
            [btn setTitle:@"派送中" forState:UIControlStateNormal];
            break;
            
        case 2:
            btn.frame = CGRectMake((self.view.frame.size.width - 20) / 3 * 2, 0, (self.view.frame.size.width - 20) / 3, 30);
            btn.tag = 102;
            [btn setTitle:@"已签收" forState:UIControlStateNormal];
            break;
            
        default:
            break;
    }
    
    [btn addTarget:self action:@selector(clickTitleBtn:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    return btn;
}

#pragma mark ClickResponse

- (void)clickTitleBtn:(UIButton *)btn
{
    [btn setTitleColor:[UIColor colorWithHex:0x8ECAFC] forState:UIControlStateNormal];
    switch (btn.tag) {
        case 100:
            //发货数据
            [_SendBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [_GiveBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            break;
            
        case 101:
            //派送数据
            [_WaitBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [_GiveBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            break;
            
        case 102:
            //完成数据
            [_SendBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [_WaitBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            break;
            
        default:
            break;
    }
    [_TableView reloadData];
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
