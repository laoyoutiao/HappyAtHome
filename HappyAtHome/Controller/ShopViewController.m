//
//  ShopViewController.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/16.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "ShopViewController.h"
#import "ScrollImageCube.h"
#import "ShopSortViewController.h"
#import "MyHeader.h"
#import "ServerHeader.h"
#import "ModelHeader.h"
#import "UIImageView+WebCache.h"

@interface ShopViewController () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *ScorllView;
@property (strong, nonatomic) ScrollImageCube *cube;

@property (strong, nonatomic) NSArray *typeArray;
@property (strong, nonatomic) NSArray *typeTitleArray;
@property (strong, nonatomic) NSArray *goodsImgArray;
//@property (strong, nonatomic) NSArray 
@end

@implementation ShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigation];
    [self setFixedData];
}

- (void)viewDidAppear:(BOOL)animated
{
    
}

- (void)setScorll
{
    if (!_cube) {
        _cube = [[ScrollImageCube alloc] initWithFrame:CGRectMake(0, 0, _ScorllView.frame.size.width, _ScorllView.frame.size.height) ImageArray:_goodsImgArray];
        [_ScorllView addSubview:_cube];
    }
}

- (void)setFixedData
{
    _typeArray = [NSArray arrayWithObjects:@"local_sort_main_movie.png",@"local_navi_tuan.png",@"local_sort_main_park.png",@"local_sort_main_food.png", nil];
    [ServerShopping goodsPost:^(NSDictionary *goodsarray) {
        _goodsImgArray = [ShopImgModel instanceArrayDictFromArray:[goodsarray objectForKey:@"1"]];
        [self setScorll];
    }];
    _typeTitleArray = [NSArray arrayWithObjects:@"商品分类",@"购物车",@"我的收藏",@"充值中心", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setNavigation
{
    self.title = @"商城";
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHex:0xF37B9F];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.tabBarController.tabBar.tintColor = [UIColor redColor];
}

#pragma mark TableViewDelegate or Datasource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    tableView.scrollEnabled = NO;
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return (ScreenSize.width - 80) / 4 + 70;
    }else
    {
        return 20;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, ([UIScreen mainScreen].bounds.size.width - 80) / 4 + 80)];
        for (int i = 0; i < 4; i ++) {
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10 + i * (20 + (ScreenSize.width - 80) / 4), 10, (ScreenSize.width - 80) / 4, (ScreenSize.width - 80) / 4)];
            [button setImage:[UIImage imageNamed:[_typeArray objectAtIndex:i]] forState:UIControlStateNormal];
            button.layer.masksToBounds = YES;
            button.layer.cornerRadius = button.frame.size.width / 2;
            button.tag = TagButton(i);
            [button addTarget:self action:@selector(clickTypeButton:) forControlEvents:UIControlEventTouchUpInside];
            [view addSubview:button];
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(button.frame.origin.x, 15 + button.frame.size.height, button.frame.size.width, 20)];
            label.text = [_typeTitleArray objectAtIndex:i];
            label.font = [UIFont systemFontOfSize:13];
            label.textAlignment = NSTextAlignmentCenter;
            [view addSubview:label];
        }
        
        UIView *titleview = [[UIView alloc] initWithFrame:CGRectMake(0, (ScreenSize.width - 80) / 4 + 50, ScreenSize.width, 20)];
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(10, 3.5, 13, 13)];
        imageview.image = [UIImage imageNamed:@"home_shopping_icon.png"];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(35, 0, 100, 20)];
        label.text = [_typeTitleArray objectAtIndex:section];
        label.font = [UIFont systemFontOfSize:11];
        [titleview addSubview:imageview];
        [titleview addSubview:label];
        [view addSubview:titleview];
        titleview.backgroundColor = [UIColor grayColor];
        return view;
    }else
    {
        UIView *titleview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenSize.width, 20)];
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(10, 3.5, 13, 13)];
        imageview.image = [UIImage imageNamed:@"home_shopping_icon.png"];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(35, 0, 100, 20)];
        label.text = [_typeTitleArray objectAtIndex:section];
        label.font = [UIFont systemFontOfSize:11];
        [titleview addSubview:imageview];
        [titleview addSubview:label];
        titleview.backgroundColor = [UIColor grayColor];
        return titleview;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

#pragma  mark Button Methods

- (void)clickTypeButton:(UIButton *)btn
{
    switch (btn.tag) {
        case TagButton(0):
            [self pushShopSortView];
            break;
            
        default:
            break;
    }
}

- (void)pushShopSortView
{
    ShopSortViewController *shopsortview = [self.storyboard instantiateViewControllerWithIdentifier:@"ShopSortViewController"];
    [self.navigationController showViewController:shopsortview sender:nil];
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
