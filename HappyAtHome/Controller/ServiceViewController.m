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
#import "ServerHeader.h"
#import "ModelHeader.h"
#import "MyHeader.h"

#define cellheightmodulus

@interface ServiceViewController ()<ScrollImageFrameDelegate,UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *TableView;
@property (weak, nonatomic) IBOutlet UIView *ScrollImageView;

@property (strong, nonatomic) NSArray *ServiceImageModelArray;
@property (strong, nonatomic) NSDictionary *ServiceModelDict;

@end

@implementation ServiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigation];
    [self setFixedData];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
//    [self setScrollImageView];
}

- (void)setFixedData
{
    [ServerService serverImgPostBlock:^(NSArray *imgarray) {
        _ServiceImageModelArray = [ServiceImgModel instanceArrayDictFromDict:imgarray];
        [self setScrollImageView];
    }];
    
    [ServerService searchPostBlock:^(NSArray *searcharray) {
        _ServiceModelDict = [ServiceModel instanceArrayDictFromDict:searcharray];
        NSLog(@"%@",_ServiceModelDict);
        [_TableView reloadData];
        [[_ServiceModelDict allKeys] count]? [_TableView setHidden:NO]:nil;
    }];
}

- (void)setScrollImageView
{
        NSMutableArray *itemArray = [NSMutableArray arrayWithCapacity:[_ServiceImageModelArray count]+2];
        if ([_ServiceImageModelArray count] > 1)
        {
            ServiceImgModel *model = [_ServiceImageModelArray objectAtIndex:[_ServiceImageModelArray count]-1];
            NSData *imagedata = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://192.168.1.146:8080//EnjoyLiveHome/%@",model.image]]];
            UIImage *image = [UIImage imageWithData:imagedata];
            ScrollImageItem *item = [[ScrollImageItem alloc] initWithTitle:nil image:image tag:-1];
            [itemArray addObject:item];
        }
        for (int i = 0; i < [_ServiceImageModelArray count]; i++)
        {
            ServiceImgModel *model = [_ServiceImageModelArray objectAtIndex:i];
            NSData *imagedata = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://192.168.1.146:8080//EnjoyLiveHome/%@",model.image]]];
            UIImage *image = [UIImage imageWithData:imagedata];
            ScrollImageItem *item = [[ScrollImageItem alloc] initWithTitle:nil image:image tag:i];
            [itemArray addObject:item];
        }
        //添加第一张图 用于循环
        if ([_ServiceImageModelArray count] >1)
        {
            ServiceImgModel *model = [_ServiceImageModelArray objectAtIndex:0];
            NSData *imagedata = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://192.168.1.146:8080//EnjoyLiveHome/%@",model.image]]];
            UIImage *image = [UIImage imageWithData:imagedata];
            ScrollImageItem *item = [[ScrollImageItem alloc] initWithTitle:nil image:image tag:[_ServiceImageModelArray count]];
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

- (void)foucusImageFrame:(ScrollImageFrame *)imageFrame didSelectItem:(ScrollImageItem *)item
{
    NSLog(@"%ld",item.tag);
}

- (void)setNavigation
{
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHex:0xF37B9F];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    UIBarButtonItem *leftitem = [[UIBarButtonItem alloc] initWithTitle:@"佛山市" style:UIBarButtonItemStylePlain target:self action:@selector(clickChooseCity)];
    leftitem.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = leftitem;
    self.tabBarController.tabBar.tintColor = [UIColor redColor];
}

- (void)clickChooseCity
{
    ServiceChooseCityViewController *choosecityview = [self.storyboard instantiateViewControllerWithIdentifier:@"ServiceChooseCityViewController"];
    [self.navigationController pushViewController:choosecityview animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[_ServiceModelDict allKeys] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            return [[_ServiceModelDict objectForKey:@"康复保健"] count] / 3 * 160 + 160;
            break;
            
        case 1:
            return [[_ServiceModelDict objectForKey:@"膳食服务"] count] / 3 * 160 + 160;
            break;
            
        case 2:
            return [[_ServiceModelDict objectForKey:@"日托服务"] count] / 3 * 160 + 160;
            break;
            
        case 3:
            return [[_ServiceModelDict objectForKey:@"专业护理"] count] / 3 * 160 + 160;
            break;
            
        case 4:
            return [[_ServiceModelDict objectForKey:@"居家服务"] count] / 3 * 160 + 160;
            break;
            
        case 5:
            return [[_ServiceModelDict objectForKey:@"健康顾问"] count] / 3 * 160 + 160;
            break;
            
        default:
            return 0;
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenSize.width, 20)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, ScreenSize.width - 10, 20)];
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont systemFontOfSize:12];
    NSString *str;
    switch (section) {
        case 0:
            str = @"康复保健";
            break;
            
        case 1:
            str = @"膳食服务";
            break;
            
        case 2:
            str = @"日托服务";
            break;
            
        case 3:
            str = @"专业护理";
            break;
            
        case 4:
            str = @"居家服务";
            break;
            
        case 5:
            str = @"健康顾问";
            break;
            
        default:
            break;
    }
    label.text = [[_ServiceModelDict allKeys] objectAtIndex:section];
    [view addSubview:label];
    return view;
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
