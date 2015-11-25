//
//  ServerActivity.h
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/24.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServerHeader.h"

typedef void (^activityBlcok) (NSArray *activityarray);

@interface ServerActivity : NSObject

+ (void)activityPostUserId:(NSString *)userid Starttime:(NSDate *)starttime Orderby:(NSString *)orderby Block:(activityBlcok)block;

@end
