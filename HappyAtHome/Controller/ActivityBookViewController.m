//
//  ActivityBookViewController.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/13.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "ActivityBookViewController.h"
#import "UIColor+Hex.h"

@interface ActivityBookViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ActivityBookViewController

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
    self.title = @"报名信息";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 3)
    {
        return 120;
    }else
    {
        return 40;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    if (indexPath.row == 0)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, cell.frame.size.width, 40)];
        label.text = @"信息确认";
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = [UIColor redColor];
        [cell addSubview:label];
    }else if (indexPath.row == 1 || indexPath.row == 2)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 70, 40)];
        switch (indexPath.row) {
            case 1:
                label.text = @"真实姓名:";
                break;
                
            case 2:
                label.text = @"手机号码:";
                break;
        }
        
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor grayColor];
        [cell addSubview:label];
        
        UITextField *textfiled = [[UITextField alloc] initWithFrame:CGRectMake(3, 0, cell.frame.size.width - 80, 40)];
        textfiled.font = [UIFont systemFontOfSize:12];
        switch (indexPath.row) {
            case 1:
                textfiled.placeholder = @"请输入活动联系人姓名";
                break;
                
            case 2:
                textfiled.placeholder = @"请输入你的联系手机号码";
                break;
        }
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(75, 0, cell.frame.size.width - 80, 40)];
        
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, 0, 28);
        CGPathAddLineToPoint(path, NULL, 0, 33);
        CGPathMoveToPoint(path, NULL, 0, 33);
        CGPathAddLineToPoint(path, NULL, cell.frame.size.width - 80, 33);
        CGPathMoveToPoint(path, NULL, cell.frame.size.width - 80, 33);
        CGPathAddLineToPoint(path, NULL, cell.frame.size.width - 80, 28);
        
        [view addSubview:textfiled];
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.path = path;
        layer.lineWidth = 1.2;
        layer.strokeColor = [UIColor colorWithHex:0xE78F2A].CGColor;
        [view.layer addSublayer:layer];
        CGPathRelease(path);
        
        [cell addSubview:view];
    }else if (indexPath.row == 3)
    {
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 40, 70, 40)];
        label.text = @"留言信息:";
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor grayColor];
        [cell addSubview:label];
        UITextView *textview = [[UITextView alloc] initWithFrame:CGRectMake(80, 20, cell.frame.size.width - 85, 80)];
        textview.text = @"不超过100字";
        textview.layer.borderWidth = 0.5;
        textview.layer.borderColor = [UIColor grayColor].CGColor;
        [cell addSubview:textview];
    }else
    {
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, cell.frame.size.width - 20, 35)];
        imageview.image = [UIImage imageNamed:@"button_bj_red.png"];
        [cell addSubview:imageview];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, cell.frame.size.width - 20, 35)];
        label.text = @"提交信息";
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:13];
        label.textColor = [UIColor whiteColor];
        [cell addSubview:label];
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
