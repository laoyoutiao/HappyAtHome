//
//  ServiceModel.h
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/25.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSDictionary+Safe.h"

@interface ServiceModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger ticket;
@property (nonatomic, assign) CGFloat money;
@property (nonatomic, strong) NSString *introduce;
@property (nonatomic, strong) NSString *hint;
@property (nonatomic, strong) NSString *image;

- (id)initWithDictionary:(NSDictionary *)dict;

+ (NSDictionary *)instanceArrayDictFromArray:(NSArray *)array;

@end
