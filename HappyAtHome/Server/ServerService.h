//
//  ServerService.h
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/24.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServerHeader.h"

typedef void (^searchBlock)(NSArray *searcharray);
typedef void (^clickadBlock)(NSDictionary *clickaddict);
typedef void (^imgBlcok)(NSArray *imgarray);

@interface ServerService : NSObject

+ (void)searchPostBlock:(searchBlock)block;

+ (void)clickAdvertisingPostServiceId:(NSString *)serviceid Block:(clickadBlock)block;

+ (void)serverImgPostBlock:(imgBlcok)block;

+ (void)discussPostWaiterId:(NSString *)waiterid Username:(NSString *)username Word:(NSString *)word Ontime:(NSString *)ontime Attitude:(NSString *)attitude Profession:(NSString *)profession SorderId:(NSString *)sorderid;

@end
