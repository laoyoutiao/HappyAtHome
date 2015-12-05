//
//  ServiceDetailViewController.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/30.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "ServiceDetailViewController.h"
#import "UIColor+Hex.h"

@interface ServiceDetailViewController ()<UITableViewDelegate,UITableViewDataSource,UIPickerViewDataSource,UIPickerViewDelegate,UITextViewDelegate>
{
    NSString *servicetime;
    NSString *servicestarttime;
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
                mutablelabl.tag = TagLabel(1);
                break;
                
            case 2:
                mutablelabl.text = @"购买数量";
                mutablelabl.tag = TagLabel(0);
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
        [textview resignFirstResponder];
        textview.delegate = self;
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
    if (indexPath.section == 2 && (indexPath.row == 1 || indexPath.row == 2)) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenSize.width, ScreenSize.height - 225)];
        view.backgroundColor = [UIColor blackColor];
        view.alpha = 0.7;
        view.tag = TagView(0);
        [self.view addSubview:view];
        
        UIButton *canclebtn = [[UIButton alloc] initWithFrame:CGRectMake(0, ScreenSize.height - 225, ScreenSize.width / 2, 25)];
        canclebtn.backgroundColor = [UIColor blackColor];
        [canclebtn addTarget:self action:@selector(pickButtonclick:) forControlEvents:UIControlEventTouchUpInside];
        canclebtn.tag = TagButton(3);
        [canclebtn setTitle:@"取消" forState:UIControlStateNormal];
        canclebtn.titleEdgeInsets = UIEdgeInsetsMake(5, 0, 5, 90);
        [canclebtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        canclebtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [self.view addSubview:canclebtn];
        
        UIButton *surebtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenSize.width / 2, ScreenSize.height - 225, ScreenSize.width / 2, 25)];
        surebtn.backgroundColor = [UIColor blackColor];
        [surebtn addTarget:self action:@selector(pickButtonclick:) forControlEvents:UIControlEventTouchUpInside];
        surebtn.tag = TagButton(4);
        [surebtn setTitle:@"确定" forState:UIControlStateNormal];
        surebtn.titleEdgeInsets = UIEdgeInsetsMake(5, 90, 5, 0);
        [surebtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        surebtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [self.view addSubview:surebtn];
    }
    
    if (indexPath.section == 2 && indexPath.row == 2) {
        UIPickerView *pickview = [[UIPickerView alloc] initWithFrame:CGRectMake(0, ScreenSize.height - 200, ScreenSize.width, 200)];
        pickview.tag = TagView(5);
        pickview.backgroundColor = [UIColor whiteColor];
        pickview.delegate = self;
        pickview.dataSource = self;
        [self.view addSubview:pickview];
    }else if (indexPath.section == 2 && indexPath.row == 1)
    {
        UIPickerView *pickview = [[UIPickerView alloc] initWithFrame:CGRectMake(0, ScreenSize.height - 200, ScreenSize.width, 200)];
        pickview.tag = TagView(6);
        pickview.backgroundColor = [UIColor whiteColor];
        pickview.delegate = self;
        pickview.dataSource = self;
        [self.view addSubview:pickview];
    }else if (indexPath.section == 0)
    {
        
    }
}

#pragma mark ThingMethod or ButtonSel

- (void)pickButtonclick:(UIButton *)btn
{
    UIView *view = [self.view viewWithTag:TagView(0)];
    [view removeFromSuperview];
    
    UIPickerView *timepickerView = (UIPickerView *)[self.view viewWithTag:TagView(5)];
    timepickerView ? [timepickerView removeFromSuperview]:nil;
    
    UIPickerView *starttimepickerView = (UIPickerView *)[self.view viewWithTag:TagView(6)];
    starttimepickerView ? [starttimepickerView removeFromSuperview]:nil;
    
    UILabel *timelabel = (UILabel *)[self.view viewWithTag:TagLabel(0)];
    UILabel *startlabel = (UILabel *)[self.view viewWithTag:TagLabel(1)];
    switch (btn.tag) {
        case TagButton(4):
            timepickerView ? timelabel.text = servicetime:nil;
            starttimepickerView ? startlabel.text = servicestarttime:nil;
            break;
    }
    
    UIButton *canclebtn = (UIButton *)[self.view viewWithTag:TagButton(4)];
    [canclebtn removeFromSuperview];
    
    UIButton *surebtn = (UIButton *)[self.view viewWithTag:TagButton(3)];
    [surebtn removeFromSuperview];
}

