//
//  SaveGoodsCell.h
//  ClientMarket
//
//  Created by etlfab on 17/1/5.
//  Copyright © 2017年 etlfab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SaveGoodsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *selectIBtn;

@property (weak, nonatomic) IBOutlet UIImageView *leftImage;
@property (weak, nonatomic) IBOutlet UILabel *shopCenter;
@property (weak, nonatomic) IBOutlet UILabel *descriptLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIButton *otherSelectBtn;
@end
