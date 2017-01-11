
//
//  AddChargeAreaViewController.m
//  ClientMarket
//
//  Created by etlfab on 17/1/10.
//  Copyright © 2017年 etlfab. All rights reserved.
//

#import "AddChargeAreaViewController.h"
#import "ChargeAreaCell.h"
#import "Util.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@interface AddChargeAreaViewController ()<ABPeoplePickerNavigationControllerDelegate>

@end

@implementation AddChargeAreaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigation:@"编辑收货地址"];
    [self createTabView];
    // Do any additional setup after loading the view.
}

#pragma mark - 创建tabview
- (void)createTabView {
    
    _tabView = [[UITableView alloc]initWithFrame:CGRectMake(0, ZZBnavHeight, SCREEN_WIDTH,SCREEN_HEIGHT - ZZBnavHeight - 330)];
    _tabView.delegate = self;
    _tabView.dataSource = self;
    [self.view addSubview:_tabView];
    
    //增加选择收货人的按钮
    UIButton *orderStatusButton = [UIButton buttonWithType:UIButtonTypeCustom];
    orderStatusButton.frame = CGRectMake(SCREEN_WIDTH - 99, -1, 100, 101);
    [orderStatusButton addTarget:self action:@selector(addChargePersonBtn) forControlEvents:UIControlEventTouchUpInside];
    orderStatusButton.alpha = 1;
    orderStatusButton.layer.borderWidth = 1;
    orderStatusButton.backgroundColor = [UIColor whiteColor];
    orderStatusButton.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    [self.tabView addSubview:orderStatusButton];
    
    //图片
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((100 - 30) / 2, (100 - 50) / 2, 30, 30)];
    imageView.image = [UIImage imageNamed:@"account_normal"];
    [orderStatusButton addSubview:imageView];
    
    //label
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame)+5, SCREEN_WIDTH/4, 20)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"选择联系人";
    label.font = [UIFont systemFontOfSize:13];
    [orderStatusButton addSubview:label];

    
    [self sureInfoButton];
}

- (void)addChargePersonBtn {
    ABPeoplePickerNavigationController * vc = [[ABPeoplePickerNavigationController alloc] init];
    
    vc.peoplePickerDelegate = self;
    
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark -- ABPeoplePickerNavigationControllerDelegate

- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController*)peoplePicker didSelectPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier {
    
    
    
    ABMultiValueRef valuesRef = ABRecordCopyValue(person, kABPersonPhoneProperty);
    
    CFIndex index = ABMultiValueGetIndexForIdentifier(valuesRef,identifier);
    
    //电话号码
    
    CFStringRef telValue = ABMultiValueCopyValueAtIndex(valuesRef,index);
    
    
    
    //读取firstname
    
    //获取个人名字（可以通过以下两个方法获取名字，第一种是姓、名；第二种是通过全名）。
    
    //第一中方法
    
    //    CFTypeRef firstName = ABRecordCopyValue(person, kABPersonFirstNameProperty);
    
    //    CFTypeRef lastName = ABRecordCopyValue(person, kABPersonLastNameProperty);
    
    //    //姓
    
    //    NSString * nameString = (__bridge NSString *)firstName;
    
    //    //名
    
    //    NSString * lastString = (__bridge NSString *)lastName;
    
    //第二种方法：全名
    
    CFStringRef anFullName = ABRecordCopyCompositeName(person);
    
    
    [self dismissViewControllerAnimated:YES completion:^{
        
        self.userName = [NSString stringWithFormat:@"%@",anFullName];
        self.userMobile = (__bridge NSString *)telValue;
        
        [self.tabView reloadData];
        
    }];
}

#pragma mark - 确认信息按钮
- (void)sureInfoButton {
    
    //label
    UILabel *descripLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(self.tabView.frame) + 10, SCREEN_WIDTH - 40, 20)];
    descripLabel.textAlignment = NSTextAlignmentCenter;
    descripLabel.text = @"当前地址自动设置为默认地址";
    descripLabel.font = [UIFont systemFontOfSize:14];
    descripLabel.textAlignment = NSTextAlignmentLeft;
    descripLabel.textColor = [Util stringTOColor:@"#afe3ca"];
    [self.view addSubview:descripLabel];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20, CGRectGetMaxY(descripLabel.frame) + 20, SCREEN_WIDTH - 40, 40);
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
    
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1.5;
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
    
    static NSString *cellId = @"ChargeAreaCell";
    NSArray *array = @[@"收货人：",@"手机号码：",@"所在地区：",@"邮政编码：",@"街道地址："];
    ChargeAreaCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"ChargeAreaCell" owner:self options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.typeLabel.text = array[indexPath.row];
    if (indexPath.row == 0) {
        cell.pressTextField.text = self.userName;
    } else if (indexPath.row == 1) {
        cell.pressTextField.text = self.userMobile;
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
