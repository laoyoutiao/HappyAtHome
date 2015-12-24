//
//  ShopGoodsViewController.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/12/22.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "ShopGoodsViewController.h"
#import "ServerHeader.h"
#import "MyHeader.h"
#import "UIImageView+WebCache.h"

@interface ShopGoodsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;
@property (weak, nonatomic) IBOutlet UILabel *PriceLbl;
@property (weak, nonatomic) IBOutlet UILabel *IntroduceLbl;
@property (weak, nonatomic) IBOutlet UILabel *AddressLbl;
@property (weak, nonatomic) IBOutlet UILabel *PhoneLbl;
@property (weak, nonatomic) IBOutlet UILabel *ContentLbl;
@property (weak, nonatomic) IBOutlet UIView *AddView;

@end

@implementation ShopGoodsViewController
{
    ShopModel *_model;
}

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

#pragma mark UI Or Data

- (void)setNavigation
{
    self.title = @"商品详情";
}

- (void)setFixedData
{
    [_ImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ServerImgURL,_model.image]]];
    _PriceLbl.text = [NSString stringWithFormat:@"售价\n￥%.1f",_model.price];
    _IntroduceLbl.text = [NSString stringWithFormat:@"%@\n销量:%ld",_model.goodsname,_model.salesvolume];
    _AddressLbl.text = [NSString stringWithFormat:@"  发货地:%@",_model.shopaddress];
    _PhoneLbl.text = [NSString stringWithFormat:@"  订购热线"];
    _ContentLbl.text = [NSString stringWithFormat:@"  评论: (共0条)"];
    
}

- (void)getShopGoodsModel:(ShopModel *)model
{
    _model = model;
}

#pragma mark ClickResponse

- (IBAction)clickCallPhone:(id)sender {
    
}

- (IBAction)clickWriteContent:(id)sender {
    
}

- (IBAction)clickShopCar:(id)sender {
    
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
