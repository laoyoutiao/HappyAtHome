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

#define cellheightmodulus 150

@interface ServiceViewController ()<ScrollImageFrameDelegate,UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>
{
    NSInteger collectioncellnum;
    NSString *collectioncelltitle;
}
@property (weak, nonatomic) IBOutlet UITableView *TableView;
@property (strong, nonatomic) UIView *ScrollImageView;

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

- (void)setFixedData
{
    [ServerService serverImgPostBlock:^(NSArray *imgarray) {
        _ServiceImageModelArray = [ServiceImgModel instanceArrayDictFromDict:imgarray];
        [self setScrollImageView];
    }];
    
    [ServerService searchPostBlock:^(NSArray *searcharray) {
        _ServiceModelDict = [ServiceModel instanceArrayDictFromDict:searcharray];
        [_TableView reloadData];
        [[_ServiceModelDict allKeys] count]? [_TableView setHidden:NO]:nil;
    }];
}

- (void)setScrollImageView
{
    _ScrollImageView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenSize.width, 150)];
        NSMutableArray *itemArray = [NSMutableArray arrayWithCapacity:[_ServiceImageModelArray count]+2];
        if ([_ServiceImageModelArray count] > 1)
        {
            ServiceImgModel *model = [_ServiceImageModelArray objectAtIndex:[_ServiceImageModelArray count]-1];
            ScrollImageItem *item = [[ScrollImageItem alloc] initWithTitle:nil image:model.image tag:-1];
            [itemArray addObject:item];
        }
        for (int i = 0; i < [_ServiceImageModelArray count]; i++)
        {
            ServiceImgModel *model = [_ServiceImageModelArray objectAtIndex:i];
            ScrollImageItem *item = [[ScrollImageItem alloc] initWithTitle:nil image:model.image tag:i];
            [itemArray addObject:item];
        }
        //添加第一张图 用于循环
        if ([_ServiceImageModelArray count] >1)
        {
            ServiceImgModel *model = [_ServiceImageModelArray objectAtIndex:0];
            ScrollImageItem *item = [[ScrollImageItem alloc] initWithTitle:nil image:model.image tag:[_ServiceImageModelArray count]];
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


#pragma makr TableViewDelegate
#pragma --------------------------

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 170;
    }else
    {
        return 20;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenSize.width, 150)];
        [view addSubview:_ScrollImageView];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 150, ScreenSize.width - 10, 20)];
        label.textAlignment = NSTextAlignmentLeft;
        label.font = [UIFont systemFontOfSize:12];
        NSString *str = [self switchToCellString:section];
        label.text = str;
        [view addSubview:label];
        return view;
    }else
    {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenSize.width, 20)];
        view.backgroundColor = [UIColor whiteColor];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, ScreenSize.width - 10, 20)];
        label.textAlignment = NSTextAlignmentLeft;
        label.font = [UIFont systemFontOfSize:12];
        NSString *str = [self switchToCellString:section];
        label.text = str;
        [view addSubview:label];
        return view;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[_ServiceModelDict allKeys] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[_ServiceModelDict allKeys] count]? 1:0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UICollectionViewFlowLayout *collectviewlayout = [[UICollectionViewFlowLayout alloc] init];
    NSInteger height;
    NSString *str = [self switchToCellString:indexPath.section];
    height = [[_ServiceModelDict objectForKey:str] count] / 3 * cellheightmodulus + cellheightmodulus;
    UICollectionView *collectview = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, ScreenSize.width, height) collectionViewLayout:collectviewlayout];
    collectview.delegate = self;
    collectview.dataSource = self;
    [cell addSubview:collectview];
    [collectview registerClass:[UICollectionViewCell class]forCellWithReuseIdentifier:@"cell"];
    collectview.scrollEnabled = NO;
    collectview.backgroundColor = [UIColor whiteColor];
    collectioncellnum = [[_ServiceModelDict objectForKey:str] count];
    collectioncelltitle = str;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *str = [self switchToCellString:indexPath.section];
    return [[_ServiceModelDict objectForKey:str] count] / 3 * cellheightmodulus + cellheightmodulus;
}

#pragma makr CollectionViewDelegate
#pragma --------------------------

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return collectioncellnum;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, (ScreenSize.width - 5) / 3, cellheightmodulus - 51)];
    [cell addSubview:imageview];
    
    ServiceModel *model = [[_ServiceModelDict objectForKey:collectioncelltitle] objectAtIndex:indexPath.row];
    imageview.image = model.image;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",indexPath.row);
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((ScreenSize.width - 5) / 3,  cellheightmodulus - 1);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(1, 1, 1, 1);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}

#pragma mark SelfMethod
#pragma ---------------

- (NSString *)switchToCellString:(NSInteger)num
{
    NSString *str;
    switch (num) {
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
    return str;
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
