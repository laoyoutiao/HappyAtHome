//
//  ShopSortViewController.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/19.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "ShopSortViewController.h"

@interface ShopSortViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ShopSortViewController

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
    self.title = @"商城分类";
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
