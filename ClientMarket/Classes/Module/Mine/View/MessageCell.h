
//
//  MessageCell.h
//  ClientMarket
//
//  Created by etlfab on 17/1/10.
//  Copyright © 2017年 etlfab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageDetailLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@end

