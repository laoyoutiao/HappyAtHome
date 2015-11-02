//
//  PersonDataChangeViewController.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/2.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "PersonDataChangeViewController.h"

@interface PersonDataChangeViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) NSArray *TitleArray;
@property (strong, nonatomic) NSArray *AreaArray;
@property (strong, nonatomic) NSArray *SexArray;

@end

@implementation PersonDataChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)SetNavigation
{
    self.title = @"个人资料";
}

- (void)SetFixedData
{
    _TitleArray = [[NSArray alloc] initWithObjects:@"头像",@"账号",@"性别",@"呢称",@"积分",@"我的地址",@"个性签名",@"地区", nil];
}

- (void)TypeOfTableView:(ViewType *)viewType
{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_TitleArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }
    cell.textLabel.text = [_TitleArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
