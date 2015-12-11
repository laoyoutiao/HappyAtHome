//
//  ServerShopping.h
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/23.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServerHeader.h"

typedef NS_ENUM(NSInteger, PayType)
{
    PayTypeOldTicket = 0,
};

typedef NS_ENUM(NSInteger, ProcessType)
{
    ProcessTypeAll     = 0,
    ProcessTypeGoing   = 2,
    ProcessTypeFinlish = 4,
};

typedef void (^sorderBlock)(NSDictionary *sorderdict);
typedef void (^goodsBlock)(NSDictionary *goodsarray);

@interface ServerShopping : NSObject

+ (void)reservationPostUserId:(NSString *)userid ServiceName:(NSString *)servicename PayMoney:(NSInteger)paymoney Paytype:(PayType)paytype Sremark:(NSString *)sremark Address:(NSString *)address Starttime:(NSDate *)starttime Counttime:(NSInteger)counttime;

+ (void)sorderSearchPostUserId:(NSString *)userid Process:(ProcessType)process Block:(sorderBlock)block;

+ (void)goodsPost:(goodsBlock)block;

+ (void)goodsTypePost:(goodsBlock)block;

@end
