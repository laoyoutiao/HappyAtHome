//
//  ServerShopping.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/23.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "ServerShopping.h"

@implementation ServerShopping

+ (void)reservationPostUserId:(NSString *)userid ServiceName:(NSString *)servicename PayMoney:(NSInteger)paymoney Paytype:(PayType)paytype Sremark:(NSString *)sremark Address:(NSString *)address Starttime:(NSDate *)starttime Counttime:(NSInteger)counttime
{
    NSString *countTime = [NSString stringWithFormat:@"%ld",counttime];
    NSString *payMoney = [NSString stringWithFormat:@"%ld",paymoney];
    NSString *payType = [NSString stringWithFormat:@"%ld",paytype];
    NSDictionary *paramdict = @{@"operate":operateSorderSet, @"userid":userid, @"servicename":servicename, @"paymoney":payMoney, @"paytype":payType, @"sremark":sremark, @"address":address, @"starttime":starttime, @"counttime":countTime};
    [ServerAFNetworking serverAFNetworking:paramdict SuccessBlock:^(NSURLSessionTask *operation, id resopnObject) {
        
    } ErrorBlock:^(NSURLSessionTask *operation, NSError *error) {
        
    }];
}

+ (void)sorderSearchPostUserId:(NSString *)userid Process:(ProcessType)process Block:(sorderBlock)block
{
    NSString *Process = [NSString stringWithFormat:@"%ld",process];
    NSDictionary *paramdict = @{@"operate":operateSorderGet, @"process":Process};
    [ServerAFNetworking serverAFNetworking:paramdict SuccessBlock:^(NSURLSessionTask *operation, id resopnObject) {
        
    } ErrorBlock:^(NSURLSessionTask *operation, NSError *error) {
        
    }];
}

@end
