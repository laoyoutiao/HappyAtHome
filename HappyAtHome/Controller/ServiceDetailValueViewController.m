//
//  ServiceDetailValueViewController.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/12/4.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "ServiceDetailValueViewController.h"
#import "MyHeader.h"

typedef NS_ENUM(NSInteger, tableviewType) {
    addresstableviewType = 0,
    communittableviewType = 1,
};

@interface ServiceDetailValueViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    viewType _viewType;
    tableviewType _tableviewType;
}
@property (strong, nonatomic) NSString *introducestring;
@end

@implementation ServiceDetailValueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (_viewType == addressviewType) {
        [self setAddressView];
    }else if (_viewType == introduceviewType)
    {
        [self setIntroduceView];
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UI Or Data

- (void)viewType:(viewType)type
{
    _viewType = type;
}

- (void)setAddressView
{
    UIButton *addressbtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 64, ScreenSize.width / 2, 80)];
    [addressbtn setTitle:@"上门服务" forState:UIControlStateNormal];
    [addressbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [addressbtn setImageEdgeInsets:UIEdgeInsetsMake(30, 15, 30, ScreenSize.width / 2 - 35)];
    [addressbtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -40, 0, 0)];
    [addressbtn setImage:[UIImage imageNamed:@"checkbox_circle_n.png"] forState:UIControlStateNormal];
    [addressbtn setImage:[UIImage imageNamed:@"checkbox_circle_p.png"] forState:UIControlStateSelected];
    [addressbtn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    addressbtn.tag = TagButton(0);
    addressbtn.selected = YES;
    _tableviewType = addresstableviewType;
    [self.view addSubview:addressbtn];
    
    UIButton *communitybtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenSize.width / 2, 64, ScreenSize.width / 2, 80)];
    [communitybtn setTitle:@"服务中心" forState:UIControlStateNormal];
    [communitybtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [communitybtn setImageEdgeInsets:UIEdgeInsetsMake(30, 15, 30, ScreenSize.width / 2 - 35)];
    [communitybtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -40, 0, 0)];
    [communitybtn setImage:[UIImage imageNamed:@"checkbox_circle_n.png"] forState:UIControlStateNormal];
    [communitybtn setImage:[UIImage imageNamed:@"checkbox_circle_p.png"] forState:UIControlStateSelected];
    [communitybtn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    communitybtn.tag = TagButton(1);
    [self.view addSubview:communitybtn];
    
    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 144, ScreenSize.width, ScreenSize.height - 144)];
    tableview.tag = TagView(0);
    tableview.delegate = self;
    tableview.dataSource = self;
    [self.view addSubview:tableview];
}

- (void)setIntroduceView
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(8, 74, ScreenSize.width - 16, 0)];
    label.numberOfLines = 0;
    [self.view addSubview:label];
    label.text = _introducestring.length? _introducestring:@"暂无";
    [label sizeToFit];
}

- (void)setIntroducestring:(NSString *)introducestring
{
    _introducestring = introducestring;
}

#pragma mark ClickResponse
#pragma -------------------

- (void)clickButton:(UIButton *)btn
{
    UIButton *addressbtn = (UIButton *)[self.view viewWithTag:TagButton(0)];
    UIButton *communitybtn = (UIButton *)[self.view viewWithTag:TagButton(1)];
    UITableView *tableview = (UITableView *)[self.view viewWithTag:TagView(0)];
    if (btn.tag == TagButton(0)) {
        addressbtn.selected = YES;
        communitybtn.selected = NO;
        _tableviewType = addresstableviewType;
        [tableview reloadData];
    }else if (btn.tag == TagButton(1))
    {
        addressbtn.selected = NO;
        communitybtn.selected = YES;
        _tableviewType = communittableviewType;
        [tableview reloadData];
    }
}

#pragma mark TableViewDelegate or DataSource
#pragma ------------------------------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_tableviewType == addresstableviewType)
    {
        return 2;
    }else if (_tableviewType == communittableviewType)
    {
        return 1;
    }
    return 0;
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
    if (_tableviewType == addresstableviewType) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"详细地址(如小区门牌号等)";
            cell.backgroundColor = [UIColor grayColor];
        }else if (indexPath.row == 1)
        {
            UITextField *textfield = [[UITextField alloc] initWithFrame:CGRectMake(8, 0, ScreenSize.width - 16, 20)];
            textfield.layer.borderWidth = 0.5;
            [cell addSubview:textfield];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }else if (_tableviewType == communittableviewType)
    {
        cell.textLabel.text = @"深圳某小区";
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
    if (_tableviewType == addresstableviewType) {
        return 20;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenSize.width, 20)];
    UIButton *btn = [[UIButton alloc] initWithFrame:view.frame];
    [view addSubview:btn];
    [btn setTitle:@"点击选择位置" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    view.backgroundColor = [UIColor blackColor];
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_tableviewType == communittableviewType) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        [_delegate getAddressName:cell.textLabel.text];
        [self.navigationController popViewControllerAnimated:YES];
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
