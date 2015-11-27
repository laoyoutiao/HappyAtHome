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
        _serviceId = [dict safeIntegerForKey:@"service_id"];
        _serverImgId = [dict safeIntegerForKey:@"serverimg_id"];
        _image = [dict safeStringForKey:@"logo"];
    }
    return self;
}

+ (NSDictionary *)instanceArrayDictFromDict:(NSArray *)array
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
            NSLog(@"%@",dict);
        }
    }
    return [NSDictionary dictionaryWithDictionary:dict];
}

@end
