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
        NSData *imagedata = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://61.142.211.110:92//EnjoyLiveHome/%@",[dict safeStringForKey:@"goodsimage"]]]];
        UIImage *image = [UIImage imageWithData:imagedata];
        _image = image;
    }
    return self;
}

+ (NSArray *)instanceArrayDictFromArray:(NSArray *)array
{
    NSMutableArray *instanceArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < [array count]; i ++){
        [instanceArray  addObject:[[self alloc] initWithDictionary:[array objectAtIndex:i]]];
    }
    return [NSArray arrayWithArray:instanceArray];
}

@end
