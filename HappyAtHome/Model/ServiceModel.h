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

@property (nonatomic, assign) NSInteger serverImgId;
@property (nonatomic, assign) NSInteger serviceId;
@property (nonatomic, assign) NSString  *image;

- (id)initWithDictionary:(NSDictionary *)dict;

+ (NSDictionary *)instanceArrayDictFromDict:(NSArray *)array;

@end
