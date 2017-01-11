//
//  SettingViewController.h
//  ClientMarket
//
//  Created by etlfab on 17/1/8.
//  Copyright © 2017年 etlfab. All rights reserved.
//

#import "SIBaseViewController.h"

@interface SettingViewController : SIBaseViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,retain)UITableView *tabView;
@end
