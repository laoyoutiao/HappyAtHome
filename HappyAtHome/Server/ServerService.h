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
typedef void (^imgBlcok)(NSArray *imgarray);

@interface ServerService : NSObject

//获取所有服务数据
+ (void)searchPostBlock:(searchBlock)block;

//获取广告栏服务数据
+ (void)serverImgPostBlock:(imgBlcok)block;

//服务评论
+ (void)discussPostWaiterId:(NSString *)waiterid Username:(NSString *)username Word:(NSString *)word Ontime:(NSString *)ontime Attitude:(NSString *)attitude Profession:(NSString *)profession SorderId:(NSString *)sorderid;

//兑换积分规则
+ (void)serverExRulePostBlock;

//积分兑换养老券
+ (void)serverExChangedPostBlock;

@end
