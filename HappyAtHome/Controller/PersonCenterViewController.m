//
//  PersonCenterViewController.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/10/30.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "PersonCenterViewController.h"
#import "PersonCenterTableViewCell.h"
#import "PersonCenterHeadTableViewCell.h"
#import "PersonOpetionViewController.h"
#import "PersonDataViewController.h"
#import "PersonOrderViewController.h"
#import "PersonCouponsViewController.h"
#import "PersonIntegrationViewController.h"
#import "UIColor+Hex.h"

@interface PersonCenterViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *PersonCenterTableView;

@property (strong, nonatomic) NSArray *CellTitleArray;
@property (strong, nonatomic) NSArray *CellTitleImageNameArray;
@end

@implementation PersonCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self SetFixedData];
    [self SetNavigation];
    // Do any additional setup after loading the view.
}

- (void)SetFixedData
{
    _CellTitleArray = [[NSArray alloc] initWithObjects:@"个人资料",@"我的订单",@"我的养老券",@"积分兑换", nil];
    _CellTitleImageNameArray = [[NSArray alloc] initWithObjects:@"merchant_icon.png",@"my_order.png",@"my_fav.png",@"my_msg.png", nil];
}

- (void)SetNavigation
{
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHex:0xF37B9F];
    [self.navigationController.navigationBar setTitleTextAttributes:
    @{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    UIBarButtonItem *rightitem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(clickOpetion)];
    rightitem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightitem;
    self.tabBarController.tabBar.tintColor = [UIColor redColor];
}

- (void)clickOpetion
{
    PersonOpetionViewController *personopetionview = [self.storyboard instantiateViewControllerWithIdentifier:@"PersonOpetionViewController"];
    [self.navigationController pushViewController:personopetionview animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 120;
    }else
    {
        return 40;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row > 0)
    {
        PersonCenterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonCenterTableViewCell" forIndexPath:indexPath];
        cell.Title.text = [_CellTitleArray objectAtIndex:indexPath.row - 1];
        cell.TitleImageView.image = [UIImage imageNamed:[_CellTitleImageNameArray objectAtIndex:indexPath.row - 1]];
        return cell;
    }else
    {
        PersonCenterHeadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonCenterHeadTableViewCell"];
        cell.backgroundColor = [UIColor orangeColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 120)];
        imageview.image = [UIImage imageNamed:@"0.png"];
        [cell addSubview:imageview];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if (indexPath.row > 0)
    {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    switch (indexPath.row) {
        case 1:
            [self pushPersonDataView];
            break;
            
        case 2:
            [self pushPersonOrderView];
            break;
            
        case 3:
            [self pushPersonCouponsView];
            break;
            
        default:
            [self pushPersonIntegrationView];
            break;
    }
}

- (void)pushPersonDataView
{
    PersonDataViewController *persondataview = [self.storyboard instantiateViewControllerWithIdentifier:@"PersonDataViewController"];
    [self.navigationController pushViewController:persondataview animated:YES];
}

- (void)pushPersonOrderView
{
    PersonOrderViewController *personorderview = [self.storyboard instantiateViewControllerWithIdentifier:@"PersonOrderViewController"];
    [self.navigationController pushViewController:personorderview animated:YES];
}

- (void)pushPersonCouponsView
{
    PersonCouponsViewController *personcouponsview = [self.storyboard instantiateViewControllerWithIdentifier:@"PersonCouponsViewController"];
    [self.navigationController pushViewController:personcouponsview animated:YES];
}

- (void)pushPersonIntegrationView
{
    PersonIntegrationViewController *personintegrationview = [self.storyboard instantiateViewControllerWithIdentifier:@"PersonIntegrationViewController"];
    [self.navigationController showViewController:personintegrationview sender:nil];
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
