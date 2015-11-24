//
//  ServerLoginOrRegister.h
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/21.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^loginBlock)(NSDictionary *logindict);

@interface ServerLoginOrRegister : NSObject

+ (void)loginPostPhone:(NSString *)username Pass:(NSString *)password Block:(loginBlock)block;
+ (void)registerPostPhone:(NSString *)username Pass:(NSString *)password Id:(NSString *)idcard;

@end
