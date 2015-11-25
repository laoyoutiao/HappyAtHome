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

typedef void (^userInfoBlock)(NSDictionary *userinfodict);

@interface ServerUserInfo : NSObject

+ (void)userInfoGetPostUserId:(NSString *)userid Block:(userInfoBlock)block;

+ (void)userInfoChangePostUserID:(NSString *)userid PersonName:(NSString *)personname Sign:(NSString *)sign Sex:(SexType)sex Zone:(NSString *)zone;

@end
