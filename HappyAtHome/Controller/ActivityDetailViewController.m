//
//  ActivityDetailViewController.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/13.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "ActivityDetailViewController.h"
#import "ActivityBookViewController.h"
#import "UIImageView+WebCache.h"
#import "ModelHeader.h"
#import "MyHeader.h"
#import "ServerHeader.h"
#import "UIImageView+WebCache.h"

@interface ActivityDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    ActivityModel *_model;
    NSArray *activityPersonArray;
}
@property (weak, nonatomic) IBOutlet UITableView *TableView;
@property (weak, nonatomic) IBOutlet UILabel *ActivityNameLbl;
@property (weak, nonatomic) IBOutlet UILabel *AddressLbl;
@property (weak, nonatomic) IBOutlet UILabel *TimeLbl;
@property (weak, nonatomic) IBOutlet UILabel *ContentsLbl;
@property (weak, nonatomic) IBOutlet UILabel *CountLbl;

@end

@implementation ActivityDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setDetailMessage];
    [self setFixedData];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setDetailMessage
{
    _ActivityNameLbl.text = _model.introduce;
    _AddressLbl.text = _model.address;
    _TimeLbl.text = _model.uptime;
    _ContentsLbl.text = _model.activityname;
    _CountLbl.text = [NSString stringWithFormat:@"%ld人已报名",_model.sign];
}

- (void)getDetailMessage:(ActivityModel *)model
{
    _model = model;
}

- (void)setFixedData
{
    [ServerActivity peopleOfActivityPostActivityId:_model.activityid Block:^(NSArray *arrayblock) {
        activityPersonArray = arrayblock;
        NSLog(@"%@",activityPersonArray);
        [_TableView reloadData];
    }];
}

- (IBAction)clickBookActivity:(id)sender {
    ActivityBookViewController *activitybookview = [self.storyboard instantiateViewControllerWithIdentifier:@"ActivityBookViewController"];
    [self.navigationController showViewController:activitybookview sender:nil];
    [activitybookview getActivityModel:_model];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [activityPersonArray count]? 3:0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
            
        case 1:
            return 1;
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
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, view.frame.size.width - 15, view.frame.size.height)];
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
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(view.frame.size.width - 30, 0, 20, 20)];
        imageview.image = [UIImage imageNamed:@"ic_deal_arrow_right.png"];
        [view addSubview:imageview];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(view.frame.size.width - 80, 0, 40, 20)];
        label.text = [NSString stringWithFormat:@"%ld人",[activityPersonArray count]];
        label.textAlignment = NSTextAlignmentRight;
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
//    cell.backgroundColor = [UIColor grayColor];
    if (indexPath.section == 0) {
        UILabel *introducelabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, ScreenSize.width - 30, 60)];
        introducelabel.text = _model.orgintroduce;
        introducelabel.numberOfLines = 0;
        introducelabel.textColor = [UIColor grayColor];
        introducelabel.font = [UIFont systemFontOfSize:10];
        [cell addSubview:introducelabel];
    }else if (indexPath.section == 1)
    {
        UIImageView *headimageview = ImageViewSetFrame(15, 0, 40, 40);
        [headimageview sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://192.168.1.146:8080//EnjoyLiveHome/%@",[[activityPersonArray objectAtIndex:0] objectForKey:@"img_header"]]]];
        [cell addSubview:headimageview];
        
        UILabel *namelabel = LabelSetFrame(60, 5, ScreenSize.width - 70, 10);
        namelabel.text = [[activityPersonArray objectAtIndex:0] objectForKey:@"personname"];
        namelabel.font = [UIFont systemFontOfSize:9];
        namelabel.textColor = [UIColor grayColor];
        [cell addSubview:namelabel];
        
        UILabel *sexlabel = LabelSetFrame(60, 15, ScreenSize.width - 70, 10);
        sexlabel.text = [[[activityPersonArray objectAtIndex:0] objectForKey:@"sex"] isEqualToString:@"0"]? @"女":@"男";
        sexlabel.font = [UIFont systemFontOfSize:9];
        sexlabel.textColor = [UIColor grayColor];
        [cell addSubview:sexlabel];
        
        UILabel *introducelabel = LabelSetFrame(60, 25, ScreenSize.width - 70, 10);
        introducelabel.text = [[activityPersonArray objectAtIndex:0] objectForKey:@"selfdom_sign"];
        introducelabel.font = [UIFont systemFontOfSize:9];
        introducelabel.textColor = [UIColor grayColor];
        [cell addSubview:introducelabel];
        
    }else
    {
        UILabel *orgiaztionlabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, ScreenSize.width - 30, 60)];
        orgiaztionlabel.numberOfLines = 0;
        orgiaztionlabel.text = _model.organization;
        orgiaztionlabel.font = [UIFont systemFontOfSize:12];
        orgiaztionlabel.textColor = [UIColor grayColor];
        [cell addSubview:orgiaztionlabel];
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
