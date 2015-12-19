//
//  ServerService.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/24.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "ServerService.h"

@implementation ServerService

+ (void)serverPostBlock:(NSArrayBlock)block
{
    NSDictionary *paramdict = @{@"operate":operateServiceLook};
    [ServerAFNetworking serverAFNetworking:paramdict SuccessBlock:^(NSURLSessionTask *operation, id resopnObject) {
        block([resopnObject objectForKey:@"response"]);
//        NSLog(@"%@",resopnObject);
    } ErrorBlock:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}

+ (void)serverImgPostBlock:(NSArrayBlock)block
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

+ (void)serverExRulePostBlock:(NSArrayBlock)block
{
    NSDictionary *paramdict = @{@"operate":operateExGet};
    [ServerAFNetworking serverAFNetworking:paramdict SuccessBlock:^(NSURLSessionTask *operation, id resopnObject) {
                block([resopnObject objectForKey:@"response"]);
        //        NSLog(@"%@",[resopnObject objectForKey:@"response"]);
    } ErrorBlock:^(NSURLSessionTask *operation, NSError *error) {
        
    }];
}

+ (void)serverExChangedPostUserId:(NSString *)userid Integral:(NSInteger)integral OldTicket:(NSInteger)oldticket Block:(NSDictionaryBlock)block
{
    NSDictionary *paramdict = @{@"operate":operateExChanged,@"userid":userid,@"integral":[NSString stringWithFormat:@"%ld",integral],@"money":[NSString stringWithFormat:@"%ld",oldticket]};
    [ServerAFNetworking serverAFNetworking:paramdict SuccessBlock:^(NSURLSessionTask *operation, id resopnObject) {
        block(resopnObject);
        NSLog(@"%@",resopnObject);
    } ErrorBlock:^(NSURLSessionTask *operation, NSError *error) {
        
    }];
}

@end
