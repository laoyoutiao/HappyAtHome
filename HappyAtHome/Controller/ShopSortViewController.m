//
//  ShopSortViewController.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/19.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "ShopSortViewController.h"
#import "MyHeader.h"
#import "ModelHeader.h"
#import "UIImageView+WebCache.h"
#import "ServerHeader.h"
#import "ShopGoodsViewController.h"

typedef NS_ENUM(NSInteger, TypeBtn)
{
    GoodsTypeBtn = 0,
    PriceTypeBtn = 1,
    SalesTypeBtn = 2
};

@interface ShopSortViewController ()<UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate>
{
    NSArray *_goodsArray;
    UIButton *GoodsBtn;
    UIButton *PriceBtn;
    UIButton *SalesBtn;
}
@property (weak, nonatomic) IBOutlet UITableView *TableView;

@end

@implementation ShopSortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigation];
    [self setFixedData];
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

- (void)setFixedData
{
    
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
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    else
    {
        while ([cell.contentView.subviews lastObject] != nil)
        {
            [(UIView*)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    
    ShopModel *leftmodel = [_goodsArray objectAtIndex:indexPath.row * 2];
    [cell.contentView addSubview:[self setCellViewModel:leftmodel LeftOrRigth:1]];
    
    ShopModel *rightmodel = [_goodsArray objectAtIndex:indexPath.row * 2 + 1];
    [cell.contentView addSubview:[self setCellViewModel:rightmodel LeftOrRigth:0]];
    
    UITapGestureRecognizer *tapgesturerecongnizer = [[UITapGestureRecognizer alloc] init];
    [tapgesturerecongnizer addTarget:self action:@selector(clickCell:)];
    tapgesturerecongnizer.numberOfTapsRequired = 1;
    [cell addGestureRecognizer:tapgesturerecongnizer];
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
    CGPathMoveToPoint(path, NULL, (self.view.frame.size.width) / 3, 2);
    CGPathAddLineToPoint(path, NULL, (self.view.frame.size.width) / 3,  28);
    CGPathMoveToPoint(path, NULL, (self.view.frame.size.width) /3 * 2, 2);
    CGPathAddLineToPoint(path, NULL, (self.view.frame.size.width) / 3* 2, 28);
    CAShapeLayer *masklayer = [CAShapeLayer layer];
    masklayer.path = path;
    masklayer.strokeColor = [UIColor colorWithHex:0x93C4EC].CGColor;
    masklayer.frame = view.frame;
    [view.layer addSublayer:masklayer];
    
    GoodsBtn = [self setTypeButtonWithTitle:GoodsBtn Type:GoodsTypeBtn];
    PriceBtn = [self setTypeButtonWithTitle:PriceBtn Type:PriceTypeBtn];
    SalesBtn = [self setTypeButtonWithTitle:SalesBtn Type:SalesTypeBtn];
    [view addSubview:GoodsBtn];
    [view addSubview:PriceBtn];
    [view addSubview:SalesBtn];
    view.backgroundColor = [UIColor whiteColor];
    return view;
}



#pragma mark Method

- (UIButton *)setTypeButtonWithTitle:(UIButton *)btn Type:(TypeBtn)type
{
    btn = [[UIButton alloc] init];
    switch (type) {
        case 0:
            btn.frame = CGRectMake(0, 0, (self.view.frame.size.width) / 3, 30);
            btn.tag = TagButton(0);
            [btn setTitleColor:[UIColor colorWithHex:0x8ECAFC] forState:UIControlStateNormal];
            [btn setTitle:@"商品分类" forState:UIControlStateNormal];
            break;
            
        case 1:
            btn.frame = CGRectMake((self.view.frame.size.width) / 3, 0, (self.view.frame.size.width) / 3, 30);
            btn.tag = TagButton(1);
            [btn setTitle:@"商品价格" forState:UIControlStateNormal];
            [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -ScreenSize.width / 3 * 2 / 8, 0, 0)];
            [btn setImage:[UIImage imageNamed:@"groupon_detial_down_arrow"] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:@"groupon_detial_up_arrow"] forState:UIControlStateSelected];
            [btn setImageEdgeInsets:UIEdgeInsetsMake(13, ScreenSize.width / 3 * 6 / 8, 13, ScreenSize.width / 3 * 2 / 8 - 10)];
            break;
            
        case 2:
            btn.frame = CGRectMake((self.view.frame.size.width) / 3 * 2, 0, (self.view.frame.size.width) / 3, 30);
            btn.tag = TagButton(2);
            [btn setTitle:@"销量" forState:UIControlStateNormal];
            [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -ScreenSize.width / 3 * 2 / 8, 0, 0)];
            [btn setImage:[UIImage imageNamed:@"groupon_detial_down_arrow"] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:@"groupon_detial_up_arrow"] forState:UIControlStateSelected];
            [btn setImageEdgeInsets:UIEdgeInsetsMake(13, ScreenSize.width / 3 * 5 / 8, 13, ScreenSize.width / 3 * 3 / 8 - 10)];
            break;
            
        default:
            break;
    }
    
    [btn addTarget:self action:@selector(clickTitleBtn:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    return btn;
}

- (UIView *)setCellViewModel:(ShopModel *)model LeftOrRigth:(NSInteger)boool
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenSize.width, 200)];
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(boool? 0:ScreenSize.width / 2, 0, ScreenSize.width / 2, 120)];
    [imageview sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ServerImgURL,model.image]]];
    [view addSubview:imageview];
    
    UILabel *moneylbl = [[UILabel alloc] initWithFrame:CGRectMake(boool? 5:ScreenSize.width / 2 + 5, 120, ScreenSize.width / 2 - 5, 20)];
    moneylbl.text = [NSString stringWithFormat:@"￥%.1f",model.price];
    moneylbl.textColor = [UIColor redColor];
    moneylbl.font = [UIFont systemFontOfSize:12];
    [view addSubview:moneylbl];
    
    UILabel *introducelbl = [[UILabel alloc] initWithFrame:CGRectMake(boool? 5:ScreenSize.width / 2 + 5, 140, ScreenSize.width / 2 - 5, 50)];
    introducelbl.text = [NSString stringWithFormat:@"%@",model.goodsname];
    introducelbl.textColor = [UIColor blackColor];
    introducelbl.numberOfLines = 0;
    introducelbl.font = [UIFont systemFontOfSize:12];
    [view addSubview:introducelbl];
    
    UILabel *countlbl = [[UILabel alloc] initWithFrame:CGRectMake(boool? 5:ScreenSize.width / 2 + 5, 190, ScreenSize.width / 2 - 5, 10)];
    countlbl.text = [NSString stringWithFormat:@"%ld人已付款",model.salesvolume];
    countlbl.textColor = [UIColor grayColor];
    countlbl.font = [UIFont systemFontOfSize:10];
    [view addSubview:countlbl];
    return view;
}

#pragma mark ClickResponse

- (void)clickCell:(UIGestureRecognizer *)gesturerecognizer
{
    NSInteger num = (NSInteger)[gesturerecognizer locationInView:_TableView].y / 200 * 2 + ([gesturerecognizer locationInView:_TableView].x < (ScreenSize.width / 2)? 0:1);
    ShopGoodsViewController *shopgoodsview = [self.storyboard instantiateViewControllerWithIdentifier:@"ShopGoodsViewController"];
    ShopModel *model = [_goodsArray objectAtIndex:num];
    [shopgoodsview getShopGoodsModel:model];
    [self.navigationController pushViewController:shopgoodsview animated:YES];
}

- (void)clickTitleBtn:(UIButton *)btn
{
    btn.selected = !btn.selected;
    switch (btn.tag) {
        case TagButton(0):
            //商品分类
            
            break;
            
        case TagButton(1):
            //商品价格
            [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -ScreenSize.width / 3 * 2 / 8 + (btn.selected? 1:0), 0, 0)];
            break;
            
        case TagButton(2):
            //销量
            [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -ScreenSize.width / 3 * 2 / 8 + (btn.selected? 1:0), 0, 0)];
            break;
            
        default:
            break;
    }
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
