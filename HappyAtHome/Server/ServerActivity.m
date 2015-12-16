//
//  ServerActivity.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/24.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "ServerActivity.h"

@implementation ServerActivity

+ (void)activityPostUserId:(NSString *)userid Starttime:(NSDate *)starttime Orderby:(NSString *)orderby Block:(NSArrayBlock)block
{
    NSDictionary *paramdict = @{@"operate":operateActivityAll};
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithDictionary:paramdict];
    if (userid) {
        [dict setObject:userid forKey:@"userid"];
    }
    if (starttime) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        NSString *startTime = [formatter stringFromDate:starttime];
        [dict setObject:startTime forKey:@"starttime"];
    }
    if (orderby)
    {
        [dict setObject:orderby forKey:@"orderby"];
    }
    paramdict = dict;
    [ServerAFNetworking serverAFNetworking:paramdict SuccessBlock:^(NSURLSessionTask *operation, id resopnObject) {
        block([resopnObject objectForKey:@"response"]);
        NSLog(@"%@",[resopnObject objectForKey:@"msg"]);
    } ErrorBlock:^(NSURLSessionTask *operation, NSError *error) {
        
    }];
}

+ (void)activityPostUserId:(NSString *)userid ActivityId:(NSString *)activityid Block:(NSDictionaryBlock)block
{
    NSDictionary *paramdict = @{@"operate":operateActivityDetail,@"userid":userid,@"activity_id":activityid};
    [ServerAFNetworking serverAFNetworking:paramdict SuccessBlock:^(NSURLSessionTask *operation, id resopnObject) {
        block([resopnObject objectForKey:@"response"]);
        //        NSLog(@"%@",resopnObject);
    } ErrorBlock:^(NSURLSessionTask *operation, NSError *error) {
        
    }];
}

+ (void)peopleOfActivityPostActivityId:(NSString *)activityid Block:(NSArrayBlock)block
{
    NSDictionary *paramdict = @{@"operate":operateCompettorGet,@"activity_id":activityid};
    [ServerAFNetworking serverAFNetworking:paramdict SuccessBlock:^(NSURLSessionTask *operation, id resopnObject) {
        block([resopnObject objectForKey:@"response"]);
        //        NSLog(@"%@",resopnObject);
    } ErrorBlock:^(NSURLSessionTask *operation, NSError *error) {
        
    }];
}

+ (void)applyActivityPostUserId:(NSString *)userid ActivityId:(NSString *)activityid PayType:(ActivityPayType)paytype Block:(NSDictionaryBlock)block
{
    NSDictionary *paramdict = @{@"operate":operateCompettorAdd,@"activity_id":activityid,@"userid":userid};
    [ServerAFNetworking serverAFNetworking:paramdict SuccessBlock:^(NSURLSessionTask *operation, id resopnObject) {
        block(resopnObject);
    } ErrorBlock:^(NSURLSessionTask *operation, NSError *error) {
        
    }];
}

+ (void)checkinActivityPostUserId:(NSString *)userid ActivityId:(NSString *)activityid Block:(NSDictionaryBlock)block
{
    NSDictionary *paramdict = @{@"operate":operateCompettroSign,@"activity_id":activityid,@"userid":userid};
    [ServerAFNetworking serverAFNetworking:paramdict SuccessBlock:^(NSURLSessionTask *operation, id resopnObject) {
        block(resopnObject);
    } ErrorBlock:^(NSURLSessionTask *operation, NSError *error) {
        
    }];
}

@end
