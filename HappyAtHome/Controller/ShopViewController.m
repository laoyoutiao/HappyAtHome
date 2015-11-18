//
//  ShopViewController.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/16.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "ShopViewController.h"
#import "UIColor+Hex.h"
#import "ScrollImageCube.h"

@interface ShopViewController () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *ScorllView;

@end

@implementation ShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self SetNavigation];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self setScorll];
}

- (void)setScorll
{
    ScrollImageCube *cube = [[ScrollImageCube alloc] initWithFrame:CGRectMake(0, 0, _ScorllView.frame.size.width, _ScorllView.frame.size.height) ImageArray:@[@"service_one.jpg",@"service_two.jpg",@"service_three.jpg",@"service_one.jpg",@"service_two.jpg"]];
    [_ScorllView addSubview:cube];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)SetNavigation
{
    self.title = @"商城";
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHex:0xF37B9F];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.tabBarController.tabBar.tintColor = [UIColor redColor];
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
