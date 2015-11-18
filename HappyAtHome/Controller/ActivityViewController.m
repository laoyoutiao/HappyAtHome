//
//  ActivityViewController.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/12.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "ActivityViewController.h"
#import "ActivityTableViewCell.h"
#import "ActivityDetailViewController.h"
#import "UIColor+Hex.h"

@interface ActivityViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self SetNavigation];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)SetNavigation
{
    self.title = @"活动";
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHex:0xF37B9F];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.tabBarController.tabBar.tintColor = [UIColor redColor];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30)];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, view.frame.size.width / 2, 0);
    CGPathAddLineToPoint(path, NULL, view.frame.size.width / 2, view.frame.size.height);
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path;
    layer.lineWidth = 1;
    layer.strokeColor = [UIColor grayColor].CGColor;
    CGPathRelease(path);
    [view.layer addSublayer:layer];
    
    UIButton *timebtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width / 2 - 0.5, view.frame.size.height)];
    [timebtn setTitle:@"全部时间    " forState:UIControlStateNormal];
    [timebtn setTitleColor:[UIColor colorWithHex:0x4B4D6C] forState:UIControlStateNormal];
    timebtn.titleLabel.font = [UIFont systemFontOfSize:13];
    timebtn.backgroundColor = [UIColor colorWithHex:0xAAAACC];
    [view addSubview:timebtn];
    
    UIImageView *timeimageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"groupon_detial_down_arrow.png"]];
    timeimageview.center = CGPointMake(view.frame.size.width / 4 + 20 + timeimageview.frame.size.width / 2, view.frame.size.height / 2);
    timeimageview.bounds = CGRectMake(0, 0, 10, 6);
    [view addSubview:timeimageview];
    
    UIButton *orderbtn = [[UIButton alloc] initWithFrame:CGRectMake(view.frame.size.width / 2 + 0.5, 0, view.frame.size.width / 2, view.frame.size.height)];
    [orderbtn setTitle:@"默认排序    " forState:UIControlStateNormal];
    [orderbtn setTitleColor:[UIColor colorWithHex:0x4B4D6C] forState:UIControlStateNormal];
    orderbtn.titleLabel.font = [UIFont systemFontOfSize:13];
    orderbtn.backgroundColor = [UIColor colorWithHex:0xAAAACC];
    [view addSubview:orderbtn];
    
    UIImageView *orderimageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"groupon_detial_down_arrow.png"]];
    orderimageview.center = CGPointMake(view.frame.size.width / 4 * 3 + 20 + timeimageview.frame.size.width / 2, view.frame.size.height / 2);
    orderimageview.bounds = CGRectMake(0, 0, 10, 6);
    [view addSubview:orderimageview];
    
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ActivityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ActivityTableView"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ActivityDetailViewController *activitydetailview = [self.storyboard instantiateViewControllerWithIdentifier:@"ActivityDetailViewController"];
    [self.navigationController showViewController:activitydetailview sender:nil];
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
