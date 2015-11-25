//
//  ServerOtherFeatures.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/23.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "ServerOtherFeatures.h"

@implementation ServerOtherFeatures

+ (void)oldTicketPostUserId:(NSString *)userid UseFlag:(FlagType)useflag Block:(oldTicketBlock)block
{
    NSString *flag = [[NSString alloc] initWithFormat:@"%ld",useflag];
    NSDictionary *paramdict = @{@"operate":operateOldticket, @"userid":userid, @"userflag":flag};
    [ServerAFNetworking serverAFNetworking:paramdict SuccessBlock:^(NSURLSessionTask *operation, id resopnObject) {
        
    } ErrorBlock:^(NSURLSessionTask *operation, NSError *error) {
        
    }];
}

+ (void)reBackPostUserId:(NSString *)userid Contents:(NSString *)contents
{
    NSDictionary *paramdict = @{@"operate":operateReback, @"userid":userid, @"contents":contents};
    [ServerAFNetworking serverAFNetworking:paramdict SuccessBlock:^(NSURLSessionTask *operation, id resopnObject) {
        
    } ErrorBlock:^(NSURLSessionTask *operation, NSError *error) {
        
    }];
}

+ (void)versionPostVersion:(NSString *)version Block:(versionBlock)block
{
    NSDictionary *paramdict = @{@"operate":operateApk, @"version":version};
    [ServerAFNetworking serverAFNetworking:paramdict SuccessBlock:^(NSURLSessionTask *operation, id resopnObject) {
        
    } ErrorBlock:^(NSURLSessionTask *operation, NSError *error) {
        
    }];
}

@end
