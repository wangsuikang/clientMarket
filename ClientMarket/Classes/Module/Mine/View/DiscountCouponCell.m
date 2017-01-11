//
//  DiscountCouponCell.m
//  ClientMarket
//
//  Created by etlfab on 17/1/8.
//  Copyright © 2017年 etlfab. All rights reserved.
//

#import "DiscountCouponCell.h"
#import "MacroDefinition.h"

@implementation DiscountCouponCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backImage.backgroundColor = [UIColor lightGrayColor];
    self.backImage.frame = CGRectMake(10, 5, SCREEN_WIDTH - 20, 100);
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
