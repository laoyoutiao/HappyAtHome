//
//  PersonDataViewController.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/10/31.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "PersonDataViewController.h"
#import "PersonDataChangeViewController.h"
#import "ModelHeader.h"
#import "UIImageView+WebCache.h"
#import "ServerHeader.h"
#import "MyHeader.h"

@interface PersonDataViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UserInfoModel *userinfomodel;
}

@property (strong, nonatomic) NSArray *TitleArray;
@end

@implementation PersonDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setFixedData];
    [self setNavigation];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setFixedData
{
    userinfomodel = [UserInfoModel sharedInstance];
    _TitleArray = [[NSArray alloc] initWithObjects:@"头像",@"账号",@"性别",@"呢称",@"积分",@"我的地址",@"个性签名",@"地区", nil];
}

- (void)setNavigation
{
    self.title = @"个人资料";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 5;
    }else
    {
        return 3;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }
    cell.textLabel.text = [_TitleArray objectAtIndex:indexPath.row + indexPath.section * 5];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (!(indexPath.section == 0 && (indexPath.row == 1 || indexPath.row == 4))) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    if (indexPath.section == 0)
    {
        UIImageView *headimageview;
        UILabel *usernamelabel;
        UILabel *personnamelabel;
        UILabel *sexlabel;
        UILabel *integrallabel;
        switch (indexPath.row) {
            case 0:
                headimageview = ImageViewSetFrame(ScreenSize.width - 60, 5, 30, 30);
                [headimageview sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ServerImgURL,userinfomodel.headimage]]];
                [cell addSubview:headimageview];
                break;
                
            case 1:
                usernamelabel = LabelSetFrame(ScreenSize.width - 200, 5, 190, 30);
                usernamelabel.text = userinfomodel.username;
                usernamelabel.textAlignment = NSTextAlignmentRight;
                usernamelabel.font = [UIFont systemFontOfSize:12];
                [cell addSubview:usernamelabel];
                break;
                
            case 2:
                sexlabel = LabelSetFrame(ScreenSize.width - 100, 5, 70, 30);
                sexlabel.text = userinfomodel.sex;
                sexlabel.textAlignment = NSTextAlignmentRight;
                sexlabel.font = [UIFont systemFontOfSize:12];
                [cell addSubview:sexlabel];
                break;
                
            case 3:
                personnamelabel = LabelSetFrame(ScreenSize.width - 200, 5, 170, 30);
                personnamelabel.text = userinfomodel.personname? :@"未设置";
                personnamelabel.textAlignment = NSTextAlignmentRight;
                personnamelabel.font = [UIFont systemFontOfSize:12];
                [cell addSubview:personnamelabel];
                break;
                
            case 4:
                integrallabel = LabelSetFrame(ScreenSize.width - 60, 5, 50, 30);
                integrallabel.text = [NSString stringWithFormat:@"%ld",userinfomodel.integral];
                integrallabel.textAlignment = NSTextAlignmentRight;
                integrallabel.font = [UIFont systemFontOfSize:12];
                [cell addSubview:integrallabel];
                break;
                
            default:
                break;
        }

    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    PersonDataChangeViewController *persondatachangeview = [self.storyboard instantiateViewControllerWithIdentifier:@"PersonDataChangeViewController"];
    switch (indexPath.row + indexPath.section * 5) {
        case 2:
            [persondatachangeview typeOfTableView:ViewTypeSex];
            [self.navigationController pushViewController:persondatachangeview animated:YES];
            break;
            
        case 6:
            [persondatachangeview typeOfTableView:ViewTypeSign];
            [self.navigationController pushViewController:persondatachangeview animated:YES];
            break;
            
        case 7:
            [persondatachangeview typeOfTableView:ViewTypeArea];
            [self.navigationController pushViewController:persondatachangeview animated:YES];
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
