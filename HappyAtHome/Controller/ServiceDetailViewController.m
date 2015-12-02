//
//  ServiceDetailViewController.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/30.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "ServiceDetailViewController.h"
#import "UIColor+Hex.h"

@interface ServiceDetailViewController ()<UITableViewDelegate,UITableViewDataSource,UIPickerViewDataSource,UIPickerViewDelegate>
{
    NSString *servicetime;
}
@property (weak, nonatomic) IBOutlet UITableView *TableView;

@end

@implementation ServiceDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigation];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setNavigation
{
    self.title = servicemodel.name;
}

- (void)getServiceModel:(ServiceModel *)model
{
    servicemodel = model;
}

#pragma mark TableViewDelegate or DataSource
#pragma ------------------------------------

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
            
        case 1:
            return 2;
            break;
            
        case 2:
            return 3;
            break;
            
        case 3:
            return 1;
            break;
            
        case 4:
            return 1;
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
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section == 0)
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, ScreenSize.width - 10, 35)];
        label.text = servicemodel.hint;
        label.font = [UIFont systemFontOfSize:13];
        label.textColor = [UIColor colorWithHex:0x515270];
        [cell addSubview:label];
    }else if (indexPath.section == 1)
    {
        UILabel *textlbl = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 60, 40)];
        textlbl.text = !indexPath.row? @"项目单价":@"主意事项";
        textlbl.textColor = [UIColor colorWithHex:0x3CC365];
        textlbl.font = [UIFont systemFontOfSize:13];
        [cell addSubview:textlbl];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(75, 10, 1, 20)];
        line.backgroundColor = [UIColor grayColor];
        [cell addSubview:line];
        
        UILabel *mutablelabl = [[UILabel alloc] initWithFrame:CGRectMake(85, 0, ScreenSize.width - 120, 40)];
        mutablelabl.text = !indexPath.row? [NSString stringWithFormat:@"%ld",servicemodel.money]:@"天气干燥";
        mutablelabl.textColor = !indexPath.row? [UIColor colorWithHex:0x515270]:[UIColor colorWithHex:0x636363];
        mutablelabl.font = [UIFont systemFontOfSize:13];
        [cell addSubview:mutablelabl];
        
    }else if (indexPath.section == 2)
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        UILabel *textlbl = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 60, 40)];
        switch (indexPath.row) {
            case 0:
                textlbl.text = @"服务地点";
                break;
                
            case 1:
                textlbl.text = @"服务时间";
                break;
                
            case 2:
                textlbl.text = @"购买数量";
                break;
        }
        textlbl.textColor = [UIColor colorWithHex:0x3CC365];
        textlbl.font = [UIFont systemFontOfSize:13];
        [cell addSubview:textlbl];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(75, 10, 1, 20)];
        line.backgroundColor = [UIColor grayColor];
        [cell addSubview:line];
        
        UILabel *mutablelabl = [[UILabel alloc] initWithFrame:CGRectMake(85, 0, ScreenSize.width - 120, 40)];
        switch (indexPath.row) {
            case 0:
                mutablelabl.text = @"服务地点";
                break;
                
            case 1:
                mutablelabl.text = @"服务时间";
                break;
                
            case 2:
                mutablelabl.text = servicetime.length? servicetime:@"购买数量";
                break;
        }
        mutablelabl.textColor = [UIColor colorWithHex:0x999999];
        mutablelabl.font = [UIFont systemFontOfSize:13];
        [cell addSubview:mutablelabl];
        
    }else if (indexPath.section == 3)
    {
        UILabel *textlbl = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 60, 90)];
        textlbl.text = @"备     注\n (选填)";
        textlbl.numberOfLines = 2;
        textlbl.textColor = [UIColor colorWithHex:0x3CC365];
        textlbl.font = [UIFont systemFontOfSize:13];
        [cell addSubview:textlbl];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(65, 10, 1, 70)];
        line.backgroundColor = [UIColor grayColor];
        [cell addSubview:line];
        
        UITextView *textview = [[UITextView alloc] initWithFrame:CGRectMake(75, 10, ScreenSize.width - 90, 70)];
        textview.text = @"告诉我们你们的需求";
        textview.textColor = [UIColor colorWithHex:0x999999];
        [cell addSubview:textview];
    }else
    {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10, 2, ScreenSize.width - 20, 40)];
        button.backgroundColor = [UIColor colorWithHex:0x3CC365];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 3;
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        [button setTitle:@"提交订单" forState:UIControlStateNormal];
        [cell addSubview:button];
    }
//    cell.backgroundColor = [UIColor yellowColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 10;
    }else if (section != 4)
    {
        return 13;
    }else
    {
        return 20;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 35;
    }else if (indexPath.section == 3)
    {
        return 90;
    }else if (indexPath.section != 4)
    {
        return 40;
    }else
    {
        return 45;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2 && indexPath.row == 2) {
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenSize.width, ScreenSize.height - 200)];
        view.backgroundColor = [UIColor blackColor];
        view.alpha = 0.7;
        view.tag = TagView(0);
        [self.view addSubview:view];
        
        UIPickerView *pickview = [[UIPickerView alloc] initWithFrame:CGRectMake(0, ScreenSize.height - 200, ScreenSize.width, 200)];
        pickview.backgroundColor = [UIColor whiteColor];
        pickview.delegate = self;
        pickview.dataSource = self;
        [self.view addSubview:pickview];
    }
}

#pragma mark ThingMethod


#pragma mark PickViewDelegate or DataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 8;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [NSString stringWithFormat:@"1小时X%ld",row + 1];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    servicetime = [NSString stringWithFormat:@"1小时X%ld",row + 1];
    UIView *view = [self.view viewWithTag:TagView(0)];
    [view removeFromSuperview];
    [pickerView removeFromSuperview];
    [_TableView reloadData];
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
