//
//  ServerLoginOrRegister.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/21.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "ServerLoginOrRegister.h"

@implementation ServerLoginOrRegister

+ (void)loginPostPhone:(NSString *)username Pass:(NSString *)password Block:(NSDictionaryBlock)block
{
    NSDictionary *paramdict = @{@"operate":operateLogin, @"phone":username, @"password":password};
    [ServerAFNetworking serverAFNetworking:paramdict SuccessBlock:^(NSURLSessionTask *operation, id responObject){
        block([responObject objectForKey:@"response"]);
    } ErrorBlock:^(NSURLSessionTask *operation, NSError *error){
         
    }];
}

+ (void)registerPostPhone:(NSString *)username Pass:(NSString *)password Id:(NSString *)idcard
{
    NSDictionary *paramdict = @{@"operate":operateRegister, @"phone":username, @"password":password, @"idcard":idcard, @"mobile":@"1"}; // mobile 0 安卓 1 iOS
    [ServerAFNetworking serverAFNetworking:paramdict SuccessBlock:^(NSURLSessionTask *operation, id resopnObject) {
        NSLog(@"%@",[resopnObject objectForKey:@"msg"]);
    } ErrorBlock:^(NSURLSessionTask *operation, NSError *error) {
        
    }];
}

@end
