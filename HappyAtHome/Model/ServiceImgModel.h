//
//  ServiceImgModel.h
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/24.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServiceModel.h"

@interface ServiceImgModel : NSObject

//long serverimg_id;	//广告图片id
//long service_id;	//服务id
//String image;		//广告图片地址

@property (nonatomic, assign) NSInteger serverImgId;
@property (nonatomic, assign) NSInteger serviceId;
@property (nonatomic, assign) NSInteger ticket;
@property (nonatomic, strong) NSString  *image;
@property (nonatomic, strong) NSString  *name;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) CGFloat money;
@property (nonatomic, strong) NSString *introduce;
@property (nonatomic, strong) NSString *hint;

- (id)initWithDictionary:(NSDictionary *)dict;

+ (NSArray *)instanceArrayDictFromDict:(NSArray *)array;

+ (ServiceModel *)changeServiceModel:(ServiceImgModel *)serviceimgmodel;

@end
