//
//  ShopCarViewController.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/12/25.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "ShopCarViewController.h"
#import "ServerHeader.h"
#import "MyHeader.h"
#import "ModelHeader.h"
#import "UIImageView+WebCache.h"

@interface ShopCarViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *cararray;
}
@property (weak, nonatomic) IBOutlet UITableView *TableView;

@end

@implementation ShopCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UI Or Data

- (void)setNavigation
{
    
}

- (void)setFixedData
{
    UserInfoModel *model = [UserInfoModel sharedInstance];
    [ServerShopping goodsCarPostUserId:model.userid Block:^(NSArray *arrayblock) {
        cararray = arrayblock;
    }];
}

#pragma mark TableViewDelegate Or DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [cararray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        
    }else
    {
        while ([cell.contentView.subviews lastObject] != nil)
        {
            [(UIView*)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.5;
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
