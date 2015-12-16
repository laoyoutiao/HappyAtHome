//
//  IntegrationViewController.h
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/11.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PersonUserInfoDelegate

@optional

- (void)reloadUserInfo;

@end

@interface PersonIntegrationViewController : UIViewController

@property (strong, nonatomic) id<PersonUserInfoDelegate> delegate;

@end
