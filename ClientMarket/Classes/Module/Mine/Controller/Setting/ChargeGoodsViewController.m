//
//  ChargeGoodsViewController.m
//  ClientMarket
//
//  Created by etlfab on 17/1/10.
//  Copyright © 2017年 etlfab. All rights reserved.
//

#import "ChargeGoodsViewController.h"
#import "ChargeGoodsDesCell.h"
#import "Util.h"
#import "AddChargeAreaViewController.h"

@interface ChargeGoodsViewController ()

@end

@implementation ChargeGoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigation:@"收货地址"];
    [self createTabView];
    // Do any additional setup after loading the view.
}

#pragma mark - 创建tabview
- (void)createTabView {
    
    _tabView = [[UITableView alloc]initWithFrame:CGRectMake(0, ZZBnavHeight, SCREEN_WIDTH,SCREEN_HEIGHT - ZZBnavHeight - 49)];
    
    _tabView.delegate = self;
    _tabView.dataSource = self;
    [self.view addSubview:_tabView];
    
    //增加选择收货地址按钮
    UIView *addChargeAreaView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49)];
    addChargeAreaView.backgroundColor = [Util stringTOColor:@"#ffffff"];
    [self.view addSubview:addChargeAreaView];
    
    UIButton *chargeAreaButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [chargeAreaButton setTitle:@"新建地址" forState:UIControlStateNormal];
    chargeAreaButton.frame = CGRectMake((SCREEN_WIDTH - 100) / 2, 10, 100, 30);
    [chargeAreaButton addTarget:self action:@selector(addChargeAreaBtn) forControlEvents:UIControlEventTouchUpInside];
    chargeAreaButton.backgroundColor = [Util stringTOColor:@"#c971a1"];
    chargeAreaButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [addChargeAreaView addSubview:chargeAreaButton];

}

- (void)addChargeAreaBtn {
    AddChargeAreaViewController *avc = [[AddChargeAreaViewController alloc]init];
    [self.navigationController pushViewController:avc animated:YES];
}

#pragma mark -tabView的delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 80;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1.5;
}

//绘制Cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellId = @"ChargeGoodsDesCell";
    
    ChargeGoodsDesCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"ChargeGoodsDesCell" owner:self options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        self.tabView.separatorStyle = NO;
        cell.areaLabel.numberOfLines = 0;
        
    }
    
    return cell;
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
