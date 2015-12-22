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
#import "MJRefresh.h"
#import "ShopGoodsViewController.h"

@interface ShopViewController () <UITableViewDataSource,UITableViewDelegate,scrollDelegate,UIGestureRecognizerDelegate>
{
    UIScrollView *_goodsscrollview;
}
@property (weak, nonatomic) IBOutlet UITableView *TableView;
@property (strong, nonatomic) ScrollImageCube *cube;

@property (strong, nonatomic) NSArray *typeArray;
@property (strong, nonatomic) NSArray *typeTitleArray;
@property (strong, nonatomic) NSArray *goodsImgArray;
@property (strong, nonatomic) NSArray *goodsShowArray;
@property (strong, nonatomic) NSArray *goodsOldManArray;
//@property (strong, nonatomic) NSArray 
@end

@implementation ShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigation];
    [self setFixedData];
    [self loadTableView];
}

- (void)viewDidAppear:(BOOL)animated
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ReloadTableView Or Data

- (void)loadTableView
{
    // 下拉刷新
    _TableView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 结束刷新
        [_TableView.mj_header endRefreshing];
    }];
    
    _TableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
}

- (void)loadNewData
{
    [self setFixedData];
    [_TableView.mj_header endRefreshing];
}

#pragma mark UI Or Data

- (void)setFixedData
{
    _typeArray = [NSArray arrayWithObjects:@"local_sort_main_movie.png",@"local_navi_tuan.png",@"local_sort_main_park.png",@"local_sort_main_food.png", nil];
    [ServerShopping goodsPost:^(NSDictionary *goodsarray) {
        _goodsImgArray = [ShopModel instanceArrayDictFromArray:[goodsarray objectForKey:@"1"]];
        _goodsShowArray = [ShopModel instanceArrayDictFromArray:[goodsarray objectForKey:@"2"]];
        _goodsOldManArray = [ShopModel instanceArrayDictFromArray:[goodsarray objectForKey:@"3"]];
        [_TableView reloadData];
    }];
    _typeTitleArray = [NSArray arrayWithObjects:@"商品分类",@"购物车",@"我的收藏",@"充值中心", nil];
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
    _goodsscrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 1, ScreenSize.width, 95)];
    _goodsscrollview.showsHorizontalScrollIndicator = NO;
    if (indexPath.section == 0)
    {
        _goodsscrollview.contentSize = CGSizeMake(90 * [_goodsShowArray count] - 5, 95);
        for (int i = 0; i < [_goodsShowArray count]; i ++) {
            UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(90 * i, 0, 85, 85)];
            ShopModel *model = [_goodsShowArray objectAtIndex:i];
            [imageview sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ServerImgURL,model.image]]];
            
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(90 * i, 0, 85, 85)];
            button.tag = TagButton(1000 + i);
            button.backgroundColor = [UIColor clearColor];
            [button addTarget:self action:@selector(clickGoods:) forControlEvents:UIControlEventTouchUpInside];
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(90 * i, 85, 85, 10)];
            label.text = [NSString stringWithFormat:@"%.1f",model.price];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor redColor];
            label.font = [UIFont systemFontOfSize:10];
            [_goodsscrollview addSubview:label];
            [_goodsscrollview addSubview:button];
            [_goodsscrollview addSubview:imageview];
        }
    }else
    {
        _goodsscrollview.contentSize = CGSizeMake(90 * [_goodsOldManArray count] - 5, 95);
        for (int i = 0; i < [_goodsOldManArray count]; i ++) {
            UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(90 * i, 0, 85, 85)];
            ShopModel *model = [_goodsOldManArray objectAtIndex:i];
            [imageview sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ServerImgURL,model.image]]];
            
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(90 * i, 0, 85, 85)];
            button.tag = TagButton(2000 + i);
            button.backgroundColor = [UIColor clearColor];
            [button addTarget:self action:@selector(clickGoods:) forControlEvents:UIControlEventTouchUpInside];
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(90 * i, 85, 85, 10)];
            label.text = [NSString stringWithFormat:@"%.1f",model.price];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor redColor];
            label.font = [UIFont systemFontOfSize:10];
            [_goodsscrollview addSubview:label];
            [_goodsscrollview addSubview:button];
            [_goodsscrollview addSubview:imageview];
        }
    }

    [cell addSubview:_goodsscrollview];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
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
        return (ScreenSize.width - 80) / 4 + 180;
    }else
    {
        return 20;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, ([UIScreen mainScreen].bounds.size.width - 80) / 4 + 190)];
        for (int i = 0; i < 4; i ++) {
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10 + i * (20 + (ScreenSize.width - 80) / 4), 120, (ScreenSize.width - 80) / 4, (ScreenSize.width - 80) / 4)];
            [button setImage:[UIImage imageNamed:[_typeArray objectAtIndex:i]] forState:UIControlStateNormal];
            button.layer.masksToBounds = YES;
            button.layer.cornerRadius = button.frame.size.width / 2;
            button.tag = TagButton(i);
            [button addTarget:self action:@selector(clickTypeButton:) forControlEvents:UIControlEventTouchUpInside];
            [view addSubview:button];
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(button.frame.origin.x, 125 + button.frame.size.height, button.frame.size.width, 20)];
            label.text = [_typeTitleArray objectAtIndex:i];
            label.font = [UIFont systemFontOfSize:13];
            label.textAlignment = NSTextAlignmentCenter;
            [view addSubview:label];
        }
        
        _cube = [[ScrollImageCube alloc] initWithFrame:CGRectMake(0, 0, ScreenSize.width, 110) ImageArray:_goodsImgArray];
        _cube.delegate = self;
        [view addSubview:_cube];
        
        UIView *titleview = [[UIView alloc] initWithFrame:CGRectMake(0, (ScreenSize.width - 80) / 4 + 160, ScreenSize.width, 20)];
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(10, 3.5, 13, 13)];
        imageview.image = [UIImage imageNamed:@"home_shopping_icon.png"];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(35, 0, 100, 20)];
        label.text = @"专题展示";
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
        label.text = @"老人特惠";
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

#pragma  mark ClickResponse

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

- (void)clickAdvertisement:(NSInteger)index
{
    NSLog(@"%ld",index);
}

- (void)clickGoods:(UIButton *)btn
{
    ShopGoodsViewController *shopgoodsview = [self.storyboard instantiateViewControllerWithIdentifier:@"ShopGoodsViewController"];
    if (btn.tag < TagButton(2000))
    {
//        NSLog(@"%ld %ld %ld",TagButton(1000) - btn.tag, btn.tag - (TagButton(1000)), btn.tag);
        [shopgoodsview getShopGoodsModel:[_goodsShowArray objectAtIndex:btn.tag - (TagButton(1000))]];
    }else
    {
        NSLog(@"%ld",btn.tag);
        [shopgoodsview getShopGoodsModel:[_goodsOldManArray objectAtIndex:btn.tag - (TagButton(2000))]];
    }
    [self.navigationController pushViewController:shopgoodsview animated:YES];
    [self.tabBarController.tabBar setHidden:YES];
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
