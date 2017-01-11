//
//  WSKLocationViewController.m
//  ClientMarket
//
//  Created by 王岁康 on 2017/1/9.
//  Copyright © 2017年 etlfab. All rights reserved.
//

#import "WSKLocationViewController.h"
#import "UIButton+WSKCustomButton.h"
@interface WSKLocationViewController ()
@property (weak, nonatomic) IBOutlet UIButton *locationCity;
@property (weak, nonatomic) IBOutlet UILabel *hotCity;
@end

@implementation WSKLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self UIConfig];

}
- (void)UIConfig {
    [self createNavigationBar];
    [self createHotCity ];
    
}

- (void)createNavigationBar {
    self.navigationItem.title = @"选择所在地";
    NSDictionary * dict = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:16]};
   [ self.navigationController.navigationBar setTitleTextAttributes:dict];
    self.navigationController.navigationBar.barTintColor = WSkPink_Color;
    
    UIBarButtonItem *backitemItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"nav_btn_close_default"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)]style:(UIBarButtonItemStylePlain) target:self action:@selector(backClick)];
    self.navigationItem.leftBarButtonItem = backitemItem;

}

- (void)backClick {
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

- (void)createHotCity {
    [self.locationCity setborderColor:[UIColor grayColor] :1 :3];
    NSArray *citys = @[@"北京",@"上海",@"天津",@"合肥",@"郑州",@"广州",@"深圳"];
    CGFloat btnWidth = 100;
    CGFloat btnHeight= 30;
    CGFloat xSpace = (SCREEN_WIDTH-btnWidth*3-10*2)/2;
    CGFloat ySpace = 10;
    for (int i = 0; i < citys.count; i++) {
        UIButton * cityBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        
        cityBtn.frame = CGRectMake(10+(btnWidth+xSpace)*(i%3), self.hotCity.frame.origin.y+self.hotCity.bounds.size.height + 20 +(btnHeight+ySpace)*(i/3) , btnWidth, btnHeight);
        [cityBtn setTitle:citys[i] forState:(UIControlStateNormal)];
        [cityBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        cityBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [cityBtn setborderColor:[UIColor grayColor] :1 :3];
        [cityBtn setBackgroundColor:[UIColor whiteColor]];
        [self.view addSubview:cityBtn];
        
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
