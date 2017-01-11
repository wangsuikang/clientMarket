//
//  SaveGoodsViewController.m
//  ClientMarket
//
//  Created by etlfab on 17/1/5.
//  Copyright © 2017年 etlfab. All rights reserved.
//

#import "SaveGoodsViewController.h"
#import "SaveGoodsCell.h"
#import "SaveContentViewController.h"

@interface SaveGoodsViewController ()

@end

@implementation SaveGoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(allGoodBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self initMyIntsgraNavigation:@"收藏宝贝" button:button];
    [button setTitle:@"查询" forState:UIControlStateNormal];

    [self createTabView];
//    [self noSaveGoodview];
    // Do any additional setup after loading the view.
}

#pragma mark - 创建tabview
- (void)createTabView {
    
    _tabView = [[UITableView alloc]initWithFrame:CGRectMake(0, ZZBnavHeight, SCREEN_WIDTH,SCREEN_HEIGHT - ZZBnavHeight)];
    
    _tabView.delegate = self;
    _tabView.dataSource = self;
    [self.view addSubview:_tabView];
    
}

#pragma mark - 全部收藏
- (void)allGoodBtnClick {
  
    SaveContentViewController *svc = [[SaveContentViewController alloc]init];
    [self.navigationController pushViewController:svc animated:YES];
}

#pragma mark -tabView的delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 120;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}
//绘制Cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellId = @"SaveGoodsCell";
    SaveGoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"SaveGoodsCell" owner:self options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    //分享 加入购物车  取消收藏
    [cell.otherSelectBtn addTarget:self action:@selector(otherBtnClick) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}


- (void)otherBtnClick {
    
    UIView *statusOrderView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 60, SCREEN_WIDTH, 60)];
    statusOrderView.tag = 201;
    
    NSArray *titleArray = @[@"加入购物车",@"取消收藏",@"分享"];
    for (int i = 0; i < 3; i++) {
        UIButton *orderStatusButton = [UIButton buttonWithType:UIButtonTypeCustom];
        orderStatusButton.frame = CGRectMake(SCREEN_WIDTH/3 * i, 0, SCREEN_WIDTH/3, 60);
        orderStatusButton.tag = 101 + i;
        orderStatusButton.backgroundColor = [UIColor redColor];
        [orderStatusButton addTarget:self action:@selector(orderStatusBtn:) forControlEvents:UIControlEventTouchUpInside];
        [statusOrderView addSubview:orderStatusButton];
        
        //图片
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH/3-30)/2, 2, 30, 25)];
        imageView.image = [UIImage imageNamed:@"account_normal"];
        [orderStatusButton addSubview:imageView];
        
        //label
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame)+5, SCREEN_WIDTH/3, 20)];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = titleArray[i];
        [orderStatusButton addSubview:label];
    }
    
    [self.view addSubview:statusOrderView];
}

#pragma mark -无收藏商品的view
- (void)noSaveGoodview {

    [self.tabView removeFromSuperview];
    //图片
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - 80) / 2, 200, 80, 80)];
    imageView.image = [UIImage imageNamed:@"account_normal"];
    [self.view addSubview:imageView];

    //label
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - 80)/2, CGRectGetMaxY(imageView.frame)+5, 80, 20)];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.text = @"暂无收藏";
    [self.view addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - 150) / 2, CGRectGetMaxY(label1.frame)+5, 150, 20)];
    label2.textAlignment = NSTextAlignmentCenter;
    label2.text = @"快去首页逛逛吧";
    [self.view addSubview:label2];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake((SCREEN_WIDTH - SCREEN_WIDTH/4)/2, CGRectGetMaxY(label2.frame) + 30, SCREEN_WIDTH/4, 30);
    backButton.backgroundColor = [UIColor redColor];
    [backButton setTitle:@"返回首页" forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backToFirstPage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];

    
    
}

#pragma mark - 返回首页
- (void)backToFirstPage {

}

- (void)orderStatusBtn:(UIButton *)button {

    UIView *view = [self.view viewWithTag:201];
    [view removeFromSuperview];
    switch (button.tag) {
        case 101: {
        
        }
            break;
        case 102: {
            
        }
            break;
        case 103: {
            
        }
            break;
        default:
            break;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIView *view = [self.view viewWithTag:201];
    [view removeFromSuperview];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIView *view = [self.view viewWithTag:201];
    [view removeFromSuperview];
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
