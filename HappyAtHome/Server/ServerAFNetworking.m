//
//  ServerAFNetworking.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/21.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "ServerAFNetworking.h"
#import "ServerHeader.h"

@implementation ServerAFNetworking

+ (void)serverAFNetworking:(NSDictionary *)paramdict SuccessBlock:(successBlock)successblock ErrorBlock:(errorBlock)errorblock
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 20;
    [manager POST:[NSString stringWithFormat:@"%@",ServerURL] parameters:paramdict success:^(NSURLSessionTask *operation, id responObject)
     {
         successblock(operation, responObject);
     } failure:^(NSURLSessionTask *operation, NSError *error) {
         NSLog(@"%@",error);
         errorblock(operation, error);
     }];
}

@end
