//
//  UserInfoModel.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/12/11.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "UserInfoModel.h"
#import "NSDictionary+Safe.h"

@implementation UserInfoModel

+ (UserInfoModel *)sharedInstance
{
    static UserInfoModel *sharedManager;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[UserInfoModel alloc] init];
    });
    
    return sharedManager;
}

- (id)initWithDictionary:(NSDictionary *)dict
{
    if (self == [super init]) {
        _age = [dict safeIntegerForKey:@"age"];
        _gold = [dict safeIntegerForKey:@"gold"];
        _oldticket = [dict safeIntegerForKey:@"oldticket"];
        _integral = [dict safeIntegerForKey:@"integral"];
        _userinfoid = [dict safeIntegerForKey:@"userinfo_id"];
        _userid = [dict safeIntegerForKey:@"userid"];
        
        _headimage = [dict safeStringForKey:@"img_header"];
        _personname = [dict safeStringForKey:@"personnanme"];
        _phone = [dict safeStringForKey:@"phone"];
        _sex = [dict safeStringForKey:@"sex"]? @"男":@"女";
        _username = [dict safeStringForKey:@"username"];
        _password = [dict safeStringForKey:@"password"];

    }
    return self;
}

@end
