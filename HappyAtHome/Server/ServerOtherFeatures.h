//
//  ServerOtherFeatures.h
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/23.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServerHeader.h"

typedef NS_ENUM(NSInteger, FlagType)
{
    FlagTypeCanUse  = 0,
    FlagTypeUseOut  = 1,
    FlagTypeTimeOut = 2,
};


@interface ServerOtherFeatures : NSObject

// flag 0查询可用的，1查询已用完的，2查询没用完过期的
+ (void)oldTicketPostUserId:(NSString *)userid UseFlag:(FlagType)useflag Block:(NSDictionaryBlock)block;

// 评论
+ (void)reBackPostUserId:(NSString *)userid Contents:(NSString *)contents;

//检测版本
+ (void)versionPostVersion:(NSString *)version Block:(NSDictionaryBlock)block;

@end
