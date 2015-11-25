//
//  ScrollImageItem.m
//  菜鸟团
//
//  Created by 菜鸟案 on 15/7/22.
//  Copyright (c) 2015年 lzh. All rights reserved.
//

#import "ScrollImageItem.h"

@implementation ScrollImageItem
//- (id)initWithTitle:(NSString *)title image:(NSString *)image tag:(NSInteger)tag
//{
//    self = [super init];
//    if (self) {
//        self.title = title;
//        self.image = image;
//        self.tag = tag;
//    }
//    
//    return self;
//}

- (id)initWithTitle:(NSString *)title image:(UIImage *)image tag:(NSInteger)tag
{
    self = [super init];
    if (self) {
        self.title = title;
        self.image = image;
        self.tag = tag;
    }
    
    return self;
}

- (id)initWithDict:(NSDictionary *)dict tag:(NSInteger)tag
{
    self = [super init];
    if (self)
    {
        if ([dict isKindOfClass:[NSDictionary class]])
        {
            self.title = [dict objectForKey:@"title"];
            //...
        }
    }
    return self;
}

@end
