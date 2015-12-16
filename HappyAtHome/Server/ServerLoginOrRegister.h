//
//  ServerLoginOrRegister.h
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/21.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServerHeader.h"

@interface ServerLoginOrRegister : NSObject

//登录
+ (void)loginPostPhone:(NSString *)username Pass:(NSString *)password Block:(NSDictionaryBlock)block;

//注册
+ (void)registerPostPhone:(NSString *)username Pass:(NSString *)password Id:(NSString *)idcard;

@end
