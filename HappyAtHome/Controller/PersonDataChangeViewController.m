//
//  PersonDataChangeViewController.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/2.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "PersonDataChangeViewController.h"

@interface PersonDataChangeViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) NSArray *TitleArray;
@property (assign, nonatomic) ViewType ViewType;

// ViewTypeArea
@property (strong, nonatomic) NSArray *AreaArray;

// ViewTypeSex
@property (strong, nonatomic) NSArray *SexArray;

// ViewTypeSign
@property (assign, nonatomic) NSInteger wordcount;
@property (strong, nonatomic) NSTimer   *time1;
@end

@implementation PersonDataChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self SetNavigation];
    [self SetFixedData];
    
//    NSTimer *timer =  [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    _time1 =  [NSTimer timerWithTimeInterval:0.1 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_time1 forMode:NSRunLoopCommonModes];
    // Do any additional setup after loading the view.
}

- (void)tick
{
    NSLog(@"1");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)SetNavigation
{
    self.title = @"个人资料";
}

- (void)SetFixedData
{
    _SexArray = @[@"男",@"女"];
    switch (_ViewType) {
        case 0:
            _TitleArray = _AreaArray;
            break;
            
        case 1:
            _TitleArray = _SexArray;
            break;
            
        default:
            break;
    }
}

- (void)TypeOfTableView:(ViewType)viewType
{
    _ViewType = viewType;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_ViewType == 0 || _ViewType == 1) {
        return 40;
    }else
    {
        return 100;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_ViewType == 0 || _ViewType == 1) {
        return [_TitleArray count];
    }else
    {
        return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }
    if (_ViewType == 0 || _ViewType == 1) {
        cell.textLabel.text = [_TitleArray objectAtIndex:indexPath.row];
    }else if (_ViewType == 2)
    {
        UITextView *textview = [[UITextView alloc] initWithFrame:CGRectMake(0, 10, cell.frame.size.width, 70)];
        [cell addSubview:textview];
        tableView.scrollEnabled = NO;
        UILabel *textlabel = [[UILabel alloc] initWithFrame:CGRectMake(cell.frame.size.width - 45, 80, 40, 20)];
        textlabel.text = @"32";
        [cell addSubview:textlabel];
    }
    return cell;
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