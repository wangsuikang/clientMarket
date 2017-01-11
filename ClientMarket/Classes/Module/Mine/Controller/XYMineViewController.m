//
//  XYMineTableViewController.m
//  XianYu
//
//  Created by ZpyZp on 15/10/23.
//  Copyright © 2015年 berchina. All rights reserved.
//

#import "XYMineViewController.h"
#import "XYLoginViewController.h"
#import "XYNavigationController.h"
#import "MineCell.h"
#import "Util.h"
#import "SaveGoodsViewController.h"
#import "SaveContentViewController.h"
#import "DiscountCouponViewController.h"
#import "SettingViewController.h"


@interface XYMineViewController ()
@property (nonatomic,strong) NSArray *listArray;
@property (nonatomic,strong) NSArray *imageArray;
@end

@implementation XYMineViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    //    [self initNavigation:@"我的"];
    
    [self createTabView];
}

#pragma mark - 创建tabview
- (void)createTabView {
    
    _tabView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,SCREEN_HEIGHT - 20)];
    
    _tabView.delegate = self;
    _tabView.dataSource = self;
    _tabView.tableHeaderView = [self createHeadView];
    [self.view addSubview:_tabView];
    
}

#pragma mark - createHeadView
- (UIView *)createHeadView {
    
    UIView *headView  = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 500)];
    headView.backgroundColor = [Util stringTOColor:@"#ebebeb"];
    
    UIView *headView1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, [self getSize:252/2])];
    headView1.backgroundColor = [UIColor redColor];
    
    NSArray *buttonTitleArray = @[@"注册",@"登录"];
    for (int i = 0; i < 2 ; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:buttonTitleArray[i] forState:UIControlStateNormal];
        button.frame = CGRectMake((SCREEN_WIDTH - 100) / 2 + 50 * i,([self getSize:252/2] - 30) / 2, 50, 30);
        button.tag = 101 + i;
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [headView1 addSubview:button];
    }
    
    //我的订单
    UIView *orderView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(headView1.frame), SCREEN_WIDTH, 40)];
    UILabel *orderLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 100, 40)];
    orderLabel.text = @"我的订单";
    
    
    //查看全部订单
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [searchBtn setTitle:@"查看全部订单" forState:UIControlStateNormal];
    searchBtn.frame = CGRectMake(SCREEN_WIDTH - 100, 10, 80, 20);
    searchBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [searchBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [searchBtn addTarget:searchBtn action:@selector(searchOrderBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    orderView.backgroundColor = [UIColor yellowColor];
    
    UIView *statusView = [self orderStatusViewY:CGRectGetMaxY(orderView.frame) + 10];
    UIView *menuView = [self createListMenuY:CGRectGetMaxY(statusView.frame) + 10];
    
    [orderView addSubview:orderLabel];
    [orderView addSubview:searchBtn];
    [headView addSubview:orderView];
    [headView addSubview:headView1];
    [headView addSubview:statusView];
    [headView addSubview:menuView];
    
    return headView;
}

#pragma mark - 订单状态的view
- (UIView *)orderStatusViewY:(CGFloat)Y {
    
    UIView *statusOrderView = [[UIView alloc]initWithFrame:CGRectMake(0, Y, SCREEN_WIDTH, [self getSize:98/2])];
    
    NSArray *titleArray = @[@"待付款",@"待发货",@"待收货",@"退款/售后"];
    for (int i = 0; i < 4; i++) {
        UIButton *orderStatusButton = [UIButton buttonWithType:UIButtonTypeCustom];
        orderStatusButton.frame = CGRectMake(SCREEN_WIDTH/4 * i, 0, SCREEN_WIDTH/4, [self getSize:98/2]);
        orderStatusButton.backgroundColor = [UIColor redColor];
        [orderStatusButton addTarget:self action:@selector(orderStatusBtn:) forControlEvents:UIControlEventTouchUpInside];
        [statusOrderView addSubview:orderStatusButton];
        
        //图片
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH/4-30)/2, 2, 30, 30)];
        imageView.image = [UIImage imageNamed:@"account_normal"];
        [orderStatusButton addSubview:imageView];
        
        //label
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame)+5, SCREEN_WIDTH/4, 20)];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = titleArray[i];
        [orderStatusButton addSubview:label];
    }
    return statusOrderView;
}

