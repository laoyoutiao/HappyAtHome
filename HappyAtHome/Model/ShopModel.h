//
//  ShopImgModel.h
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/28.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopModel : NSObject

@property (strong, nonatomic) NSString *image;
@property (strong, nonatomic) NSString *childname;
@property (strong, nonatomic) NSString *collectid;
@property (strong, nonatomic) NSString *goodsid;
@property (strong, nonatomic) NSString *goodsname;
@property (strong, nonatomic) NSString *parentname;
@property (strong, nonatomic) NSString *shopaddress;

@property (assign, nonatomic) NSInteger discount;
@property (assign, nonatomic) NSInteger salesvolume;
@property (assign, nonatomic) CGFloat   price;

- (id)initWithDictionary:(NSDictionary *)dict;

+ (NSArray *)instanceArrayDictFromArray:(NSArray *)array;

@end
