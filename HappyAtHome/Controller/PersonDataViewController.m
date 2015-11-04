//
//  PersonDataViewController.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/10/31.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "PersonDataViewController.h"
#import "PersonDataChangeViewController.h"

@interface PersonDataViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) NSArray *TitleArray;
@end

@implementation PersonDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self SetFixedData];
    [self SetNavigation];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)SetFixedData
{
    _TitleArray = [[NSArray alloc] initWithObjects:@"头像",@"账号",@"性别",@"呢称",@"积分",@"我的地址",@"个性签名",@"地区", nil];
}

- (void)SetNavigation
{
    self.title = @"个人资料";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 5;
    }else
    {
        return 3;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }
    cell.textLabel.text = [_TitleArray objectAtIndex:indexPath.row + indexPath.section * 5];
    if (!(indexPath.section == 0 && (indexPath.row == 1 || indexPath.row == 4))) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else{
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    PersonDataChangeViewController *persondatachangeview = [self.storyboard instantiateViewControllerWithIdentifier:@"PersonDataChangeViewController"];
    switch (indexPath.row + indexPath.section * 5) {
        case 2:
            [persondatachangeview TypeOfTableView:ViewTypeSex];
            [self.navigationController pushViewController:persondatachangeview animated:YES];
            break;
            
        case 6:
            [persondatachangeview TypeOfTableView:ViewTypeSign];
            [self.navigationController pushViewController:persondatachangeview animated:YES];
            break;
            
        case 7:
            [persondatachangeview TypeOfTableView:ViewTypeArea];
            [self.navigationController pushViewController:persondatachangeview animated:YES];
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
