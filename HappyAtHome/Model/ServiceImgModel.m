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
        _name = [dict safeStringForKey:@"service_name"];
        _serviceId = [dict safeIntegerForKey:@"service_id"];
        _serverImgId = [dict safeIntegerForKey:@"serverimg_id"];
        _image = [dict safeStringForKey:@"logo"];
        _introduce = [dict safeStringForKey:@"introduce"];
        _count = [dict safeIntegerForKey:@"getcount"];
        _hint = [dict safeStringForKey:@"hint"];
        _money = [dict safeFloatForKey:@"money0"];
    }
    return self;
}

+ (ServiceModel *)changeServiceModel:(ServiceImgModel *)serviceimgmodel
{
    ServiceModel *model = [[ServiceModel alloc] init];
    model.name = serviceimgmodel.name;
    model.introduce = serviceimgmodel.introduce;
    model.count = serviceimgmodel.count;
    model.hint = serviceimgmodel.hint;
    model.money = serviceimgmodel.money;
    return model;
}

+ (NSArray *)instanceArrayDictFromDict:(NSArray *)array
{
//    NSLog(@"%@",array);
    NSMutableArray *instanceArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < [array count]; i ++){
        [instanceArray  addObject:[[self alloc] initWithDictionary:[array objectAtIndex:i]]];
    }
    return [NSArray arrayWithArray:instanceArray];
}

@end
