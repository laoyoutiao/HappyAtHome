//
//  ShopImgModel.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/28.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "ShopImgModel.h"
#import "NSDictionary+Safe.h"

@implementation ShopImgModel

- (id)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        _image = [dict safeStringForKey:@"goodsimage"];
    }
    return self;
}

+ (NSArray *)instanceArrayDictFromArray:(NSArray *)array
{
    NSLog(@"%@",array);
    NSMutableArray *instanceArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < [array count]; i ++){
        [instanceArray  addObject:[[self alloc] initWithDictionary:[array objectAtIndex:i]]];
    }
    return [NSArray arrayWithArray:instanceArray];
}

@end
