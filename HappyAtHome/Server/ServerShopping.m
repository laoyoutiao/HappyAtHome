//
//  ServerShopping.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/23.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "ServerShopping.h"

@implementation ServerShopping

+ (void)reservationPostUserId:(NSString *)userid ServiceName:(NSString *)servicename PayMoney:(NSInteger)paymoney Paytype:(ShopPayType)paytype Sremark:(NSString *)sremark Address:(NSString *)address Starttime:(NSDate *)starttime Counttime:(NSInteger)counttime
{
    NSString *countTime = [NSString stringWithFormat:@"%ld",counttime];
    NSString *payMoney = [NSString stringWithFormat:@"%ld",paymoney];
    NSString *payType = [NSString stringWithFormat:@"%ld",paytype];
    NSDictionary *paramdict = @{@"operate":operateSorderSet, @"userid":userid, @"servicename":servicename, @"paymoney":payMoney, @"paytype":payType, @"sremark":sremark, @"address":address, @"starttime":starttime, @"counttime":countTime};
    [ServerAFNetworking serverAFNetworking:paramdict SuccessBlock:^(NSURLSessionTask *operation, id resopnObject) {
        
    } ErrorBlock:^(NSURLSessionTask *operation, NSError *error) {
        
    }];
}

+ (void)sorderSearchPostUserId:(NSString *)userid Process:(ProcessType)process Block:(NSDictionaryBlock)block
{
    NSString *Process = [NSString stringWithFormat:@"%ld",process];
    NSDictionary *paramdict = @{@"operate":operateSorderGet, @"process":Process};
    [ServerAFNetworking serverAFNetworking:paramdict SuccessBlock:^(NSURLSessionTask *operation, id resopnObject) {
        
    } ErrorBlock:^(NSURLSessionTask *operation, NSError *error) {
        
    }];
}

+ (void)goodsPost:(NSDictionaryBlock)block
{
    NSDictionary *paramdict = @{@"operate":operateGoodsInfo};
    [ServerAFNetworking serverAFNetworking:paramdict SuccessBlock:^(NSURLSessionTask *operation, id resopnObject) {
//        NSLog(@"%@",resopnObject);
        block([resopnObject objectForKey:@"response"]);
    } ErrorBlock:^(NSURLSessionTask *operation, NSError *error) {
        
    }];
}

+ (void)goodsTypePost:(NSDictionaryBlock)block
{
    NSDictionary *paramdict = @{@"operate":operateGoodsType};
    [ServerAFNetworking serverAFNetworking:paramdict SuccessBlock:^(NSURLSessionTask *operation, id resopnObject) {
        block([resopnObject objectForKey:@"response"]);
    } ErrorBlock:^(NSURLSessionTask *operation, NSError *error) {
        
    }];
}

+ (void)goodsDetailPostGoodsId:(NSString *)goodsid Block:(NSDictionaryBlock)block
{
    NSDictionary *paramdict = @{@"operate":operateGoodsDetail,@"goods_id":goodsid};
    [ServerAFNetworking serverAFNetworking:paramdict SuccessBlock:^(NSURLSessionTask *operation, id resopnObject) {
        block([resopnObject objectForKey:@"response"]);
    } ErrorBlock:^(NSURLSessionTask *operation, NSError *error) {
        
    }];
}

+ (void)goodsCollectPostUserId:(NSString *)userid Block:(NSArrayBlock)block
{
    NSDictionary *paramdict = @{@"operate":operateCollectGet,@"userid":userid};
    [ServerAFNetworking serverAFNetworking:paramdict SuccessBlock:^(NSURLSessionTask *operation, id resopnObject) {
        block([resopnObject objectForKey:@"response"]);
    } ErrorBlock:^(NSURLSessionTask *operation, NSError *error) {
        
    }];
}

+ (void)goodsCollectAddPostGoodsId:(NSString *)goodsid UserId:(NSString *)userid
{
    NSDictionary *paramdict = @{@"operate":operateCollectAdd,@"userid":userid,@"goods_id":goodsid};
    [ServerAFNetworking serverAFNetworking:paramdict SuccessBlock:^(NSURLSessionTask *operation, id resopnObject) {
        NSLog(@"%@",resopnObject);
    } ErrorBlock:^(NSURLSessionTask *operation, NSError *error) {
        
    }];
}

+ (void)goodsCollectDeletePostCollectId:(NSString *)collectid
{
    NSDictionary *paramdict = @{@"operate":operateCollectDelete,@"collect_id":collectid};
    [ServerAFNetworking serverAFNetworking:paramdict SuccessBlock:^(NSURLSessionTask *operation, id resopnObject) {
        NSLog(@"%@",resopnObject);
    } ErrorBlock:^(NSURLSessionTask *operation, NSError *error) {
        
    }];
}

+ (void)goodsCarPostUserId:(NSString *)userid Block:(NSArrayBlock)block
{
    NSDictionary *paramdict = @{@"operate":operateShoppingCartGet,@"userid":userid};
    [ServerAFNetworking serverAFNetworking:paramdict SuccessBlock:^(NSURLSessionTask *operation, id resopnObject) {
        block([resopnObject objectForKey:@"response"]);
    } ErrorBlock:^(NSURLSessionTask *operation, NSError *error) {
        
    }];
}

+ (void)goodsCarAddPostUserId:(NSString *)userid GoodsId:(NSString *)goodsid GetCount:(NSInteger)count GetType:(NSInteger)type GetColor:(NSInteger)color
{
    NSDictionary *paramdict = @{@"operate":operateShoppingCartAdd,@"userid":userid,@"goods_id":goodsid,@"getcount":[NSString stringWithFormat:@"%ld",count],@"gettype":[NSString stringWithFormat:@"%ld",type],@"getcolor":[NSString stringWithFormat:@"%ld",color]};
    [ServerAFNetworking serverAFNetworking:paramdict SuccessBlock:^(NSURLSessionTask *operation, id resopnObject) {
        NSLog(@"%@",resopnObject);
    } ErrorBlock:^(NSURLSessionTask *operation, NSError *error) {
        
    }];
}

+ (void)goodsCarDeletePostGoodsName:(NSString *)goodsname
{
    NSDictionary *paramdict = @{@"operate":operateShoppingCartDelete,@"goodsname":goodsname};
    [ServerAFNetworking serverAFNetworking:paramdict SuccessBlock:^(NSURLSessionTask *operation, id resopnObject) {
        NSLog(@"%@",resopnObject);
    } ErrorBlock:^(NSURLSessionTask *operation, NSError *error) {
        
    }];
}

+ (void)goodsCarChangePostGoodsShopCarId:(NSString *)shoppingcartid GetCount:(NSInteger)count GetType:(NSInteger)type GetColor:(NSInteger)color
{
    NSDictionary *paramdict = @{@"operate":operateShoppingCartChange,@"shoppingcart_id":shoppingcartid,@"getcount":[NSString stringWithFormat:@"%ld",count],@"gettype":[NSString stringWithFormat:@"%ld",type],@"getcolor":[NSString stringWithFormat:@"%ld",color]};
    [ServerAFNetworking serverAFNetworking:paramdict SuccessBlock:^(NSURLSessionTask *operation, id resopnObject) {
        NSLog(@"%@",resopnObject);
    } ErrorBlock:^(NSURLSessionTask *operation, NSError *error) {
        
    }];
}


@end
