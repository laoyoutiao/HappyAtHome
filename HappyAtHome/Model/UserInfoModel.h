//
//  UserInfoModel.h
//  HappyAtHome
//
//  Created by 玉文辉 on 15/12/11.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfoModel : NSObject

@property (assign, nonatomic) NSInteger age;
@property (assign, nonatomic) NSInteger gold;
@property (assign, nonatomic) NSInteger oldticket;
@property (assign, nonatomic) NSInteger integral;
@property (assign, nonatomic) NSInteger userinfoid;
@property (assign, nonatomic) NSString *userid;

@property (strong, nonatomic) NSString *headimage;
@property (strong, nonatomic) NSString *personname;
@property (strong, nonatomic) NSString *phone;
@property (strong, nonatomic) NSString *sex;
@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *password;

+ (UserInfoModel *)sharedInstance;

- (id)initWithDictionary:(NSDictionary *)dict;


@end
