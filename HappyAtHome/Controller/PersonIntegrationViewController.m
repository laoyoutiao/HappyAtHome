//
//  IntegrationViewController.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/11.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "PersonIntegrationViewController.h"
#import "UIColor+Hex.h"
#import "ServerHeader.h"
#import "ModelHeader.h"

typedef struct {
    NSInteger oldticket;
    NSInteger integral;
}ChangeRule;

typedef NS_ENUM(NSInteger, changeType) {
    changeType100 = 0,
    changeType150 = 1,
    changeType200 = 2,
    changeType500 = 3,
};

@interface PersonIntegrationViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    changeType _changeType;
}


@property (weak, nonatomic) IBOutlet UITableView *TableView;

@end

@implementation PersonIntegrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigation];
    [self setTableView];
    [self setFixedData];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setNavigation
{
    self.title = @"积分兑换";
}

- (void)setFixedData
{
//    [ServerService serverExRulePostBlock];
}

- (void)setTableView
{
    _TableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _TableView.scrollEnabled = NO;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
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
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if(indexPath.row == 0)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, cell.frame.size.width / 2, 35)];
        label.text = @"我的积分";
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor colorWithHex:0x25B1D0];
        [cell addSubview:label];
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(cell.frame.size.width / 4 * 3 - 10, 10, cell.frame.size.width / 4, 35)];
        button.backgroundColor = [UIColor colorWithHex:0x3CC365];
        [button setTitle:@"获取更多积分" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:12];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 5;
        [button addTarget:self action:@selector(clickgetintegration) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:button];
    }else if(indexPath.row == 5)
    {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 10, cell.frame.size.width - 40, 35)];
        [button setTitle:@"立即兑换" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:12];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 5;
        [button addTarget:self action:@selector(clicksure) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor = [UIColor colorWithHex:0x1F9CA6];
        [cell addSubview:button];
        
    }else
    {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(cell.frame.size.width / 2 - 100, 10, 200, 40)];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(view.frame.size.width / 2 - 20, 0, view.frame.size.width / 2, view.frame.size.height)];
        switch (indexPath.row) {
            case 1:
                view.backgroundColor = [UIColor colorWithHex:0x1FADCE];
                label.text = @"100养老服务券\n      80积分";
                break;
                
            case 2:
                view.backgroundColor = [UIColor colorWithHex:0xAC53C1];
                label.text = @"150养老服务券\n      100积分";
                break;
                
            case 3:
                view.backgroundColor = [UIColor colorWithHex:0xF17B22];
                label.text = @"200养老服务券\n      160积分";
                break;
                
            case 4:
                view.backgroundColor = [UIColor colorWithHex:0xD0474F];
                label.text = @"500养老服务券\n      320积分";
                break;
                
            default:
                break;
        }
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:10];
        label.numberOfLines = 2;
        [view addSubview:label];
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(45, 10, view.frame.size.height - 20, view.frame.size.height - 20)];
        [button setBackgroundImage:[UIImage imageNamed:@"checkbox_circle_n.png"] forState:UIControlStateNormal];
        button.tag = 100 + indexPath.row;
        [button setImage:[UIImage imageNamed:@"checkbox_circle_p.png"] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(clickchoosecoupons:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:button];
        
        view.layer.masksToBounds = YES;
        view.layer.cornerRadius = 3;
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, 4, 2);
        CGPathAddLineToPoint(path, NULL, view.frame.size.width - 4, 2);
        
        CGPathMoveToPoint(path, NULL, view.frame.size.width - 4, 2);
        CGPathAddLineToPoint(path, NULL, view.frame.size.width - 4, view.frame.size.height - 2);
        
        CGPathMoveToPoint(path, NULL, view.frame.size.width - 4, view.frame.size.height - 2);
        CGPathAddLineToPoint(path, NULL, 4, view.frame.size.height - 2);
        
        CGPathMoveToPoint(path, NULL, 4, view.frame.size.height - 2);
        CGPathAddLineToPoint(path, NULL, 4, 2);
        
        
        CAShapeLayer *layer = [CAShapeLayer layer];
        [layer setFrame:view.bounds];
        [layer setStrokeColor:[UIColor blackColor].CGColor];
        [layer setLineJoin:kCALineJoinRound];
        [layer setLineDashPattern:@[@"3",@"1"]];
        [layer setLineWidth:0.5];
        layer.path = path;
        [view.layer addSublayer:layer];
        CGPathRelease(path);
        [cell addSubview:view];
        
        
        
    }
    return cell;
}

- (void)clickgetintegration
{
    
}

- (void)clicksure
{
    UserInfoModel *userinfomodel = [UserInfoModel sharedInstance];
    ChangeRule changerule;
    switch (_changeType) {
        case 0:
            changerule.oldticket = 100;
            changerule.integral = 80;
            break;
            
        case 1:
            changerule.oldticket = 150;
            changerule.integral = 100;
            break;
            
        case 2:
            changerule.oldticket = 200;
            changerule.integral = 160;
            break;
            
        case 3:
            changerule.oldticket = 500;
            changerule.integral = 320;
            break;

    }
    
    [ServerService serverExChangedPostUserId:userinfomodel.userid Integral:changerule.integral OldTicket:changerule.oldticket Block:^(NSDictionary *dictblock) {
        __block UIAlertController *alertview;
        NSString *code = [dictblock objectForKey:@"code"];
        if (code.integerValue == 1) {
            NSString *tick = [dictblock objectForKey:@"response"];
            NSInteger ticket = tick.integerValue;
            alertview = [UIAlertController alertControllerWithTitle:[dictblock objectForKey:@"msg"] message:[NSString stringWithFormat:@"剩余养老卷:%ld",ticket] preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *sureaction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            
            [ServerUserInfo userInfoGetPostUserId:userinfomodel.userid Block:^(NSDictionary *dictblock) {
                UserInfoModel *userinfomodel;
                userinfomodel = [[UserInfoModel sharedInstance] initWithDictionary:dictblock];
                [alertview addAction:sureaction];
                [_delegate reloadUserInfo];
            }];
        }else
        {
            alertview = [UIAlertController alertControllerWithTitle:[dictblock objectForKey:@"msg"] message:[NSString stringWithFormat:@"剩余养老卷:%@",[dictblock objectForKey:@"response"]] preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *sureaction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
            [alertview addAction:sureaction];
            [_delegate reloadUserInfo];
        }
        [self presentViewController:alertview animated:YES completion:nil];
    }];
}

- (void)clickchoosecoupons:(UIButton *)btn
{
    btn.selected = YES;
    for (NSInteger i = 101; i < 105; i++)
    {
        if (i != btn.tag) {
            UIButton *button = (UIButton *)[self.view viewWithTag:i];
            button.selected = NO;
        }else
        {
            _changeType = btn.tag - 101;
        }
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
