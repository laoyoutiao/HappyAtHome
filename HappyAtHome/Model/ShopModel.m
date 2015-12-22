//
//  ShopImgModel.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/28.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "ShopModel.h"
#import "NSDictionary+Safe.h"

@implementation ShopModel

- (id)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        _image          = [dict safeStringForKey:@"goodsimage"];
        _childname      = [dict safeStringForKey:@"childname"];
        _collectid      = [dict safeStringForKey:@"collect_id"];
        _goodsid        = [dict safeStringForKey:@"goods_id"];
        _goodsname      = [dict safeStringForKey:@"goodsname"];
        _parentname     = [dict safeStringForKey:@"parentname"];
        _shopaddress    = [dict safeStringForKey:@"shopaddress"];
        _discount       = [dict safeIntegerForKey:@"discount"];
        _price          = [dict safeFloatForKey:@"price"];
        _salesvolume    = [dict safeIntegerForKey:@"salesvolume"];
    }
    return self;
}

+ (NSArray *)instanceArrayDictFromArray:(NSArray *)array
{
//    NSLog(@"%@",array);
    NSMutableArray *instanceArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < [array count]; i ++){
        [instanceArray  addObject:[[self alloc] initWithDictionary:[array objectAtIndex:i]]];
    }
    return [NSArray arrayWithArray:instanceArray];
}

@end
