//
//  ServicePayViewController.h
//  HappyAtHome
//
//  Created by 玉文辉 on 15/12/9.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ServicePayViewController : UIViewController

- (void)getMessageServiceHint:(NSString *)servicehint StartTime:(NSString *)starttime Address:(NSString *)address Money:(CGFloat)money Ticket:(NSInteger)ticket;

@end