- (UIView *)createListMenuY:(CGFloat)Y {
    UIView *menuView = [[UIView alloc]initWithFrame:CGRectMake(0, Y, SCREEN_WIDTH, [self getSize:300/2])];
    
    NSArray *titleArray = @[@"收藏宝贝",@"收藏内容",@"我的关注",@"优惠券",@"客服",@"卖家",@"设计师",@"分享"];
    for (int i = 0; i < 8; i++) {
        UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        menuButton.frame = CGRectMake(SCREEN_WIDTH/4 * (i % 4), 0 + i/4 * [self getSize:150/2], SCREEN_WIDTH/4, [self getSize:150/2]);
        menuButton.tag = 201+i;
        menuButton.backgroundColor = [UIColor redColor];
        [menuButton addTarget:self action:@selector(listMenuBtn:) forControlEvents:UIControlEventTouchUpInside];
        [menuView addSubview:menuButton];
        
        //图片
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, SCREEN_WIDTH/4 - 20, 50)];
        imageView.image = [UIImage imageNamed:@"post_normal"];
        [menuButton addSubview:imageView];
        
        //label
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame)+5, SCREEN_WIDTH/4, 30)];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = titleArray[i];
        [menuButton addSubview:label];
        
        
    }
    
    for (int i = 0; i < 3; i++) {
        UILabel *lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/4 + SCREEN_WIDTH/4 * i, 0, 0.5, [self getSize:300/2])];
        lineLabel.backgroundColor = [UIColor lightGrayColor];
        [menuView addSubview:lineLabel];
    }
    
    UILabel *lineLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(10, [self getSize:300/2]/2, SCREEN_WIDTH, 0.5)];
    lineLabel2.backgroundColor = [UIColor lightGrayColor];
    [menuView addSubview:lineLabel2];
    
    return menuView;
    
}

- (void)orderStatusBtn:(UIButton *)button {
    
}

#pragma mark -listMenu的点击事件
- (void)listMenuBtn:(UIButton *)button {

    switch (button.tag) {
        case 201: {//收藏
            SaveGoodsViewController *svc = [[SaveGoodsViewController alloc]init];
            [self.navigationController pushViewController:svc animated:YES];
        }
            break;
        case 202: {//收藏宝贝
            SaveContentViewController *svc = [[SaveContentViewController alloc]init];
            [self.navigationController pushViewController:svc animated:YES];
        }
            break;
        case 204: {//收藏宝贝
            DiscountCouponViewController *dvc = [[DiscountCouponViewController alloc]init];
            [self.navigationController pushViewController:dvc animated:YES];
        }
            break;
        default:
            break;
    }
}
#pragma mark - 查询全部订单
- (void)searchOrderBtnClick:(UIButton *)button {
    
}

- (void)btnClick:(UIButton *)button {
    
    switch (button.tag) {
        case 101: {
            [SVProgressHUD showSuccessWithStatus:@"注册"];
        }
            break;
        case 102: {
            [SVProgressHUD showSuccessWithStatus:@"登录"];
            
        }
            break;
        default:
            break;
    }
}

#pragma mark -tabView的delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1.5;
}
//绘制Cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *array = @[@"我的资产",@"设置"];
    static NSString *cellId = @"MineCell";
    MineCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MineCell" owner:self options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.menuLabel.text = array[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0: {
        
        }
            break;
        case 1: {
            SettingViewController *svc = [[SettingViewController alloc]init];
            [self.navigationController pushViewController:svc animated:YES];
        }
            break;
        default:
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

