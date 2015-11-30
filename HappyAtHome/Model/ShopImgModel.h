//
//  ShopImgModel.h
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/28.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopImgModel : NSObject

@property (strong, nonatomic) UIImage *image;

- (id)initWithDictionary:(NSDictionary *)dict;

+ (NSArray *)instanceArrayDictFromArray:(NSArray *)array;

@end
