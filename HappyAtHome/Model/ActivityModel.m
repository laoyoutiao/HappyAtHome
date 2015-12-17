//
//  ActivityModel.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/24.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "ActivityModel.h"
#import "NSDictionary+Safe.h"

@implementation ActivityModel

- (id)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        _image = [dict safeStringForKey:@"image"];
        _activityname = [dict safeStringForKey:@"activity_name"];
        _address = [dict safeStringForKey:@"address"];
        _starttime = [dict safeStringForKey:@"starttime"];
        _endtime = [dict safeStringForKey:@"endtime"];
        _uptime = [dict safeStringForKey:@"uptime"];
        _collect = [dict safeIntegerForKey:@"collect"];
        _activityid = [dict safeStringForKey:@"activity_id"];
        _introduce = [dict safeStringForKey:@"introduce"];
        _organization = [dict safeStringForKey:@"organization"];
        _orgintroduce = [dict safeStringForKey:@"org_introduce"];
        _num = [dict safeIntegerForKey:@"people_num"];
        _sign = [dict safeIntegerForKey:@"people_sign"];
        _userstatue = [dict safeIntegerForKey:@"userstatue"];
    }
    return self;
}

+ (NSArray *)instanceArrayDictFromDict:(NSArray *)array
{
    NSMutableArray *instanceArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < [array count]; i ++){
        [instanceArray  addObject:[[self alloc] initWithDictionary:[array objectAtIndex:i]]];
    }
    return [NSArray arrayWithArray:instanceArray];
}

@end
