//
//  ServerUserInfo.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/21.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "ServerUserInfo.h"

@implementation ServerUserInfo

+ (void)userInfoGetPostUserId:(NSInteger)userid Block:(NSDictionaryBlock)block
{
    NSDictionary *paramdict = @{@"operate":operateUserInfoGet, @"userid":[NSString stringWithFormat:@"%ld",userid]};
    [ServerAFNetworking serverAFNetworking:paramdict SuccessBlock:^(NSURLSessionTask *operation, id resopnObject) {
        block([resopnObject objectForKey:@"response"]);
    } ErrorBlock:^(NSURLSessionTask *operation, NSError *error) {
        
    }];
}

+ (void)userInfoChangePostUserID:(NSString *)userid PersonName:(NSString *)personname Sign:(NSString *)sign Sex:(SexType)sex Zone:(NSString *)zone
{
    NSDictionary *paramdict = @{@"operate":operateUserInfoChange, @"userid":userid};
    
    NSMutableDictionary *mutableparamdict = [[NSMutableDictionary alloc] initWithDictionary:paramdict];
    if (personname) {
        [mutableparamdict setObject:personname forKey:@"personname"];
    }
    if (sign) {
        [mutableparamdict setObject:sign forKey:@"sign"];
    }
    if (sex) {
        [mutableparamdict setObject:sex ? @"1":@"0" forKey:@"sex"];
    }
    if (zone) {
        [mutableparamdict setObject:zone forKey:@"zone"];
    }
    paramdict = mutableparamdict;
    
    [ServerAFNetworking serverAFNetworking:paramdict SuccessBlock:^(NSURLSessionTask *operation, id resopnObject) {
        
    } ErrorBlock:^(NSURLSessionTask *operation, NSError *error) {
        
    }];
}

@end
