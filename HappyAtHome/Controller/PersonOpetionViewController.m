//
//  PersonOpetionViewController.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/10/31.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "PersonOpetionViewController.h"
#import "PersonOpetionTableViewCell.h"

@interface PersonOpetionViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *PersonOpetionTableView;

@property (strong, nonatomic) NSArray *TitleArray;
@end

@implementation PersonOpetionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setFixedData];
    [self setNavigation];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setFixedData
{
    _TitleArray = [[NSArray alloc] initWithObjects:@"接收通知",@"服务范围",@"投诉与建议",@"版本",@"关于我们", nil];
}

- (void)setNavigation
{
    self.title = @"设置";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
            
        case 1:
            return 1;
            break;
            
        case 2:
            return 3;
            break;
            
        case 3:
            return 1;
            break;
            
        default:
            return 0;
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        PersonOpetionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonOpetionTableViewCell"];
        cell.textLabel.text = [_TitleArray objectAtIndex:indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
        }
        if (indexPath.section < 3) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = [_TitleArray objectAtIndex:indexPath.row + indexPath.section];
        }else
        {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height)];
            label.text = @"退出登录";
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor redColor];
            label.font = [UIFont systemFontOfSize:18];
            [cell addSubview:label];
        }
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.5;
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
