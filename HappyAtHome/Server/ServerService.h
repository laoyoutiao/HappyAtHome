//
//  ServerService.h
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/24.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServerHeader.h"


@interface ServerService : NSObject

//获取所有服务数据
+ (void)serverPostBlock:(NSArrayBlock)block;

//获取广告栏服务数据
+ (void)serverImgPostBlock:(NSArrayBlock)block;

//服务评论
+ (void)discussPostWaiterId:(NSString *)waiterid Username:(NSString *)username Word:(NSString *)word Ontime:(NSString *)ontime Attitude:(NSString *)attitude Profession:(NSString *)profession SorderId:(NSString *)sorderid;

//兑换积分规则
+ (void)serverExRulePostBlock:(NSArrayBlock)block;

//积分兑换养老券
+ (void)serverExChangedPostUserId:(NSString *)userid Integral:(NSInteger)integral OldTicket:(NSInteger)oldticket Block:(NSDictionaryBlock)block;

@end
