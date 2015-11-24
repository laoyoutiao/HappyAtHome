//
//  ServerAFNetworking.h
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/21.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^successBlock)(NSURLSessionTask *operation, id resopnObject);
typedef void (^errorBlock)(NSURLSessionTask *operation, NSError *error);

@interface ServerAFNetworking : NSObject

+ (void)serverAFNetworking:(NSDictionary *)paramdict SuccessBlock:(successBlock)successblock ErrorBlock:(errorBlock)errorblock
;

@end
