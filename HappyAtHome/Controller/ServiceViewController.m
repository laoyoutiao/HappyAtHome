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

@interface ServiceViewController ()<ScrollImageFrameDelegate,UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *TableView;
@property (weak, nonatomic) IBOutlet UIView *ScrollImageView;

@property (strong, nonatomic) NSArray *ServiceImageModelArray;
@property (strong, nonatomic) NSDictionary *Service;

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

        [_TableView reloadData];
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
//    return [_TableViewTitleArray count];
    return 0;
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
    }
//    NSLog(@"%@",[_TableViewCellNumArray objectAtIndex:indexPath.section]);
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
