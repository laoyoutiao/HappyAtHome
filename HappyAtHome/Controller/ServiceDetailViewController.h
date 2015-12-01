//
//  ServiceDetailViewController.h
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/30.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelHeader.h"
#import "ServerHeader.h"

@interface ServiceDetailViewController : UIViewController
{
    ServiceModel *servicemodel;
}

- (void)getServiceModel:(ServiceModel *)model;

@end
