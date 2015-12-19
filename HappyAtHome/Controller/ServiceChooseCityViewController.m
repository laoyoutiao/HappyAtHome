//
//  ChooseCityViewController.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/11.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "ServiceChooseCityViewController.h"

@interface ServiceChooseCityViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *TableView;

@property (strong, nonatomic) NSArray *OpenArray;
@end

@implementation ServiceChooseCityViewController

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

- (void)setFixedData
{
    _OpenArray = [[NSArray alloc] initWithObjects:@"深圳市", @"佛山市", @"广州市", nil];
}

- (void)setNavigation
{
    self.title = @"城市选择";
}

#pragma mark TableViewDelegate Or DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
            
        case 1:
            return [_OpenArray count];
            break;
            
        default:
            return 0;
            break;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 44)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, tableView.frame.size.width - 15, 44)];
    [view addSubview:label];
    label.font = [UIFont systemFontOfSize:13];
    switch (section) {
        case 0:
            label.text = @"GPS定位城市";
            break;
            
        case 1:
            label.text = @"已开通服务的城市";
            break;
            
        default:
            break;
    }
    return view;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 1)];
    view.backgroundColor = [UIColor grayColor];
    if (section == 0) {
        return view;
    }else
    {
        return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }
    if (indexPath.section == 0) {
        cell.textLabel.text = @"佛山市";
    }else
    {
        cell.textLabel.text = [_OpenArray objectAtIndex:indexPath.row];
    }
    return cell;
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
