//
//  ActivityDetailViewController.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/13.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "ActivityDetailViewController.h"
#import "ActivityBookViewController.h"

@interface ActivityDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *ActivityNameLbl;
@property (weak, nonatomic) IBOutlet UILabel *AddressLbl;
@property (weak, nonatomic) IBOutlet UILabel *TimeLbl;
@property (weak, nonatomic) IBOutlet UILabel *ContentsLbl;
@property (weak, nonatomic) IBOutlet UILabel *CountLbl;
@property (strong, nonatomic) ActivityTableViewCell *cell;

@end

@implementation ActivityDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setDetailMessage];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setDetailMessage
{
    _ActivityNameLbl.text = _cell.ActivityNameLbl.text;
    _AddressLbl.text = _cell.AddressLbl.text;
    _TimeLbl.text = _cell.EndTimeLbl.text;
    NSString *count = [_cell.CountLbl.text substringWithRange:NSMakeRange(5, _cell.CountLbl.text.length - 5)];
    _CountLbl.text = [NSString stringWithFormat:@"%@已报名",count];
}

- (void)getDetailMessage:(ActivityTableViewCell *)cell
{
    _cell = cell;
}

- (IBAction)clickBookActivity:(id)sender {
    ActivityBookViewController *activitybookview = [self.storyboard instantiateViewControllerWithIdentifier:@"ActivityBookViewController"];
    [self.navigationController showViewController:activitybookview sender:nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
            
        case 1:
            return 4;
            break;
            
        case 2:
            return 1;
            break;
            
        default:
            return 0;
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, view.frame.size.width, view.frame.size.height)];
    label.font = [UIFont systemFontOfSize:13];
    switch (section) {
        case 0:
            label.text = @"活动介绍";
            break;
            
        case 1:
            label.text = @"报名成员";
            break;
            
        case 2:
            label.text = @"主办方";
            break;
            
        default:
            break;
    }
    [view addSubview:label];
    if (section == 1)
    {
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(view.frame.size.width - 40, 0, 20, 20)];
        imageview.image = [UIImage imageNamed:@"ic_deal_arrow_right.png"];
        [view addSubview:imageview];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(view.frame.size.width - 80, 0, 40, 20)];
        label.text = @"4人";
        label.font = [UIFont systemFontOfSize:13];
        [view addSubview:label];
    }
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            return 60;
            break;
            
        case 1:
            return 40;
            break;
            
        case 2:
            return 60;
            break;
            
        default:
            return 0;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.backgroundColor = [UIColor grayColor];
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
