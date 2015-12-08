//
//  ServiceDetailValueViewController.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/12/4.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "ServiceDetailValueViewController.h"
#import "MyHeader.h"

@interface ServiceDetailValueViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ServiceDetailValueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *addressbtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 64, ScreenSize.width / 2, 80)];
    [addressbtn setTitle:@"上门服务" forState:UIControlStateNormal];
    [addressbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [addressbtn setImageEdgeInsets:UIEdgeInsetsMake(30, 15, 30, ScreenSize.width / 2 - 35)];
    [addressbtn setImage:[UIImage imageNamed:@"checkbox_circle_n.png"] forState:UIControlStateNormal];
    [addressbtn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    addressbtn.tag = TagButton(0);
    [self.view addSubview:addressbtn];
    
    UIButton *communitybtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenSize.width / 2, 64, ScreenSize.width / 2, 80)];
    [communitybtn setTitle:@"服务中心" forState:UIControlStateNormal];
    [communitybtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [communitybtn setImageEdgeInsets:UIEdgeInsetsMake(30, 15, 30, ScreenSize.width / 2 - 35)];
    [communitybtn setImage:[UIImage imageNamed:@"checkbox_circle_n.png"] forState:UIControlStateNormal];
    [communitybtn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    communitybtn.tag = TagButton(1);
    [self.view addSubview:communitybtn];
    
    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 144, ScreenSize.width, ScreenSize.height - 144)];
    tableview.tag = TagView(0);
    tableview.delegate = self;
    tableview.dataSource = self;
    [self.view addSubview:tableview];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Button Methods
#pragma -------------------

- (void)clickButton:(UIButton *)btn
{
    UIButton *addressbtn = (UIButton *)[self.view viewWithTag:TagButton(0)];
    UIButton *communitybtn = (UIButton *)[self.view viewWithTag:TagButton(1)];
    if (btn.tag == TagButton(0)) {
        addressbtn.selected = YES;
        [addressbtn setImage:[UIImage imageNamed:@"checkbox_circle_p.png"] forState:UIControlStateNormal];
        [communitybtn setImage:[UIImage imageNamed:@"checkbox_circle_n.png"] forState:UIControlStateNormal];
        [addressbtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -40, 0, 0)];
        [communitybtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
        communitybtn.selected = NO;
    }else if (btn.tag == TagButton(1))
    {
        addressbtn.selected = NO;
        [addressbtn setImage:[UIImage imageNamed:@"checkbox_circle_n.png"] forState:UIControlStateNormal];
        [communitybtn setImage:[UIImage imageNamed:@"checkbox_circle_p.png"] forState:UIControlStateNormal];
        [addressbtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
        [communitybtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -40, 0, 0)];
        communitybtn.selected = YES;
    }
}

#pragma mark TableViewDelegate or DataSource
#pragma ------------------------------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdintifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdintifier"];
    }
    if (indexPath.row == 0) {
        cell.textLabel.text = @"详细地址(如小区门牌号等)";
        cell.backgroundColor = [UIColor grayColor];
    }else if (indexPath.row == 1)
    {
        UITextField *textfield = [[UITextField alloc] initWithFrame:CGRectMake(5, 0, ScreenSize.width - 10, cell.frame.size.height)];
        [cell addSubview:textfield];
    }
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenSize.width, 20)];
    UIButton *btn = [[UIButton alloc] initWithFrame:view.frame];
    [view addSubview:btn];
    [btn setTitle:@"点击选择位置" forState:UIControlStateNormal];
    return view;
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
