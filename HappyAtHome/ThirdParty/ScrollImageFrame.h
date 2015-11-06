//
//  ScrollImageFrame.h
//  lottery
//
//  Created by 菜鸟案 on 15/6/30.
//  Copyright (c) 2015年 lzh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ScrollImageItem;
@class ScrollImageFrame;
#pragma mark - ScrollImageFrameDelegate
@protocol ScrollImageFrameDelegate <NSObject>
@optional
- (void)foucusImageFrame:(ScrollImageFrame *)imageFrame didSelectItem:(ScrollImageItem *)item;
- (void)foucusImageFrame:(ScrollImageFrame *)imageFrame currentItem:(int)index;

@end
@interface ScrollImageFrame : UIView<UIGestureRecognizerDelegate, UIScrollViewDelegate>
{
    BOOL _isAutoPlay;
}
- (id)initWithFrame:(CGRect)frame delegate:(id<ScrollImageFrameDelegate>)delegate imageItems:(NSArray *)items isAuto:(BOOL)isAuto;

- (id)initWithFrame:(CGRect)frame delegate:(id<ScrollImageFrameDelegate>)delegate focusImageItems:(ScrollImageItem *)items, ... NS_REQUIRES_NIL_TERMINATION;
- (id)initWithFrame:(CGRect)frame delegate:(id<ScrollImageFrameDelegate>)delegate imageItems:(NSArray *)items;
- (void)scrollToIndex:(int)aIndex;

@property (nonatomic, assign) id<ScrollImageFrameDelegate> delegate;


@end
