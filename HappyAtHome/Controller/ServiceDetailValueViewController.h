//
//  ServiceDetailValueViewController.h
//  HappyAtHome
//
//  Created by 玉文辉 on 15/12/4.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, viewType) {
    addressviewType = 0,
    introduceviewType = 1,
};

@protocol AddressDelegate

@optional

- (void)getAddressName:(NSString *)addressname;

@end

@interface ServiceDetailValueViewController : UIViewController

@property (assign, nonatomic) id<AddressDelegate> delegate;

- (void)viewType:(viewType)type;
- (void)setIntroducestring:(NSString *)introducestring;

@end
