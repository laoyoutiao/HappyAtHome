//
//  ServerActivity.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/24.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "ServerActivity.h"

@implementation ServerActivity

+ (void)activityPostUserId:(NSString *)userid Starttime:(NSDate *)starttime Orderby:(NSString *)orderby Block:(activityBlcok)block
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
//        NSLog(@"%@",resopnObject);
    } ErrorBlock:^(NSURLSessionTask *operation, NSError *error) {
        
    }];
}

@end
