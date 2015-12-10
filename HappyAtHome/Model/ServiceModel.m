//
//  ServiceModel.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/25.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "ServiceModel.h"

@implementation ServiceModel

- (id)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        _name = [dict safeStringForKey:@"service_name"];
        _introduce = [dict safeStringForKey:@"introduce"];
        _count = [dict safeIntegerForKey:@"getcount"];
        _hint = [dict safeStringForKey:@"hint"];
        _money = [dict safeFloatForKey:@"money0"];
        _image = [dict safeStringForKey:@"logo"];
    }
    return self;
}

+ (NSDictionary *)instanceArrayDictFromArray:(NSArray *)array
{
    NSLog(@"%@",array);
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    for (NSDictionary *dictionary in array) {
        if ([dictionary objectForKey:@"services"] && [dictionary objectForKey:@"title"]) {
            NSArray *arr = [dictionary objectForKey:@"services"];
            NSMutableArray *modelarray = [[NSMutableArray alloc] init];
            for (int i = 0; i < [arr count];i ++) {
                [modelarray addObject:[[self alloc] initWithDictionary:[arr objectAtIndex:i]]];
            }
            [dict setObject:modelarray forKey:[dictionary objectForKey:@"title"]];
        }
    }
    return [NSDictionary dictionaryWithDictionary:dict];
}

@end
