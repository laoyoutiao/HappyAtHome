//
//  ServiceImgModel.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/24.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "ServiceImgModel.h"
#import "NSDictionary+Safe.h"

@implementation ServiceImgModel

- (id)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        _serviceId = [dict safeIntegerForKey:@"service_id"];
        _serverImgId = [dict safeIntegerForKey:@"serverimg_id"];
        NSData *imagedata = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://192.168.1.146:8080//EnjoyLiveHome/%@",[dict safeStringForKey:@"logo"]]]];
        UIImage *image = [UIImage imageWithData:imagedata];
        _image = image;
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
