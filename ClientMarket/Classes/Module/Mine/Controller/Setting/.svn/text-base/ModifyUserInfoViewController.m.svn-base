//
//  ModifyUserInfoViewController.m
//  ClientMarket
//
//  Created by etlfab on 17/1/9.
//  Copyright © 2017年 etlfab. All rights reserved.
//

#import "ModifyUserInfoViewController.h"
#import "Util.h"
#import "ModifyUserInfoCell.h"
@interface ModifyUserInfoViewController ()

@end

@implementation ModifyUserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.passWordArray = [[NSMutableArray alloc]initWithObjects:@"请输入手机号",@"请输入验证码", nil];
    self.mobileArray = [[NSMutableArray alloc]initWithObjects:@"请输入手机号",@"请输入验证码", nil];
    NSString *modifyStr;
    if ([self.modifyType isEqualToString:@"userName"]) {
        modifyStr = @"修改用户名";
        [self modifyUserName];
    } else if([self.modifyType isEqualToString:@"userMobile"]){
        modifyStr = @"修改手机号";
        [self modifyMobileAndPwd];
    } else if([self.modifyType isEqualToString:@"passWord"]) {
        modifyStr = @"修改密码";
        [self modifyMobileAndPwd];
    }
    [self initNavigation:modifyStr];
    // Do any additional setup after loading the view.
}

#pragma mark - 修改用户名
- (void)modifyUserName {

    UITextField *pressTextField = [[UITextField alloc]initWithFrame:CGRectMake(20, ZZBnavHeight + 10, SCREEN_WIDTH - 40, 40)];
    pressTextField.placeholder = @"请输入用户名";
    pressTextField.backgroundColor = [Util stringTOColor:@"#f9f9f9"];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, CGRectGetMaxY(pressTextField.frame) + 150, SCREEN_WIDTH - 20, 40);
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 3;
    [button setTitle:@"确认" forState:UIControlStateNormal];
    [button setBackgroundColor:[Util stringTOColor:@"#C971A1"]];
    
    [self.view addSubview:pressTextField];
    [self.view addSubview:button];
}

#pragma  mark - modify 手机号和密码
- (void)modifyMobileAndPwd {
    [self createTabView];
}

#pragma mark - 新增收货地址
- (void)addChargeArea {

}

#pragma mark - 创建tabview
- (void)createTabView {
    
    _tabView = [[UITableView alloc]initWithFrame:CGRectMake(0, ZZBnavHeight - 20, SCREEN_WIDTH,SCREEN_HEIGHT - ZZBnavHeight - 300)];
    _tabView.delegate = self;
    _tabView.dataSource = self;
    [self.view addSubview:_tabView];
    
    //确认信息按钮
    [self sureInfoButton];
}

#pragma mark - 确认信息按钮
- (void)sureInfoButton {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20, SCREEN_HEIGHT - 350, SCREEN_WIDTH - 40, 40);
    [button addTarget:self action:@selector(sureInfoBtnClick) forControlEvents:UIControlEventTouchUpInside];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 5;
    [button setBackgroundColor:[Util stringTOColor:@"#C971A1"]];
    [button setTitle:@"确认" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
}

- (void)sureInfoBtnClick {

}

#pragma mark -tabView的delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   
    if (section ==0) {
        return 2;
    } else {
        return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if ([self.modifyType isEqualToString:@"userMobile"]) {
        
        return 1;
    } else {
        return 2;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1.5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 10;
    } else {
        return 30;
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if (section == 1) {
        return @"设置密码";
    } else {
        return @"";
    }
}
//绘制Cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellId = @"ModifyUserInfoCell";
    ModifyUserInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"ModifyUserInfoCell" owner:self options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    if (indexPath.section == 0) {
        cell.pressTextField.placeholder = self.passWordArray[indexPath.row];
        
        if (indexPath.row == 0) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:@"获取验证码" forState:UIControlStateNormal];
            button.frame = CGRectMake(SCREEN_WIDTH - 100, 10, 80, 30);
            button.layer.masksToBounds = YES;
            [button addTarget:self action:@selector(qrcodeBtnClick) forControlEvents:UIControlEventTouchUpInside];
            button.layer.cornerRadius = 15;
            button.layer.borderColor = [[Util stringTOColor:@"#C971A1"]CGColor];
            button.layer.borderWidth = 0.7;
            button.titleLabel.font = [UIFont systemFontOfSize:13];
            [button setTitleColor:[Util stringTOColor:@"#C971A1"] forState:UIControlStateNormal];
            [cell.contentView addSubview:button];
        }
    } else {
        cell.pressTextField.placeholder = @"6-12位，非纯数字，不含空格";
    }
    return cell;
}

- (void)qrcodeBtnClick {

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
