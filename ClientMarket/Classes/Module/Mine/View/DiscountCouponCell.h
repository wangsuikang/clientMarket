//
//  DiscountCouponCell.h
//  ClientMarket
//
//  Created by etlfab on 17/1/8.
//  Copyright © 2017年 etlfab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiscountCouponCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *backImage;
@property (weak, nonatomic) IBOutlet UILabel *areaLabel;
@property (weak, nonatomic) IBOutlet UILabel *discouponCard;
@property (weak, nonatomic) IBOutlet UILabel *discoundCondition;
@property (weak, nonatomic) IBOutlet UILabel *validTime;

@end
