//
//  ServiceViewController.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/5.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "ServiceViewController.h"
#import "UIColor+Hex.h"
#import "ScrollImageItem.h"
#import "ScrollImageFrame.h"
#import "ServiceChooseCityViewController.h"

@interface ServiceViewController ()<ScrollImageFrameDelegate>
@property (weak, nonatomic) IBOutlet UIView *ScrollImageView;
@property (weak, nonatomic) IBOutlet UIButton *LiveBtn;
@property (weak, nonatomic) IBOutlet UIButton *HealthBtn;
@property (weak, nonatomic) IBOutlet UIButton *EmergencyBtn;

@property (strong, nonatomic) NSArray *ScrollImageArray;
@end

@implementation ServiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self SetNavigation];
    [self SetFixedData];
    [self SetHousekeeper];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [self SetScrollImageView];
}

- (void)SetFixedData
{
    _ScrollImageArray = [[NSArray alloc] initWithObjects:@"service_one.jpg", @"service_two.jpg", @"service_three.jpg", nil];
}

- (void)SetHousekeeper
{
    _LiveBtn.layer.masksToBounds = YES;
    _LiveBtn.layer.cornerRadius = 5;
    _LiveBtn.backgroundColor = [UIColor colorWithHex:0x77CBE0];
    
    _HealthBtn.layer.masksToBounds = YES;
    _HealthBtn.layer.cornerRadius = 5;
    _HealthBtn.backgroundColor = [UIColor colorWithHex:0xF66373];
    
    _EmergencyBtn.layer.masksToBounds = YES;
    _EmergencyBtn.layer.cornerRadius = 5;
    _EmergencyBtn.backgroundColor = [UIColor colorWithHex:0xB09DDC];
}

- (void)SetScrollImageView
{
        NSMutableArray *itemArray = [NSMutableArray arrayWithCapacity:[_ScrollImageArray count]+2];
        if ([_ScrollImageArray count] > 1)
        {
            NSString *tempName = [_ScrollImageArray objectAtIndex:[_ScrollImageArray count]-1];
            ScrollImageItem *item = [[ScrollImageItem alloc] initWithTitle:nil image:tempName tag:-1];
            [itemArray addObject:item];
        }
        for (int i = 0; i < [_ScrollImageArray count]; i++)
        {
            NSString *tempName = [_ScrollImageArray objectAtIndex:i];
            ScrollImageItem *item = [[ScrollImageItem alloc] initWithTitle:nil image:tempName tag:i];
            [itemArray addObject:item];
        }
        //添加第一张图 用于循环
        if ([_ScrollImageArray count] >1)
        {
            NSString *tempName = [_ScrollImageArray objectAtIndex:0];
            ScrollImageItem *item = [[ScrollImageItem alloc] initWithTitle:nil image:tempName tag:[_ScrollImageArray count]];
            [itemArray addObject:item];
        }
    
    
    ScrollImageFrame *bannerView;
    bannerView = [[ScrollImageFrame alloc] initWithFrame:CGRectMake(0,0,self.view.frame.size.width, 150) delegate:self imageItems:itemArray isAuto:YES];

    
        bannerView.backgroundColor=[[UIColor redColor]colorWithAlphaComponent:0.1];
        bannerView.delegate = self;
        bannerView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleWidth;
        [bannerView scrollToIndex:0];
        [_ScrollImageView addSubview:bannerView];
}

- (void)SetNavigation
{
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHex:0xF37B9F];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    UIBarButtonItem *leftitem = [[UIBarButtonItem alloc] initWithTitle:@"佛山市" style:UIBarButtonItemStylePlain target:self action:@selector(ClickChooseCity)];
    leftitem.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = leftitem;
    self.tabBarController.tabBar.tintColor = [UIColor redColor];
}

- (void)ClickChooseCity
{
    ServiceChooseCityViewController *choosecityview = [self.storyboard instantiateViewControllerWithIdentifier:@"ServiceChooseCityViewController"];
    [self.navigationController pushViewController:choosecityview animated:YES];
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
