//
//  SaveContentViewController.m
//  ClientMarket
//
//  Created by etlfab on 17/1/5.
//  Copyright © 2017年 etlfab. All rights reserved.
//

#import "SaveContentViewController.h"
#import "SaveContentCell.h"
#import "DeleateCell.h"
@interface SaveContentViewController ()

@end

@implementation SaveContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(allGoodBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self initMyIntsgraNavigation:@"收藏宝贝" button:button];
    [button setTitle:@"编辑" forState:UIControlStateNormal];
    _isEdit = NO;
    [self createTabView];
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
    
    if (_isEdit == NO) {
        _isEdit = YES;
    } else {
        _isEdit = NO;
    }
    [self.tabView reloadData];
}

#pragma mark -tabView的delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}
//绘制Cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell;
    if (_isEdit == YES) {
        static NSString *cellId = @"DeleateCell";
        DeleateCell *deleteCell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (!deleteCell) {
            deleteCell = [[[NSBundle mainBundle]loadNibNamed:@"DeleateCell" owner:self options:nil]lastObject];
            deleteCell.selectionStyle = UITableViewCellSelectionStyleNone;
            deleteCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        cell = deleteCell;

    } else {
        static NSString *cellId = @"SaveContentCell";
        
       SaveContentCell *saveCell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (!saveCell) {
            saveCell = [[[NSBundle mainBundle]loadNibNamed:@"SaveContentCell" owner:self options:nil]lastObject];
            saveCell.selectionStyle = UITableViewCellSelectionStyleNone;
            saveCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        cell = saveCell;
        //分享 加入购物车  取消收藏
        [saveCell.otherButton addTarget:self action:@selector(otherBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return cell;
}

//-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
//}
//
//-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    return UITableViewCellEditingStyleDelete;//手势滑动删除
//    
//}
- (void)otherBtnClick {
    UIView *statusOrderView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 60, SCREEN_WIDTH, 60)];
    statusOrderView.tag = 201;
    
    NSArray *titleArray = @[@"取消收藏",@"分享"];
    for (int i = 0; i < 2; i++) {
        UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        shareButton.frame = CGRectMake(SCREEN_WIDTH/2 * i, 0, SCREEN_WIDTH/2, 60);
        shareButton.tag = 101 + i;
        shareButton.backgroundColor = [UIColor redColor];
        [shareButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [statusOrderView addSubview:shareButton];
        
        //图片
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH/2-30)/2, 2, 30, 25)];
        imageView.image = [UIImage imageNamed:@"account_normal"];
        [shareButton addSubview:imageView];
        
        //label
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame)+5, SCREEN_WIDTH/2, 20)];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = titleArray[i];
        [shareButton addSubview:label];
    }
    
    [self.view addSubview:statusOrderView];

}

- (void)buttonClick:(UIButton *)button {

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
