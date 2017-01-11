
//
//  SaveContentCell.m
//  ClientMarket
//
//  Created by etlfab on 17/1/5.
//  Copyright © 2017年 etlfab. All rights reserved.
//

#import "SaveContentCell.h"
#import "MacroDefinition.h"

@implementation SaveContentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.otherButton.frame = CGRectMake(SCREEN_WIDTH - 50, CGRectGetMaxY(self.frame) - 26, 30, 16);
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
