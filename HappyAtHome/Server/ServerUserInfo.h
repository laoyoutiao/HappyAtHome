//
//  ServerUserInfo.h
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/21.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServerHeader.h"

typedef NS_ENUM(NSInteger, SexType)
{
    SexTypeBoy  = 0,
    SexTypeGirl = 1,
};

@interface ServerUserInfo : NSObject

//获取个人资料
+ (void)userInfoGetPostUserId:(NSInteger)userid Block:(NSDictionaryBlock)block;

//修改个人资料
+ (void)userInfoChangePostUserID:(NSString *)userid PersonName:(NSString *)personname Sign:(NSString *)sign Sex:(SexType)sex Zone:(NSString *)zone;

@end
