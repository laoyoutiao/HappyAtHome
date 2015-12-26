//
//  ServerShopping.h
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/23.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServerHeader.h"

typedef NS_ENUM(NSInteger, ShopPayType)
{
    ShopPayTypeOldTicket = 0,
};

typedef NS_ENUM(NSInteger, ProcessType)
{
    ProcessTypeAll     = 0,
    ProcessTypeGoing   = 2,
    ProcessTypeFinlish = 4,
};


@interface ServerShopping : NSObject

//预约订单
+ (void)reservationPostUserId:(NSString *)userid ServiceName:(NSString *)servicename PayMoney:(NSInteger)paymoney Paytype:(ShopPayType)paytype Sremark:(NSString *)sremark Address:(NSString *)address Starttime:(NSDate *)starttime Counttime:(NSInteger)counttime;

//查询订单
+ (void)sorderSearchPostUserId:(NSString *)userid Process:(ProcessType)process Block:(NSDictionaryBlock)block;

//获取所有商品
+ (void)goodsPost:(NSDictionaryBlock)block;

//获取商品类型
+ (void)goodsTypePost:(NSDictionaryBlock)block;

//获取商品详情
+ (void)goodsDetailPostGoodsId:(NSString *)goodsid Block:(NSDictionaryBlock)block;

//商品收藏
+ (void)goodsCollectPostUserId:(NSString *)userid Block:(NSArrayBlock)block;

//加入收藏
+ (void)goodsCollectAddPostGoodsId:(NSString *)goodsid UserId:(NSString *)userid;

//删除收藏
+ (void)goodsCollectDeletePostCollectId:(NSString *)collectid;

//购物车
+ (void)goodsCarPostUserId:(NSString *)userid Block:(NSArrayBlock)block;

//添加购物车
+ (void)goodsCarAddPostUserId:(NSString *)userid GoodsId:(NSString *)goodsid GetCount:(NSInteger)count GetType:(NSInteger)type GetColor:(NSInteger)color;

//删除购物车
+ (void)goodsCarDeletePostGoodsName:(NSString *)goodsname;

//修改购物车内容
+ (void)goodsCarChangePostGoodsShopCarId:(NSString *)shoppingcartid GetCount:(NSInteger)count GetType:(NSInteger)type GetColor:(NSInteger)color;




@end
