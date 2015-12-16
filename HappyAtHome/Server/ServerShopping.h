//
//  ServerShopping.h
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/23.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServerHeader.h"

typedef NS_ENUM(NSInteger, ShopPayType)
{
    ShopPayTypeOldTicket = 0,
};

typedef NS_ENUM(NSInteger, ProcessType)
{
    ProcessTypeAll     = 0,
    ProcessTypeGoing   = 2,
    ProcessTypeFinlish = 4,
};


@interface ServerShopping : NSObject


+ (void)reservationPostUserId:(NSString *)userid ServiceName:(NSString *)servicename PayMoney:(NSInteger)paymoney Paytype:(ShopPayType)paytype Sremark:(NSString *)sremark Address:(NSString *)address Starttime:(NSDate *)starttime Counttime:(NSInteger)counttime;

+ (void)sorderSearchPostUserId:(NSString *)userid Process:(ProcessType)process Block:(NSDictionaryBlock)block;

+ (void)goodsPost:(NSDictionaryBlock)block;

+ (void)goodsTypePost:(NSDictionaryBlock)block;

@end
