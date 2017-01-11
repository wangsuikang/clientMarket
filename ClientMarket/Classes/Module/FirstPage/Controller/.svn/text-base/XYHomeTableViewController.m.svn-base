//
//  XYHomeTableViewController.m
//  XianYu
//
//  Created by ZpyZp on 15/10/23.
//  Copyright © 2015年 berchina. All rights reserved.
//

#import "XYHomeTableViewController.h"
#import "AdView.h"
#import "XYLineLayout.h"
#import "HomeCollectionViewCell.h"
#import "HomeGoodsTableViewCell.h"
#import "WSKLocationViewController.h"
static NSString *const ID =@"collectionCell";

@interface XYHomeTableViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDataSource,UITableViewDelegate,UISearchResultsUpdating>
@property (nonatomic,strong) NSMutableArray *YTList;
@property (nonatomic,weak) UICollectionView *collectionView;
@property (nonatomic,weak) AdView *adView;
@property (nonatomic,weak) UITableView *goodListView;
@property (nonatomic,weak) UIView *headView;

@property (nonatomic,strong) NSMutableArray *goodListFrame;

@property (nonatomic, strong) UISearchController *searchController;

@end

@implementation XYHomeTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self UIConfig ];
    
    [self.view setBackgroundColor:[UIColor clearColor]];
    
}

- (void)UIConfig {
    [self createNavigationBar];
    [self createHeadView ];
   
}

- (void)createNavigationBar {
    self.navigationController.navigationBar.barTintColor = WSkPink_Color;
    UIView *navigationBar = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    navigationBar.backgroundColor = [UIColor clearColor];
    self.navigationItem.titleView = navigationBar;
    //backgroundColor
    //barTintColor
    
    UIButton *locationButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    //locationButton.backgroundColor = [UIColor redColor];
    [ locationButton addTarget:self action:@selector(navigationItemClick:) forControlEvents:(UIControlEventTouchUpInside)];
    locationButton.tag = 101;
    UILabel * label = [[UILabel alloc]init];
    label.textColor = [UIColor whiteColor];
    label.text = @"大连";
    label.font = wskFont(20);
    CGSize size=[label.text sizeWithAttributes:[NSDictionary dictionaryWithObject:label.font forKey:NSFontAttributeName]];
    label.frame = CGRectMake(0, 0, size.width, 30);
    
    UIImageView * imV = [[UIImageView alloc]initWithFrame:CGRectMake(size.width+5, 11, 14, 8)];
    imV.image = [UIImage imageNamed:@"btn_porfile_down"];
    locationButton.frame = CGRectMake(0, 0, label.bounds.size.width+imV.bounds.size.width+5, 30);
    [locationButton addSubview:label];
    [locationButton addSubview:imV];
    
    UIBarButtonItem *locationItem = [[UIBarButtonItem alloc]initWithCustomView:locationButton];
    
    
    
    UIButton *dialogueButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    dialogueButton.frame = CGRectMake(0, 0, 30, 30);
    [dialogueButton setBackgroundImage:[UIImage imageNamed:@"nav_btn_news_default"] forState:(UIControlStateNormal)];
    [ dialogueButton addTarget:self action:@selector(navigationItemClick:) forControlEvents:(UIControlEventTouchUpInside)];
    dialogueButton.tag = 102;
    UIBarButtonItem *dialogueItem = [[UIBarButtonItem alloc]initWithCustomView:dialogueButton];
    
    UIBarButtonItem *negativeSeperator = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSeperator.width = -10;
    
    self.navigationItem.leftBarButtonItems =@[negativeSeperator,locationItem];
    self.navigationItem.rightBarButtonItems = @[negativeSeperator,dialogueItem];
    _searchController = [[UISearchController alloc]initWithSearchResultsController:nil ];
    _searchController.searchResultsUpdater = self;
    _searchController.dimsBackgroundDuringPresentation = NO;
    _searchController.obscuresBackgroundDuringPresentation = NO;
    _searchController.hidesNavigationBarDuringPresentation = NO;
    
    // [_searchController.searchBar setPositionAdjustment:UIOffsetMake(-50, -50) forSearchBarIcon:UISearchBarIconSearch];
    _searchController.searchBar.frame = CGRectMake(self.searchController.searchBar.frame.origin.x, self.searchController.searchBar.frame.origin.y, SCREEN_WIDTH-locationButton.bounds.size.width - dialogueButton.bounds.size.width, 44.0);
    //_searchController.searchBar.textInputMode
    _searchController.searchBar.placeholder = @"搜索设计师、店铺和商品";
    //_searchController.searchBar.backgroundColor = WSkRed_Color;
    
    [[UITextField appearanceWhenContainedIn:[UISearchBar class], nil] setBackgroundColor:[UIColor redColor]];
    
  //  [[ appearanceWhenContainedInInstancesOfClasses:[UISearchBar class], nil]setBackgroundColor:innerColor];
   // [_searchController.searchBar layoutSubviews];
//    for (UIView* subview in [[_searchController.searchBar.subviews lastObject] subviews]) {
//        if([subview isKindOfClass:[UITextField class]])
//        {
//            UITextField *textField = (UITextField *)subview;
//            textField.clipsToBounds = NO;
//            textField.leftView = nil;
//            UIView * imageV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
//            imageV.backgroundColor = [UIColor cyanColor];
//            [textField setRightViewMode:UITextFieldViewModeAlways];
//            textField.rightView = imageV;
//            textField.placeholder = @"搜索设计师、店铺和商品";
//        }
//    }
    self.navigationItem.titleView = _searchController.searchBar;
}

#pragma mark -- UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {



}

- (void)navigationItemClick:(UIButton *)item {
    switch (item.tag) {
        case 101:
        {
            WSKLocationViewController *lc = [[WSKLocationViewController alloc]init];
            [self.navigationController pushViewController:lc animated:NO];
       
        }
            break;
        case 102:
        {
            
        }
            break;
            
        default:
            break;
    }
   


}

- (void)createHeadView {
    UIScrollView *scrollV = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
    [ self.view addSubview:scrollV];
    for (int i = 0; i < 2; i ++) {
        UIButton * button = [UIButton buttonWithType:(UIButtonTypeCustom)];
        button.frame = CGRectMake(i*SCREEN_WIDTH, 0, SCREEN_WIDTH, 200);
        button.backgroundColor = [UIColor greenColor];
        [scrollV addSubview:button];
    }
    scrollV.contentSize = CGSizeMake(SCREEN_WIDTH*2, 0);
    NSArray * images = @[@"icon_btn_dzml_default",@"icon_btn_stdp_default",@"icon_btn_jpsp_default"];
    
    for (int i = 0; i < 3; i ++) {
        UIButton * button = [UIButton buttonWithType:(UIButtonTypeCustom)];
        button.frame = CGRectMake(i*(SCREEN_WIDTH/3), scrollV.bounds.size.height, SCREEN_WIDTH/3, 45);
        [button setBackgroundImage:[UIImage imageNamed:images[i]] forState:(UIControlStateNormal)];
        [self.view addSubview:button];
        
    }
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
