//
//  ServiceImgModel.h
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/24.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ServiceImgModel : NSObject

//long serverimg_id;	//广告图片id
//long service_id;	//服务id
//String image;		//广告图片地址
//String lable;		//分类标签(0表示普通,1表示本周推荐)

@property (nonatomic, assign) NSInteger serverImgId;
@property (nonatomic, assign) NSInteger serviceId;
@property (nonatomic, assign) NSString  *image;
@property (nonatomic, assign) NSString  *lable;

- (id)initWithDictionary:(NSDictionary *)dict;

+ (NSArray *)instanceArrayDictFromDict:(NSArray *)array;

@end
