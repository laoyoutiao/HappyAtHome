//
//  ScrollImageCube.m
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/17.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import "ScrollImageCube.h"
#import "ModelHeader.h"
#import "UIImageView+WebCache.h"
#import "ServerHeader.h"

@interface ScrollImageCube ()<UIGestureRecognizerDelegate,UIScrollViewDelegate>
{
    UIImageView *imageview;
    NSArray *imageArray;
    NSInteger index;
    CGFloat clickx;
    UIScrollView *scrollview;
}
@end

@implementation ScrollImageCube

- (id)initWithFrame:(CGRect)frame ImageArray:(NSArray *)array
{
    self = [super initWithFrame:frame];
    if (self) {
        imageArray = array;
        [self SetCube];
        [self SetLine];
    }
    return self;
}

- (void)SetCube
{
    imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - 5)];
    [self addSubview:imageview];
    ShopModel *model = [imageArray objectAtIndex:0];
    [imageview sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ServerImgURL,model.image]]];
    index = 0;
    
    scrollview = [[UIScrollView alloc] initWithFrame:self.frame];
    [self addSubview:scrollview];
    scrollview.contentSize = CGSizeMake(360, 0);
    scrollview.bounces = NO;
    scrollview.showsHorizontalScrollIndicator = NO;
    scrollview.delegate = self;
    
    UITapGestureRecognizer *tapGestureRecognize = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureRecognizer:)];
    tapGestureRecognize.delegate = self;
    tapGestureRecognize.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tapGestureRecognize];
    
    if ([imageArray count] > 1) {
        [self performSelector:@selector(movenext) withObject:nil afterDelay:4.0];
    }
}

- (void)SetLine
{
    for (int i = 0; i < [imageArray count]; i ++)
    {
        UIView *lineview = [[UIView alloc] initWithFrame:CGRectMake(0 + i * ((self.frame.size.width - ([imageArray count] - 1) * 3) / [imageArray count] + 3), imageview.frame.size.height, (self.frame.size.width - ([imageArray count] - 1) * 3) / [imageArray count], 5)];
        lineview.backgroundColor = [UIColor grayColor];
        lineview.tag = i + 100;
        if (i == 0) {
            lineview.backgroundColor = [UIColor redColor];
        }
        [self addSubview:lineview];
    }
}

- (void)singleTapGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
{
    [_delegate clickAdvertisement:index];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    float x = scrollview.contentOffset.x;
    CATransition *ca = [CATransition animation];
    ca.type = @"cube";
    if (x < 40)
    {
        index --;
        if (index < 0) {
            index = [imageArray count] - 1;
        }
        [self changelinecolor:index];
        ShopModel *model = [imageArray objectAtIndex:index];
        [imageview sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ServerImgURL,model.image]]];
        ca.subtype = kCATransitionFromLeft;
    }else
    {
        index ++;
        if (index == [imageArray count]) {
            index = 0;
        }
        [self changelinecolor:index];
        ShopModel *model = [imageArray objectAtIndex:index];
        [imageview sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ServerImgURL,model.image]]];
        ca.subtype = kCATransitionFromRight;
    }
    ca.duration = 1.5;
    [imageview.layer addAnimation:ca forKey:nil];
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(movenext) object:nil];
    
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self performSelector:@selector(movenext) withObject:nil afterDelay:4.0];
    });

}

- (void)movenext
{
    index ++;
    if (index == [imageArray count]) {
        index = 0;
    }
    [self changelinecolor:index];
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(movenext) object:nil];
    ShopModel *model = [imageArray objectAtIndex:index];
    [imageview sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ServerImgURL,model.image]]];
    CATransition *ca = [CATransition animation];
    ca.type = @"cube";
    ca.subtype = kCATransitionFromRight;
    ca.duration = 1.0;
    [imageview.layer addAnimation:ca forKey:nil];
    [self performSelector:@selector(movenext) withObject:nil afterDelay:4.0];
}

- (void)changelinecolor:(NSInteger)tag
{
    UIView *view = [self viewWithTag:tag + 100];
    view.backgroundColor = [UIColor redColor];
    for (NSInteger i = 0; i < [imageArray count]; i ++) {
        if (i != tag) {
            UIView *view = [self viewWithTag:i + 100];
            view.backgroundColor = [UIColor grayColor];
        }
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
