//
//  ScrollImageItem.h
//  lottery
//
//  Created by 菜鸟案 on 15/6/30.
//  Copyright (c) 2015年 lzh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScrollImageItem : NSObject
@property (nonatomic, copy)  NSString     *title;
@property (nonatomic, copy)  NSString      *image;
@property (nonatomic, assign)  NSInteger     tag;

- (id)initWithTitle:(NSString *)title image:(NSString *)image tag:(NSInteger)tag;
- (id)initWithDict:(NSDictionary *)dict tag:(NSInteger)tag;

@end
