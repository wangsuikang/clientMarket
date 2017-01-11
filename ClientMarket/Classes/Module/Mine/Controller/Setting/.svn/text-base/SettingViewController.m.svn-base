//
//  SettingViewController.m
//  ClientMarket
//
//  Created by etlfab on 17/1/8.
//  Copyright © 2017年 etlfab. All rights reserved.
//

#import "SettingViewController.h"
#import "DiscountCouponCell.h"
#import "Util.h"
#import "MyselfViewController.h"
#import "MessageViewController.h"
@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigation:@"设置"];
    [self createTabView];
    [self loginOutButton];
    
    // Do any additional setup after loading the view.
}

#pragma mark - 创建tabview
- (void)createTabView {
    
    _tabView = [[UITableView alloc]initWithFrame:CGRectMake(0, ZZBnavHeight, SCREEN_WIDTH,SCREEN_HEIGHT - ZZBnavHeight - 120)];
    
    _tabView.delegate = self;
    _tabView.dataSource = self;
    [self.view addSubview:_tabView];
    
}

#pragma mark - 退出按钮
- (void)loginOutButton {
   
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20, SCREEN_HEIGHT - 80, SCREEN_WIDTH - 40, 40);
    [button addTarget:self action:@selector(loginOutClick) forControlEvents:UIControlEventTouchUpInside];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 5;
    [button setBackgroundColor:[Util stringTOColor:@"#C971A1"]];
    [button setTitle:@"退出当前账户" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
}

- (void)loginOutClick {
    NSLog(@"退出登录");
}

#pragma mark -tabView的delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return 3;
    } else {
    
        return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 10;
}
//绘制Cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellId = @"DiscountCouponCell";
    
    NSArray *array = @[@"个人资料",@"账户与安全",@"消息"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc]init];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.tabView.separatorStyle = NO;
    }
    
    if (indexPath.section == 0) {
        cell.textLabel.text = array[indexPath.row];
    } else {
        cell.textLabel.text = @"关于";
    }
    
    //分割线
    UIView *lineView = [self addLine:CGRectMake(0, 49, SCREEN_WIDTH, 0.5)];
    [cell.contentView addSubview:lineView];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        
        switch (indexPath.row) {
            case 0: {
                MyselfViewController *mvc = [[MyselfViewController alloc]init];
                [self.navigationController pushViewController:mvc animated:YES];
            }
                break;
            case 2: {
                MessageViewController *mvc = [[MessageViewController alloc]init];
                [self.navigationController pushViewController:mvc animated:YES];
            }
                break;
            default:
                break;
        }
    } else {
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
