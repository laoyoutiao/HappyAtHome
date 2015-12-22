//
//  ScrollImageCube.h
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/17.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol scrollDelegate

@optional

- (void)clickAdvertisement:(NSInteger)index;

@end

@interface ScrollImageCube : UIView
- (id)initWithFrame:(CGRect)frame ImageArray:(NSArray *)array;
@property (weak, nonatomic) id<scrollDelegate> delegate;
@end