#pragma mark PickViewDelegate or DataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    if (pickerView.tag == TagView(5))
    {
        return 1;
    }else if (pickerView.tag == TagView(6))
    {
        return 3;
    }else
    {
        return 0;
    }
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0)
    {
        return 8;
    }else
    {
        return 12;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView.tag == TagView(5))
    {
        servicetime = @"1小时X1";
        return [NSString stringWithFormat:@"1小时X%ld",row + 1];
    }else if (pickerView.tag == TagView(6))
    {
        if (component == 0)
        {
            NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
            NSDateComponents *comps = nil;
            comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:[NSDate date]];
            NSDateComponents *adcomps = [[NSDateComponents alloc] init];
            [adcomps setYear:0];
            [adcomps setMonth:0];
            [adcomps setDay:row];
            NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:[NSDate date] options:0];
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"yyyy-MM-dd"];
            NSString *datestr = [formatter stringFromDate:newdate];
            servicestarttime = [NSString stringWithFormat:@"%@ 08:00",datestr];
            return datestr;
        }else if (component == 1)
        {
            return row < 2? [NSString stringWithFormat:@"0%ld",row + 8]:[NSString stringWithFormat:@"%ld",row + 8];
        }else
        {
            return row < 2? [NSString stringWithFormat:@"0%ld",row * 5]:[NSString stringWithFormat:@"%ld",row * 5];
        }
    }else
    {
        return 0;
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (pickerView.tag == TagView(5))
    {
        servicetime = [NSString stringWithFormat:@"1小时X%ld",row + 1];
    }else if (pickerView.tag == TagView(6))
    {
        if (component == 0)
        {
            NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
            NSDateComponents *comps = nil;
            comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:[NSDate date]];
            NSDateComponents *adcomps = [[NSDateComponents alloc] init];
            [adcomps setYear:0];
            [adcomps setMonth:0];
            [adcomps setDay:row];
            NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:[NSDate date] options:0];
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"yyyy-MM-dd"];
            NSString *datestr = [formatter stringFromDate:newdate];
            servicestarttime = [NSString stringWithFormat:@"%@%@",datestr,[servicestarttime substringWithRange:NSMakeRange(10, servicestarttime.length - 10)]];
        }else if (component == 1)
        {
            NSString *hour = row < 2? [NSString stringWithFormat:@"0%ld",row + 8]:[NSString stringWithFormat:@"%ld",row + 8];
            servicestarttime = [NSString stringWithFormat:@"%@%@%@",[servicestarttime substringWithRange:NSMakeRange(0, 11)],hour,[servicestarttime substringWithRange:NSMakeRange(13, servicestarttime.length - 13)]];
        }else
        {
            NSString *min = row < 2? [NSString stringWithFormat:@"0%ld",row * 5]:[NSString stringWithFormat:@"%ld",row * 5];
            servicestarttime = [NSString stringWithFormat:@"%@%@",[servicestarttime substringWithRange:NSMakeRange(0, 14)],min];
        }
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if (pickerView.tag == TagView(6)) {
        if (component == 0) {
            return 160;
        }else
        {
            return 50;
        }
    }else
    {
        return 200;
    }
}

#pragma mark TextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    [textView.text isEqualToString:@"告诉我们你们的需求"] ? textView.text = @"":nil;
    [_TableView setContentOffset:CGPointMake(0, 270) animated:YES];
}

- (void)textViewDidChange:(UITextView *)textView
{
    
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    NSLog(@"%@",textView.text);
    [textView.text isEqualToString:@""] ? textView.text = @"告诉我们你们的需求":nil;
    [_TableView setContentOffset:CGPointMake(0, 0) animated:YES];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    NSLog(@"%@",text);
    if ([text  isEqual: @"\n"]) {
        [textView resignFirstResponder];
    }
    return YES;
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
