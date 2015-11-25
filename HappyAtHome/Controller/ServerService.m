//
//  ServerService.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/24.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "ServerService.h"

@implementation ServerService

+ (void)searchPostBlock:(searchBlock)block
{
    NSDictionary *paramdict = @{@"operate":operateServiceLook};
    [ServerAFNetworking serverAFNetworking:paramdict SuccessBlock:^(NSURLSessionTask *operation, id resopnObject) {
        block([resopnObject objectForKey:@"response"]);
    } ErrorBlock:^(NSURLSessionTask *operation, NSError *error) {
        
    }];
}

+ (void)clickAdvertisingPostServiceId:(NSString *)serviceid Block:(clickadBlock)block
{
    NSDictionary *paramdict = @{@"operate":operateAdvertisingClick, @"serviceid":serviceid};
    [ServerAFNetworking serverAFNetworking:paramdict SuccessBlock:^(NSURLSessionTask *operation, id resopnObject) {
        
    } ErrorBlock:^(NSURLSessionTask *operation, NSError *error) {
        
    }];
}

+ (void)serverImgPostBlock:(imgBlcok)block
{
    NSDictionary *paramdict = @{@"operate":operateAdvertisingLook};
    [ServerAFNetworking serverAFNetworking:paramdict SuccessBlock:^(NSURLSessionTask *operation, id resopnObject) {
        block([resopnObject objectForKey:@"response"]);
//        NSLog(@"%@",resopnObject);
    } ErrorBlock:^(NSURLSessionTask *operation, NSError *error) {
        
    }];
}

+ (void)discussPostWaiterId:(NSString *)waiterid Username:(NSString *)username Word:(NSString *)word Ontime:(NSString *)ontime Attitude:(NSString *)attitude Profession:(NSString *)profession SorderId:(NSString *)sorderid
{
    NSDictionary *paramdict = @{@"operate":operateDiscuss, @"waiterid":waiterid, @"username":username, @"ontime":ontime, @"attitude":attitude, @"profession":profession, @"sorderid":sorderid};
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithDictionary:paramdict];
    if (word) {
        [dict setObject:word forKey:@"word"];
    }
    paramdict = dict;
    [ServerAFNetworking serverAFNetworking:paramdict SuccessBlock:^(NSURLSessionTask *operation, id resopnObject) {
        
    } ErrorBlock:^(NSURLSessionTask *operation, NSError *error) {
        
    }];
}

@end
