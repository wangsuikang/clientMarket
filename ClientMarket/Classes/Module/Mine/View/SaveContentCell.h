//
//  SaveContentCell.h
//  ClientMarket
//
//  Created by etlfab on 17/1/5.
//  Copyright © 2017年 etlfab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SaveContentCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *otherButton;
@property (weak, nonatomic) IBOutlet UILabel *GoodsTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *goodsDetailLabel;

@property (weak, nonatomic) IBOutlet UIImageView *leftImage;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@end
