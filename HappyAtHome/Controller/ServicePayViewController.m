//
//  ServicePayViewController.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/12/9.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "ServicePayViewController.h"
#import "MyHeader.h"

@interface ServicePayViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSString *_servicehint;
    NSString *_starttime;
    NSString *_address;
    CGFloat _money;
}
@property (weak, nonatomic) IBOutlet UITableView *TableView;

@end

@implementation ServicePayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getMessageServiceHint:(NSString *)servicehint StartTime:(NSString *)starttime Address:(NSString *)address Money:(CGFloat)money
{
    _servicehint = servicehint;
    _starttime = starttime;
    _address = address;
    _money = money;
}

#pragma mark TableViewDelegate or Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 6)
    {
        return 120;
    }
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.font = [UIFont systemFontOfSize:14];
    }
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    UILabel *starttimelabel;
    UILabel *addresslabel;
    UILabel *moneyLabel;
    UIButton *paybutton;
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"电话";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
            
        case 1:
            starttimelabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, ScreenSize.width - 30, 20)];
            starttimelabel.text = _starttime;
            starttimelabel.font = [UIFont systemFontOfSize:11];
            [cell addSubview:starttimelabel];
            
            addresslabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, ScreenSize.width - 30, 20)];
            addresslabel.text = _address;
            addresslabel.font = [UIFont systemFontOfSize:11];
            [cell addSubview:addresslabel];
            break;
            
        case 2:
            cell.textLabel.text = _servicehint;
            break;
            
        case 3:
            cell.textLabel.text = @"积分抵现金：";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
            
        case 4:
            cell.textLabel.text = @"实付金额：";
            moneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenSize.width / 2, 0, ScreenSize.width / 2 - 15, 40)];
            moneyLabel.text = [NSString stringWithFormat:@"￥%.1f元",_money];
            moneyLabel.font = [UIFont systemFontOfSize:13];
            moneyLabel.textColor = [UIColor redColor];
            moneyLabel.textAlignment = NSTextAlignmentRight;
            [cell addSubview:moneyLabel];
            break;
            
        case 5:
            cell.textLabel.text = @"支付方式";
            break;
            
        case 6:
            [cell addSubview:[self setPayButtonView]];
            break;
            
        case 7:
            paybutton = [[UIButton alloc] initWithFrame:CGRectMake(10, 0, ScreenSize.width - 20, 40)];
            [paybutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [paybutton setTitle:@"去支付" forState:UIControlStateNormal];
            paybutton.backgroundColor = [UIColor greenColor];
            paybutton.layer.masksToBounds = YES;
            paybutton.layer.cornerRadius = 5;
            [cell addSubview:paybutton];
            break;
            
        default:
            break;
    }
    return cell;
}

- (UIView *)setPayButtonView
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenSize.width, 120)];
    
    UIImageView *tickimage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"service_pay_tick.png"]];
    tickimage.frame = CGRectMake(15, 10, 20, 20);
    [view addSubview:tickimage];
    
    UIButton *tickBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, ScreenSize.width, 40)];
    [tickBtn setTitle:@"我的养老券" forState:UIControlStateNormal];
    [tickBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    tickBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    tickBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [tickBtn setImage:[UIImage imageNamed:@"checkbox_circle_n.png"] forState:UIControlStateNormal];
    [tickBtn setImage:[UIImage imageNamed:@"checkbox_circle_p.png"] forState:UIControlStateSelected];
    tickBtn.imageEdgeInsets = UIEdgeInsetsMake(10, ScreenSize.width - 25, 10, 5);
    tickBtn.tag = TagButton(0);
    [tickBtn addTarget:self action:@selector(clickPayTypeBtn:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:tickBtn];
    
    UIImageView *wechatimage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"service_pay_wechat.png"]];
    wechatimage.frame = CGRectMake(15, 50, 20, 20);;
    [view addSubview:wechatimage];
    
    UIButton *wechatBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 40, ScreenSize.width, 40)];
    [wechatBtn setTitle:@"微信支付" forState:UIControlStateNormal];
    [wechatBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    wechatBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    wechatBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [wechatBtn setImage:[UIImage imageNamed:@"checkbox_circle_n.png"] forState:UIControlStateNormal];
    [wechatBtn setImage:[UIImage imageNamed:@"checkbox_circle_p.png"] forState:UIControlStateSelected];
    wechatBtn.imageEdgeInsets = UIEdgeInsetsMake(10, ScreenSize.width - 25, 10, 5);
    [wechatBtn addTarget:self action:@selector(clickPayTypeBtn:) forControlEvents:UIControlEventTouchUpInside];
    wechatBtn.tag = TagButton(1);
    [view addSubview:wechatBtn];
    
    UIImageView *payimage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"service_pay_account.png"]];
    payimage.frame = CGRectMake(15, 90, 20, 20);
    [view addSubview:payimage];
    
    UIButton *paybaceBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 80, ScreenSize.width, 40)];
    [paybaceBtn setTitle:@"支付宝支付" forState:UIControlStateNormal];
    [paybaceBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    paybaceBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    paybaceBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [paybaceBtn setImage:[UIImage imageNamed:@"checkbox_circle_n.png"] forState:UIControlStateNormal];
    [paybaceBtn setImage:[UIImage imageNamed:@"checkbox_circle_p.png"] forState:UIControlStateSelected];
    paybaceBtn.imageEdgeInsets = UIEdgeInsetsMake(10, ScreenSize.width - 25, 10, 5);
    [paybaceBtn addTarget:self action:@selector(clickPayTypeBtn:) forControlEvents:UIControlEventTouchUpInside];
    paybaceBtn.tag = TagButton(2);
    [view addSubview:paybaceBtn];
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.5;
}

#pragma mark Button Methods

- (void)clickPayTypeBtn:(UIButton *)btn
{
    UIButton *tickbtn = (UIButton *)[self.view viewWithTag:TagButton(0)];
    UIButton *wechatbtn = (UIButton *)[self.view viewWithTag:TagButton(1)];
    UIButton *paybacebtn = (UIButton *)[self.view viewWithTag:TagButton(2)];
    switch (btn.tag) {
        case TagButton(0):
            tickbtn.selected = YES;
            wechatbtn.selected = NO;
            paybacebtn.selected = NO;
            break;
            
        case TagButton(1):
            tickbtn.selected = NO;
            wechatbtn.selected = YES;
            paybacebtn.selected = NO;
            break;
            
        case TagButton(2):
            tickbtn.selected = NO;
            wechatbtn.selected = NO;
            paybacebtn.selected = YES;
            break;
            
        default:
            break;
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
