//
//  ServerActivity.h
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/24.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServerHeader.h"

typedef NS_ENUM(NSInteger, ActivityPayType)
{
    ActivityPayTypeOldTicket = 0,
};

@interface ServerActivity : NSObject

//按条件获取所有活动
+ (void)activityPostUserId:(NSString *)userid Starttime:(NSDate *)starttime Orderby:(NSString *)orderby Block:(NSArrayBlock)block;

//获取单个活动资料
+ (void)activityPostUserId:(NSString *)userid ActivityId:(NSString *)activityid Block:(NSDictionaryBlock)block;

//获取单个活动报名人员
+ (void)peopleOfActivityPostActivityId:(NSString *)activityid Block:(NSArrayBlock)block;

//报名
+ (void)applyActivityPostUserId:(NSString *)userid ActivityId:(NSString *)activityid PayType:(ActivityPayType)paytype Block:(NSDictionaryBlock)block;

//签到
+ (void)checkinActivityPostUserId:(NSString *)userid ActivityId:(NSString *)activityid Block:(NSDictionaryBlock)block;

@end
