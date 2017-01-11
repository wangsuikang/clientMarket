//
//  AddChargeAreaViewController.h
//  ClientMarket
//
//  Created by etlfab on 17/1/10.
//  Copyright © 2017年 etlfab. All rights reserved.
//

#import "SIBaseViewController.h"

@interface AddChargeAreaViewController : SIBaseViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tabView;
@property (nonatomic,copy)NSString *userMobile;
@property (nonatomic,copy)NSString *userName;
@end
