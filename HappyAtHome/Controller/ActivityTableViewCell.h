//
//  ActivityTableViewCell.h
//  HappyAtHome
//
//  Created by 玉文辉 on 15/11/12.
//  Copyright © 2015年 yuwenhui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *TitleImageView;
@property (weak, nonatomic) IBOutlet UILabel *AddressLbl;
@property (weak, nonatomic) IBOutlet UILabel *EndTimeLbl;
@property (weak, nonatomic) IBOutlet UILabel *BookLbl;
@property (weak, nonatomic) IBOutlet UILabel *CountLbl;
@property (weak, nonatomic) IBOutlet UILabel *ActivityNameLbl;
@end
