
//
//  UIButton+WSKCustomButton.m
//  ClientMarket
//
//  Created by 王岁康 on 2017/1/11.
//  Copyright © 2017年 etlfab. All rights reserved.
//

#import "UIButton+WSKCustomButton.h"

@implementation UIButton (WSKCustomButton)
- (void)setborderColor:(UIColor *)color :(CGFloat)borderWidth :(CGFloat)radius {
    self.layer.masksToBounds = YES;
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = borderWidth;
    self.layer.cornerRadius = radius;

}
@end
