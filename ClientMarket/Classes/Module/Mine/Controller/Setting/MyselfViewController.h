//
//  MyselfViewController.h
//  ClientMarket
//
//  Created by etlfab on 17/1/8.
//  Copyright © 2017年 etlfab. All rights reserved.
//

#import "SIBaseViewController.h"

@interface MyselfViewController : SIBaseViewController<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate> {

}
@property (nonatomic,retain)UITableView *tabView;
@property (nonatomic,strong) NSNumber *markNumber;//markNumber : 0 表示是点击照相机触发的事件；  1表示是点击头视图触发的事件  2 表示是头像的更换
@end
