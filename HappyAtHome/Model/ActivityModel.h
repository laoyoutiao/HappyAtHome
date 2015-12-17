//
//  ActivityModel.h
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/24.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityModel : NSObject

@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *activityname;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *starttime;
@property (nonatomic, strong) NSString *endtime;
@property (nonatomic, strong) NSString *uptime;
@property (nonatomic, strong) NSString *introduce;
@property (nonatomic, strong) NSString *activityid;
@property (nonatomic, strong) NSString *orgintroduce;
@property (nonatomic, strong) NSString *organization;

@property (nonatomic, assign) NSInteger userstatue;
@property (nonatomic, assign) NSInteger num;
@property (nonatomic, assign) NSInteger sign;
@property (nonatomic, assign) NSInteger collect;


- (id)initWithDictionary:(NSDictionary *)dict;

+ (NSArray *)instanceArrayDictFromDict:(NSArray *)array;

@end
