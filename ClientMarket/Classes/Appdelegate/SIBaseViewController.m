//
//  SIBaseViewController.m
//  zizhubao
//
//  Created by 赵光超 on 14-3-11.
//  Copyright (c) 2014年 zgcrichard. All rights reserved.
//

#import "SIBaseViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "JSONKit.h"
//重新登录
//#import "SILoginViewController.h"
//#import "ZZBLoginTenViewController.h"
//#import "ZZBAppDelegate.h"
//#import "ControlManager.h"
#import "EnCodeViewController.h"
#import "Util.h"
//#import "SIMainViewController.h"
#import "loadingView.h"

//抓取异常报告
#import "NdUncaughtExceptionHandler.h"
//通知监听左右边导航按钮的点击事件
#define postNavClickToVc @"postNavClickToVc"

@interface SIBaseViewController () {
   UIView * _nagation;
}
@property (nonatomic,retain) loadingView *loading;

@end

@implementation SIBaseViewController
@synthesize loading;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //抓取错误日志
    [NdUncaughtExceptionHandler setDefaultHandler];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    self.view.backgroundColor = [UIColor whiteColor];
//    self.view.backgroundColor = ZZBVIEWBACKGROUNDCOLOR;
    self.navigationController.navigationBarHidden = YES;
}

/**
 *	@brief	自定义字体
 *  @param  fontname 自定义字体名字
 *  @param  size 自定义字体大小
 */
- (void)setFont:(NSString*)fontName WithSize:(float)size forLable:(UILabel*)lable;
{
    if(![fontName isEqualToString:ZZBSYSTEMFONT]){
       lable.font = [UIFont fontWithName:fontName size:size];
    }else{
       lable.font = [UIFont systemFontOfSize:size];
    }
}

/**
 *	@brief	设置字体方法
 *
 *	@param 	fontFamily 	字体
 *	@param 	view 	View
 *	@param 	isSubViews 	是否是subView
 */
#pragma mark - 设置字体方法
-(void)setFontFamily:(NSString*)fontFamily forView:(UIView*)view andSubViews:(BOOL)isSubView
{
    
    if ([view isKindOfClass:[UILabel class]])
    {
        UILabel *lbl = (UILabel *)view;
        [lbl setFont:[UIFont fontWithName:fontFamily size:[[lbl font] pointSize]]];
    }
    
    if (isSubView)
    {
        for (UIView *sview in view.subviews)
        {
            for (UIView *subview in sview.subviews) {
                [self setFontFamily:fontFamily forView:subview andSubViews:YES];
            }
            [self setFontFamily:fontFamily forView:sview andSubViews:YES];
        }
    }
}

/**
 *	@brief	隐藏导航条
 *
 *	@param 	animated 	是否有动画
 */
#pragma mark - 隐藏导航条
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

/**
 *	@brief	获取整个设备屏幕的高度
 *
 *	@return	返回所获取到的设备高度
 */
#pragma mark - 获取整个设备屏幕的高度
- (float)getScreenHeight
{
    return [[UIScreen mainScreen] bounds].size.height;
}

/**
 *	@brief	获取整个屏幕的宽度
 *
 *	@return	返回所获取到的设备宽度
 */
#pragma mark - 获取整个屏幕的宽度
- (float)getScreenWidth
{
    return [[UIScreen mainScreen] bounds].size.width;
}

/**
 *	@brief	设置圆角
 */
#pragma mark - 设置圆角
- (void)setRoundRect:(UIView*) view
{
    view.layer.cornerRadius  = 8;
    view.layer.masksToBounds = YES;
    //给图层添加一个有色边框
    view.layer.borderColor   = [[UIColor grayColor] CGColor];
    //给图层添加一个边框宽度
    view.layer.borderWidth   = 1;
}

/**
 *	@brief	设置圆角
 */
#pragma mark - 设置圆角(圆角参数)
- (void)setRoundRect:(UIView*) view cornerRadius:(CGFloat) cornerRadius
{
    view.layer.cornerRadius  = cornerRadius;
    view.layer.masksToBounds = YES;
    //给图层添加一个有色边框
    view.layer.borderColor   = [[UIColor grayColor]CGColor];
    //给图层添加一个边框宽度
    view.layer.borderWidth   = 1;
}

/**
 *	@brief	设置圆角
 *
 *	@param 	width 	边框宽度
 */
#pragma mark - 设置圆角(圆角参数，边框宽度)
- (void)setRoundRect:(UIView*) view cornerRadius:(CGFloat) cornerRadius borderWidth:(CGFloat)width
{
    view.layer.cornerRadius  = cornerRadius;
    view.layer.masksToBounds = YES;
    //给图层添加一个有色边框
    view.layer.borderColor   = [[UIColor grayColor] CGColor];
    //给图层添加一个边框宽度
    view.layer.borderWidth   = width;
}

/**
 *	@brief	创建按钮
 *
 *	@param 	title 	按钮标题
 *	@param 	frame 	按钮坐标
 *
 *	@return	返回按钮
 */
#pragma mark - 创建按钮
- (UIButton *)createUIButton:(NSString *)title frame:(CGRect)frame
{
    UIButton *btn       = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame           = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:16.0f];
//    btn.backgroundColor = [UIColor lightGrayColor];
//    [self setRoundRect:btn cornerRadius:5];
    return btn;
}

#pragma mark - 创建按钮
- (UIButton *)createUIButton:(NSString *)title frame:(CGRect)frame backImage:(NSString *)backImage
{
    UIButton *btn       = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame           = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    [btn setImage:[[UIImage imageNamed:backImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    
    return btn;
}

/**
 *	@brief	创建文本框
 *
 *	@param 	placeholder 	提示语
 *	@param 	frame 	坐标
 *
 *	@return	返回创建的文本框
 */
#pragma mark - 创建文本框
- (UITextField *)createUITextfield:(NSString *)placeholder frame:(CGRect)frame
{
    UITextField *tf = [[UITextField alloc] init];
    tf.placeholder  = placeholder;
    tf.frame        = frame;
    return tf;
}

/**
 *	@brief	创建标签
 *
 *	@param 	title 	标签标题
 *	@param 	frame 	坐标
 *
 *	@return	返回创建的标签
 */
#pragma mark - 创建标签
- (UILabel *)createUILabel:(NSString *)title frame:(CGRect)frame
{
    UILabel *label = [[UILabel alloc] init];
    label.text     = title;
    label.frame    = frame;
    return label;
}

/**
 *	@brief	自定义导航条
 *
 *	@param 	标题
 */
#pragma mark - 自定义导航条(通用)
- (void)initNavigation:(NSString *)title
{
    UIView *nav         = [[UIView alloc] initWithFrame:(CGRect){0, 0, [self getScreenWidth], ZZBnavHeight}];
    nav.backgroundColor = [UIColor colorWithRed:241/255.0f green:241/255.0f blue:241/255.0f alpha:1.0];
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame     = CGRectMake(5, 28, 32, 32);
    [back setImage:[UIImage imageNamed:@"myABack"] forState:UIControlStateNormal];
    [back setImage:[UIImage imageNamed:@"myABacks"] forState:UIControlStateHighlighted];
    [back addTarget:self action:@selector(c_back) forControlEvents:UIControlEventTouchUpInside];
    [nav addSubview:back];
    
    CGFloat x      = CGRectGetMaxX(back.frame);
    UILabel *label = [self createUILabel:title frame:(CGRect){x, 30, [self getScreenWidth]-2*x, 24}];
    label.textAlignment   =  NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.textColor       = [UIColor blackColor];
    label.font            = [self appFontWithFontSize:ZZBNAVTITLEFONT];
    [nav addSubview:label];
    
    [self.view addSubview:nav];
    //添加导航阴影
    [self addNavigationShade];
}

/**
 *	@brief	自助投导航条
 *
 *	@param 	标题
 */
#pragma mark - 自助投导航条
//- (void)initSelfServiceNavigation:(NSString *)title
//{
//
//    UIView *nav         = [[UIView alloc] initWithFrame:(CGRect){0, 0, [self getScreenWidth], ZZBnavHeight}];
//    nav.tag = 50123;
//    nav.backgroundColor = [UIColor colorWithRed:241/255.0f green:241/255.0f blue:241/255.0f alpha:1.0];
//    
//    
//    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
//    back.frame     = CGRectMake(5, 28, 32, 32);
//    [back setImage:[UIImage imageNamed:@"myABack"] forState:UIControlStateNormal];
//    [back setImage:[UIImage imageNamed:@"myABacks"] forState:UIControlStateHighlighted];
//    [back addTarget:self action:@selector(c_back) forControlEvents:UIControlEventTouchUpInside];
//    [nav addSubview:back];
//
//    
//    CGFloat x             = SCREEN_WIDTH-5;
//    UILabel *label        = [self createUILabel:title frame:(CGRect){x,30,[self getScreenWidth]-2*x,24}];
//    label.tag = 50000;
//    label.textAlignment   = NSTextAlignmentCenter;
//    label.backgroundColor = [UIColor clearColor];
//    label.textColor       = [UIColor blackColor];
//    label.font            = [self appFontWithFontSize:ZZBNAVTITLEFONT];
//    [nav addSubview:label];
//    
//    [self.view addSubview:nav];
//    //添加导航阴影
//    [self addNavigationShade];
//}

/**
 *	@brief	返回上一级
 */
#pragma mark - 返回上一级
- (void)c_back
{
    
    [self.view endEditing:YES];
//    [ControlManager shareInstance].myDelegate = nil;
    if(self.rootNavController)
        [self.rootNavController popViewControllerAnimated:YES];
    else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

/**
 *	@brief	自定义当日达导航条
 *
 *	@param 	标题
 */
#pragma mark - 自定义导航条(通用)
- (void)initDangRiDaNavigation:(NSString *)title
{
    UIView *nav         = [[UIView alloc] initWithFrame:(CGRect){0, 0, [self getScreenWidth], ZZBnavHeight}];
    nav.backgroundColor = [UIColor colorWithRed:241/255.0f green:241/255.0f blue:241/255.0f alpha:1.0];
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame     = CGRectMake(5, 28, 32, 32);
    [back setImage:[UIImage imageNamed:@"myABack"] forState:UIControlStateNormal];
    [back setImage:[UIImage imageNamed:@"myABacks"] forState:UIControlStateHighlighted];
    [back addTarget:self action:@selector(dangRiDaClick) forControlEvents:UIControlEventTouchUpInside];
    [nav addSubview:back];
    
    CGFloat x      = CGRectGetMaxX(back.frame);
    UILabel *label = [self createUILabel:title frame:(CGRect){x, 30, [self getScreenWidth]-2*x, 24}];
    label.textAlignment   =  NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.textColor       = [UIColor blackColor];
    label.font            = [self appFontWithFontSize:ZZBNAVTITLEFONT];
    [nav addSubview:label];
    
    [self.view addSubview:nav];
    //添加导航阴影
    [self addNavigationShade];
}

- (void) dangRiDaClick {

//    for (UIViewController *vc in self.navigationController.viewControllers) {
//        if ([vc isKindOfClass:[SIMainViewController class]]) {
//            [self.navigationController popToViewController:vc animated:YES];
//        }
//    }
}
/**
 *	@brief	返回导航条高度
 *
 *	@return	返回高度
 */
#pragma mark - 返回导航条高度
- (CGFloat)getNavHeight
{
    return ZZBnavHeight;
}



/**
 *	@brief	登录定制导航栏
 *
 *	@param 	title 	登录标题
 */
#pragma mark - 登录定制导航栏
- (void)initLoginNavigation:(NSString *)title
{
    UIView *nav         = [[UIView alloc] initWithFrame:(CGRect){0, 0, [self getScreenWidth], ZZBnavHeight}];
    nav.backgroundColor = [UIColor colorWithRed:241/255.0f green:241/255.0f blue:241/255.0f alpha:1.0f];
    nav.alpha           = 0.98;
    
    CGFloat x             = 27;
    UILabel *label        = [self createUILabel:title frame:(CGRect){x,30,[self getScreenWidth]-2*x,24}];
    label.textAlignment   = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.textColor       = [UIColor blackColor];
    label.font            = [self appFontWithFontSize:ZZBNAVTITLEFONT];
    [nav addSubview:label];
    
    [self.view addSubview:nav];
    //添加导航阴影
    [self addNavigationShade];
}

/**
 *	@brief	我的账户导航栏
 *
 *	@param 	title 	标题
 */
#pragma mark - 我的账户导航栏
- (void)initMyAccountNavigation:(NSString *)title
{
    _nagation         = [[UIView alloc] initWithFrame:(CGRect){0, 0, [self getScreenWidth], ZZBnavHeight}];
    _nagation.backgroundColor = [UIColor colorWithRed:247/255.0f green:247/255.0f blue:247/255.0f alpha:1.0f];
    _nagation.alpha           = 0.98;
    _nagation.tag = 50123;
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame     = CGRectMake(5, 28, 32, 32);
    [back setImage:[UIImage imageNamed:@"myABack"] forState:UIControlStateNormal];
    [back setImage:[UIImage imageNamed:@"myABacks"] forState:UIControlStateHighlighted];
    [back addTarget:self action:@selector(c_back) forControlEvents:UIControlEventTouchUpInside];
    [_nagation addSubview:back];
    
    CGFloat x             = CGRectGetMaxX(back.frame);
    UILabel *label        = [self createUILabel:title frame:(CGRect){x,30,[self getScreenWidth]-2*x,24}];
    label.textAlignment   = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.textColor       = [UIColor blackColor];
    label.font            = [UIFont systemFontOfSize:ZZBNAVTITLEFONT];
    label.tag = 50000;
    [_nagation addSubview:label];
    
    [self.view addSubview:_nagation];
    //添加导航阴影
    [self addNavigationShade];
}

#pragma mark - 我的账户导航
- (void)initMyIntsgraNavigation:(NSString *)title button:(UIButton *)button {

    [self initMyAccountNavigation:title];
    
    button.frame = CGRectMake(SCREEN_WIDTH - 55, 27, 40, 30);
    [button setTitle:@"兑换" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button setTitleColor:[Util stringTOColor:@"#ff6623"] forState:UIControlStateNormal];
//    button.backgroundColor = [UIColor redColor];
    [_nagation addSubview:button];
}

#pragma mark - 我的账户导航
- (void)initMyCustomerNavigation:(NSString *)title button:(UIButton *)button titleButton:(UIButton *)titleButton {
    
    [self initMyAccountNavigation:title];
    
    //消息按钮图片
    button.frame = CGRectMake([self getSize:(SCREEN_WIDTH - [self getSize:80])], 20 + [self getSize:(44 - 20)/2], [self getSize:20], [self getSize:20]);
    [button setImage:[UIImage imageNamed:@"icon-add"] forState:UIControlStateNormal];
    button.tag = 102;
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    //显示消息的label
    titleButton.frame = CGRectMake(CGRectGetMaxX(button.frame),20 + [self getSize:(44 - 17)/2],[self getSize:55],[self getSize:17]);
    [titleButton setTitle:@"添加客户" forState:UIControlStateNormal];
    titleButton.titleLabel.font = [UIFont systemFontOfSize:[self getSize:13]];
    [titleButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];

    [_nagation addSubview:button];
    [_nagation addSubview:titleButton];
    
}

#pragma mark
/**
 *	@brief	创建导航条右图片按钮
 *
 *	@param 	imgNormal 	正常图片
 *	@param 	highlighted 	高亮图片
 *
 *	@return	返回按钮
 */
#pragma mark - 创建导航条右图片按钮
- (UIButton *)createRightNavimgbtn:(UIImage *)imgNormal highlighted:(UIImage *)highlighted
{
    UIButton *rightbtn       = [UIButton buttonWithType:UIButtonTypeCustom];
    rightbtn.frame           = (CGRect){[self getScreenWidth]-5-22, 33, 22, 22};
    [rightbtn setImage:imgNormal forState:UIControlStateNormal];
    [rightbtn setImage:highlighted forState:UIControlStateHighlighted];
    rightbtn.backgroundColor = [UIColor clearColor];
    return rightbtn;
}

/**
 *	@brief	创建导航条右按钮
 *
 *	@param 	strTitle 	按钮文字
 *
 *	@return	返回按钮
 */
#pragma mark - 创建导航条右按钮
- (UIButton *)createRightNavimgbtn:(NSString *)strTitle
{
    UIButton *rightbtn       = [UIButton buttonWithType:UIButtonTypeCustom];
    rightbtn.frame           = (CGRect){[self getScreenWidth]-5-80, 33, 80, 22};
    [rightbtn setTitle:strTitle forState:UIControlStateNormal];
    [rightbtn setTitleColor:[UIColor colorWithRed:76/255.0f green:81/255.0f blue:91/255.0f alpha:1.0f] forState:UIControlStateNormal];
    rightbtn.titleLabel.font = [self appFontWithFontSize:16.0f];
    rightbtn.backgroundColor = [UIColor clearColor];
    return rightbtn;
}

/**
 *	@brief	自定义导航条
 *
 *	@param 	标题
 */
#pragma mark - 自定义导航条(通用)
- (void)initRootNavigation:(NSString *)title leftBackGroundImage:(NSString *)leftBackGroundImage leftLabelText:(NSString *)leftLabelText rightBackGroundImage:(NSString *)rightBackGroundImage rightLabelText:(NSString *)rightLabelText {
    
    UIView *nav = [[UIView alloc] initWithFrame:(CGRect){0, 0, [self getScreenWidth], ZZBnavHeight}];
    nav.backgroundColor = [UIColor colorWithRed:241/255.0f green:241/255.0f blue:241/255.0f alpha:1.0];
    
    UIButton *back;
    if (leftBackGroundImage) {
        back = [UIButton buttonWithType:UIButtonTypeCustom];
        back.frame = CGRectMake([self getSize:7], 20 + (44 - [self getSize:30])/2, [self getSize:30], [self getSize:30]);
        back.tag = 101;
        [back addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [back setImage:[[UIImage imageNamed:leftBackGroundImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [nav addSubview:back];
    }
    
    //消息按钮图片
    UIButton *buttonMessage = [[UIButton alloc] init];
    buttonMessage.frame = CGRectMake([self getSize:(SCREEN_WIDTH - [self getSize:69])], 20 + (44 - [self getSize:30])/2, [self getSize:30], [self getSize:30]);
    buttonMessage.tag = 102;
    [buttonMessage addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [buttonMessage setImage:[[UIImage imageNamed:rightBackGroundImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [nav addSubview:buttonMessage];
    
    //显示消息的label
    UILabel *messageLabel = [self createUILabel:rightLabelText frame:CGRectMake(CGRectGetMaxX(buttonMessage.frame),20 + [self getSize:(44 - 17)/2],[self getSize:28],[self getSize:17])];
    messageLabel.font = [UIFont systemFontOfSize:[self getSize:14]];
    
    UILabel *leftLabel;
    if (leftLabelText) {
        leftLabel = [self createUILabel:leftLabelText frame:CGRectMake(CGRectGetMaxX(back.frame) + 2, 20 + (44 - [self getSize:17]) / 2, [self getSize:60], [self getSize:17])];
        leftLabel.font = [UIFont systemFontOfSize:[self getSize:14]];
    }
    
    CGFloat x = CGRectGetMaxX(back.frame);
    UILabel *label = [self createUILabel:title frame:(CGRect){x, 30, [self getScreenWidth]-2*x, 24}];
    label.textAlignment =  NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor blackColor];
    label.font = [self appFontWithFontSize:ZZBNAVTITLEFONT];
    
    [nav addSubview:leftLabel];
    [nav addSubview:label];
    [nav addSubview:buttonMessage];
    [nav addSubview:messageLabel];
    
    [self.view addSubview:nav];
    
    //添加导航阴影
    [self addNavigationShade];
}

- (void)btnClick:(UIButton *)button {
    [[NSNotificationCenter defaultCenter] postNotificationName:postNavClickToVc object:[NSNumber numberWithInt:button.tag]];
}

/**
 *	@brief	设置View为不可编辑状态
 *
 *	@param 	touches 	触摸
 *	@param 	event 	事件
 */
#pragma mark - 设置View为不可编辑状态
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

/**
 *	@brief	警告提示
 *
 *	@param 	message 	提示语
 */
#pragma mark - 警告提示
- (void)showAlert:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:ZZBAlertTitle
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil, nil];
    [alert show];
}

/**
 *	@brief	判断设备系统版本号是否小于7.0
 *
 *	@return	返回BOOL值
 */
#pragma mark - 判断设备系统版本号是否小于7.0
- (BOOL)versionBelowSeven
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue]<7) {
        return YES;
    }else{
        return NO;
    }
}

/**
 *	@brief	根据文本内容，字体，显示区域返回高度
 *
 *	@param 	text 	文本内容
 *	@param 	font 	文本字体大小
 *	@param 	size 	显示区域
 *
 *	@return	返回高度
 */
#pragma mark - 根据文本内容，字体，显示区域返回高度
- (float)getTextHeight:(NSString *)text font:(UIFont *)font size:(CGSize)size
{
    if([self isBlank:text])return 0;
    if([self isClassBlank:font])return 0;
    CGSize s = [text sizeWithFont:font constrainedToSize:size];
    return s.height;
}

/**
 *	@brief	根据文本内容，字体，显示区域返回宽度
 *
 *	@param 	text 	文本内容
 *	@param 	font 	文本字体大小
 *	@param 	size 	显示区域
 *
 *	@return	返回宽度
 */
#pragma mark - 根据文本内容，字体，显示区域返回宽度
- (float)getTextWidth:(NSString *)text font:(UIFont *)font size:(CGSize)size
{
    if([self isBlank:text])return 0;
    if([self isClassBlank:font])return 0;
    CGSize s = [text sizeWithFont:font constrainedToSize:size];
    return s.width;
}

/**
 *	@brief	定制App的字体
 *
 *	@param 	fontSize 	字体大小
 *
 *	@return	返回定制的App字体
 */
#pragma mark - 定制App的字体
- (UIFont *)appFontWithFontSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:@"Helvetica" size:fontSize];
//    return [UIFont fontWithName:@"Helvetica-BoldOblique" size:fontSize];
}

/**
 *	@brief	添加分割线
 *
 *	@param 	frame 	坐标
 *
 *	@return	返回创建的分割线
 */
#pragma mark - 添加分割线
- (UIView *)addLine:(CGRect)frame
{
    UIView *view         = [[UIView alloc] initWithFrame:frame];
//    view.backgroundColor = [UIColor colorWithRed:191/255.0f green:191/255.0f blue:191/255.0f alpha:0.4f];
    view.backgroundColor = [UIColor colorWithRed:204/255.0f green:204/255.0f blue:204/255.0f alpha:0.4f];
    return view;
}

/**
 *	@brief	正则判断是否手机号
 *
 *	@param 	str 	字符串
 *
 *	@return	返回BOOL值
 */
#pragma mark - 正则判断是否手机号
- (BOOL)isMobilePhoneNumber:(NSString *)str
{
    if([self isBlank:str]){
        return NO;
    }
//    NSString * regex  = @"^[1][3-8]\\d{9}$";
    NSString * regex  = @"^[1][0-9]\\d{9}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:str];
}

/**
 *	@brief	判断图形验证码符不符合要求
 *
 *	@param 	str 	用户输入的图形验证码
 *
 *	@return	返回BOOL值
 */
- (BOOL)isImageCode:(NSString *)str
{
    NSString *regex = @"^[0-9|a-z|A-Z]*$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:str];
}

/**
 *	@brief	正则判断车牌号
 *
 *	@param 	str 	输入的车牌号
 *
 *	@return	返回判断结果
 */
- (BOOL)isCarNo:(NSString *)str
{
    if ([self isBlank:str]) {
        return NO;
    }
    str = [str uppercaseString];
//    NSString *regex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
    NSString *regex = @"^(?:(?:[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼][a-zA-Z]-?(?:\\*|[a-zA-Z0-9]{5,6}))|(?:[京津沪渝]\\*))$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:str];
}

/**
 *	@brief	获取字典中值
 *
 *	@param 	dictionary 	字典
 *	@param 	key 	key
 *
 *	@return	返回对应值
 */
- (id)dictionary:(NSDictionary *)dictionary objectForkey:(NSString *)key
{
    if ([dictionary.allKeys containsObject:key]) {
        //包含这个key
        if (![self isClassBlank:[dictionary objectForKey:key]]) {
            //判断字典中Key有值
            return [dictionary objectForKey:key];
        }
    }
    return @"";
}

/**
 *	@brief	正则判断*车牌号
 *
 *	@param 	str 	输入的车牌号
 *
 *	@return	返回判断结果
 */
- (BOOL)isCarNoCommon:(NSString *)str
{
    if ([self isBlank:str]) {
        return NO;
    }
    NSString *regex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[*]{1}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:str];
}

- (float)zoomiPhone6Pto5{
    float zoom = 1.0f;
    if ([self getScreenHeight] == 736) {
        //iPhone6 Plus 逻辑分辨率 414*736
        zoom = (float)1.0f;
    }else if ([self getScreenHeight] == 667) {
        //iPhone6  逻辑分辨率 375*667
        zoom = (float)667/736;
    }else if ([self getScreenHeight] == 568) {
        //iPhone5S 逻辑分辨率 320*568
        zoom = (float)568/736;
    }else if ([self getScreenHeight] == 480) {
        //iPhone 4/4S
        zoom = (float)568/736;
    }
    return zoom;
}


/**
 *	@brief	正则判断证件号码是否是身份证后六位或者是生日
 *
 *	@param 	str 	输入的车牌号
 *
 *	@return	返回判断结果
 */
- (BOOL)isCertifiCate:(NSString *)str
{
    if ([self isBlank:str]) {
        return NO;
    }
//    NSString *regex = @"^[0-9]{4,5}[0-9*]{0,1}";
    NSString *regex = @"^[0-9a-zA-Z]{5}[0-9a-zA-Z*]{1}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:str];
}

/**
 *	@brief	正则判断是否是字母和数字
 *
 *	@param 	str 	字符串
 *
 *	@return	返回判断结果
 */
- (BOOL)isLetterNumber:(NSString *)str
{
    NSString *regex = @"[A-Za-z0-9]{0,32}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pred evaluateWithObject:str];
}

/**
 *	@brief	字符串是否是空白
 *
 *	@param 	str 	字符串
 *
 *	@return	返回BOOL值
 */
#pragma mark - 字符串是否是空白
- (BOOL)isBlank:(NSString *)str
{
    if([self isClassBlank:str]){
        return YES;
    }
    if(![self isString:str]){
        return YES;
    }
    for(int i = 0; i < str.length; i++){
        if([[str substringWithRange:NSMakeRange(i, 1)] isEqualToString:@" "]==NO){
            return NO;
        }
    }
    return YES;
}

/**
 *	@brief	判断对象是否为空、NULL、nil
 *
 *	@param 	obj 	对象
 *
 *	@return	返回BOOL值
 */
#pragma mark - 判断对象是否为空、NULL、nil
- (BOOL)isClassBlank:(id)obj
{
    if(obj == [NSNull null] || obj == nil){
        return YES;
    }
    if([obj isKindOfClass:[NSArray class]]){
        return [obj count]==0;
    }
    if([obj isKindOfClass:[NSMutableArray class]]){
        return [obj count]==0;
    }
    if([obj isKindOfClass:[NSDictionary class]]){
        return [obj count]==0;
    }
    if([obj isKindOfClass:[NSMutableDictionary class]]){
        return [obj count]==0;
    }
    if([obj isKindOfClass:[NSData class]]){
        return [obj length]==0;
    }
    if([obj isKindOfClass:[NSString class]]){
        return [obj length]==0;
    }
    if ([obj isKindOfClass:[NSNumber class]]) {
        return [[NSString stringWithFormat:@"%@",obj] length]==0;
    }
    return NO;
}

/**
 *	@brief	判断是不是字符串类
 *
 *	@param 	str 	字符串
 *
 *	@return	返回BOOL值
 */
#pragma mark - 判断是不是字符串类
- (BOOL)isString:(id)str
{
    return [str isKindOfClass:[NSString class]]||str == nil;
}

/**
 *	@brief	获取本地文件Result内容
 *
 *	@param 	docName 	文件名称
 *
 *	@return	返回格式化后的字典
 */
#pragma mark - 获取本地文件Result内容
- (id)returnLocalDataResult:(NSString *)docName
{
    NSString *  path = [[NSBundle mainBundle] pathForResource:docName ofType:@"txt"];
    if ([self isBlank:path]) {
        [SVProgressHUD showErrorWithStatus:@"未找到文件"];
        return nil;
    }
    NSData* data = [[NSData alloc ] initWithContentsOfFile:path];
    NSDictionary *dic = (NSDictionary*)[data objectFromJSONData];
    return [dic objectForKey:@"result"];
}

/**
 *	@brief	将传过来的字典倒序排列
 *
 *	@param 	array 	需要排序的字典
 *
 *	@return	返回整理后的字典
 */
#pragma mark - 将传过来的字典倒序排列
- (NSArray *)arrSortbyDESC:(NSArray *)array
{
    //字母排序
    NSStringCompareOptions comparisonOptions = NSCaseInsensitiveSearch|NSNumericSearch|
    NSWidthInsensitiveSearch|NSForcedOrderingSearch;
    NSComparator sort = ^(NSString *obj1,NSString *obj2){
        NSRange range = NSMakeRange(0,obj1.length);
        return [obj2 compare:obj1 options:comparisonOptions range:range];
    };
    return [array sortedArrayUsingComparator:sort];
}

#pragma mark - 将传过来的字典正序排列
/**
 *	@brief	将需要排序的数组进行排序
 *
 *	@param 	array 	需要排序的数组
 *
 *	@return	返回排好序的数组
 */
- (NSArray *)arrSortbyACS:(NSArray *)array
{
    //字母排序
    NSStringCompareOptions comparisonOptions = NSCaseInsensitiveSearch|NSNumericSearch|
    NSWidthInsensitiveSearch|NSForcedOrderingSearch;
    NSComparator sort = ^(NSString *obj2, NSString *obj1){
        NSRange range = NSMakeRange(0, obj1.length);
        return [obj2 compare:obj1 options:comparisonOptions range:range];
    };
    return [array sortedArrayUsingComparator:sort];
    
}

/**
 *	@brief	添加设置Default值方法
 *
 *	@param 	strKey 	Key
 *	@param 	strValue 	Value
 */
#pragma mark - 添加设置Default值方法
- (void)setDefaultValue:(id)strValue forKey:(NSString *)strKey
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (defaults) {
        if ([self isClassBlank:strValue])
        {
            [defaults setObject:@"" forKey:strKey];
        }else{
            //NSLog(@"strValue:%@",strValue);
            [defaults removeObjectForKey:strKey];
            [defaults setObject:strValue forKey:strKey];
        }
        [defaults synchronize];
    }
}

/**
 *	@brief	取出Default中值方法
 *
 *	@param 	strKey 	Key
 *
 *	@return	返回取出的值
 */
#pragma mark - 取出Default中值方法
- (id)getDefaultValuebyKey:(NSString *)strKey
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    id str = [defaults objectForKey:strKey];
    return str;
}

/**
 *	@brief	往字典中添加新的键值对
 *
 *	@param 	dic 	添加的键值对
 *
 *	@return	添加后的字典
 */
- (void)addNewDictionary:(NSMutableDictionary *)dicNew toOldDictionary:(NSMutableDictionary *)dicOld
{
    if ([self isClassBlank:dicOld]) {
        
        [self setDefaultValue:dicNew forKey:ZZBCooperation];
    }else{
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:dicOld];
        for (int i = 0; i<dicNew.allKeys.count; i++) {
            NSString *strKey = [dicNew.allKeys objectAtIndex:i];
            if ([self isClassBlank:[dicNew objectForKey:strKey]]) {
                [dic setObject:@"" forKey:strKey];
            }else{
                NSLog(@"key:%@ Value:%@",strKey,[dicNew objectForKey:strKey]);
                [dic setObject:[dicNew objectForKey:strKey] forKey:strKey];
            }
        }
        [self setDefaultValue:dic forKey:ZZBCooperation];
    }
}

/**
 *	@brief	移除Default中值方法
 *
 *	@param 	strKey 	Key
 */
#pragma mark - 移除Default中值方法
- (void)removeDefaultValuebyKey:(NSString *)strKey
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (defaults) {
        [defaults removeObjectForKey:strKey];
        [defaults synchronize];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *	@brief	重新登录
 */
#pragma mark - 重新登录
- (void)login
{
    //1.清理ViewControllers
    for (UIViewController *vc in self.navigationController.viewControllers) {
        [vc removeFromParentViewController];
    }
    //2.清理登录后的数据
    [self removeDefaultValuebyKey:ZZBopenKey];
    [self setDefaultValue:ZZBopenLogin forKey:ZZBopenKey];
    //3.清理token
    [self removeDefaultValuebyKey:ZZBMyapptoken];
    
    //清理数据
    [self clearAllCaches];
//    NSLog(@"media:%@",[self getDefaultValuebyKey:ZZBsourceTypeKey]);

    //重新登录
//    ZZBLoginTenViewController *login = [[ZZBLoginTenViewController alloc] init];
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:login];
//    ZZBAppDelegate *delegate = (ZZBAppDelegate *)[[UIApplication sharedApplication] delegate];
//    delegate.window.rootViewController = nav;
}

/**
 *	@brief	添加导航阴影
 */
#pragma mark - 添加导航阴影
- (void)addNavigationShade
{
    UIView *lineView =[self addLine:CGRectMake(0, ZZBnavHeight-1, [self getScreenWidth], 1)];
    lineView.backgroundColor = [UIColor colorWithRed:204/255.0f green:204/255.0f blue:204/255.0f alpha:1.0f];
    lineView.alpha = .8f;
    [self.view addSubview:lineView];
}

/**
 *	@brief	判断字符串仅包含数字
 *
 *	@param 	str 	字符串
 *
 *	@return	返回BOOL值
 */
#pragma mark - 判断字符串仅包含数字
- (BOOL)isNumeric:(NSString *)str
{
    NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
    NSString *filtered = [[str componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    return [str isEqualToString:filtered];
}

/**
 *	@brief	去除字符串中空格
 *
 *	@param 	str 	需过滤字符串
 *
 *	@return	返回过滤后字符串
 */
#pragma mark - 去除字符串中空格
- (NSString *)trimmingString:(NSString *)str
{
    str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    return str;
//    NSCharacterSet *space = [NSCharacterSet whitespaceAndNewlineCharacterSet];
//    return [str stringByTrimmingCharactersInSet:space];
}

/**
 *	@brief	加密字符串
 *
 *	@param 	str 	要加密的字符串
 *
 *	@return	返回加密后的字符串
 */
- (NSString *)encodeBaseString:(NSString *)str
{
    return [EnCodeViewController encodeBase64String:str];
}

/**
 *	@brief	解密字符串
 *
 *	@param 	str 	要解密的字符串
 *
 *	@return	返回解密后的字符串
 */
- (NSString *)decodeBaseString:(NSString *)str
{
    return [EnCodeViewController decodeBase64String:str];
}

/**
 *	@brief	清理本地数据
 */
#pragma mark - 清理本地缓存
-(void)clearAllCaches
{

}

/**
 *	@brief	根据字符内容，显示字体大小，字体范围
 *
 *	@param 	text 	文本内容
 *	@param 	font 	文本内容字体大小
 *	@param 	size 	文本显示范围
 *
 *	@return	返回CGSize
 */
- (CGSize)getTextSize:(NSString *)text font:(UIFont *)font size:(CGSize)size
{
    if([self isBlank:text])return CGSizeZero;
    if([self isClassBlank:font])return CGSizeZero;
    return [text sizeWithFont:font constrainedToSize:size];
}

/**
 *	@brief	判断是否为空
 *
 *	@param 	str 	判断的字符串
 *
 *	@return	返回字符串
 */
- (NSString *)getNull:(NSString *)str
{
    if ([self isBlank:str]) {
        return @"空";
    }else{
        return str;
    }
}

/**
 *	@brief	加载等待图标显示
 */
- (void)loadingShow
{
    [loadingView hudShow];
}

/**
 *	@brief	加载等待图标隐藏
 */
- (void)loadingHiden
{
    [loadingView hudHide];
}

/**
 *	@brief	判断是否是江西邮政用户登录，显示logo图片
 *
 *	@return	返回判断值
 */
- (BOOL)isPostOffice
{
    //判断存储有平邮信息不为空
    if (![self isBlank:[self getDefaultValuebyKey:ZZBPostUserIDKey]]) {
        //判断平邮信息
        if ([[self getDefaultValuebyKey:ZZBPostUserIDKey] isEqualToString:ZZBPostUserIDYES]) {
            return YES;
        }
    }else if(![self isBlank:[self getDefaultValuebyKey:ZZBPostGXYZUserIDKey]]){
        if ([[self getDefaultValuebyKey:ZZBPostGXYZUserIDKey] isEqualToString:ZZBPostGXYZUserIDYES]) {
            return YES;
        }
    }else{
//        [self.view addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"launchDefault.png"]]];
        return NO;
    }
    return NO;
}

/**
 *	@brief	判断是否是湖南腾顺用户登录
 *
 *	@return	返回判断值
 */
- (BOOL)isHNTS
{
    //判断存储有平邮信息不为空
    if (![self isBlank:[self getDefaultValuebyKey:ZZBHNTSUserIDKey]]) {
        //判断平邮信息
        if ([[self getDefaultValuebyKey:ZZBGZYZUserIdKey] isEqualToString:ZZBHNTSUserIDYES]) {

            return YES;
        }
    }else{

        return NO;
    }
    return NO;
}

/**
 *	@brief	判断是否是贵州邮政用户登录
 *
 *	@return	返回判断值
 */

- (BOOL)isGZYZ {
    //判断存储有平邮信息不为空
    if (![self isBlank:[self getDefaultValuebyKey:ZZBGZYZUserIdKey]]) {
        //判断平邮信息
        if ([[self getDefaultValuebyKey:ZZBGZYZUserIdKey] isEqualToString:ZZBGZYZUserIdYES]) {
            //            [self.view addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"aaaDefault.png"]]];
            return YES;
        }
    } else {
        //        [self.view addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"launchDefault.png"]]];
        return NO;
    }
    return NO;
}

/**
 *	@brief	判断是否是欧盈保用户登录
 *
 *	@return	返回判断值
 */

- (BOOL)isOYB {
    //判断存储有平邮信息不为空
    if (![self isBlank:[self getDefaultValuebyKey:ZZBOYBUserIdKey]]) {
        //判断平邮信息
        if ([[self getDefaultValuebyKey:ZZBOYBUserIdKey] isEqualToString:ZZBOYBUserIdYES]) {
            //            [self.view addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"aaaDefault.png"]]];
            return YES;
        }
    } else {
        //        [self.view addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"launchDefault.png"]]];
        return NO;
    }
    return NO;
}

/**
 *	@brief	判断是否是惠民供销用户登录，显示logo图片
 *
 *	@return	返回判断值
 */
- (BOOL)isHMGX
{
    //判断存储有平邮信息不为空
    if (![self isBlank:[self getDefaultValuebyKey:ZZBHMGXUserIdKey]]) {
        //判断平邮信息
        if ([[self getDefaultValuebyKey:ZZBHMGXUserIdKey] isEqualToString:ZZBHMGXUserIdYES]) {
            return YES;
        }
    }else if(![self isBlank:[self getDefaultValuebyKey:ZZBHMGXUserIdKey]]){
        if ([[self getDefaultValuebyKey:ZZBHMGXUserIdKey] isEqualToString:ZZBHMGXUserIdYES]) {
            return YES;
        }
    }else{
        //        [self.view addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"launchDefault.png"]]];
        return NO;
    }
    return NO;
}

/*
 *	@brief	顺时针旋转90°
 *
 *	@param 	v 	要旋转的View
 */
- (void)transFormclockwise:(UIView *)v
{
    //创建一个CGAffineTransform  transform对象
    //设置旋转度数
    CGAffineTransform  transform = CGAffineTransformRotate(v.transform,M_PI/2.0);
    //动画开始
    [UIView beginAnimations:@"rotate" context:nil ];
    //动画时常
    [UIView setAnimationDuration:.3];
    //添加代理
    [UIView setAnimationDelegate:self];
    //获取transform的值
    [v setTransform:transform];
    //关闭动画
    [UIView commitAnimations];
}

/**
 *	@brief	逆时针旋转90°
 *
 *	@param 	v 	要旋转的View
 */
- (void)transFormCounterClockwise:(UIView *)v{
    //创建一个CGAffineTransform  transform对象
    //设置旋转度数
    CGAffineTransform  transform = CGAffineTransformRotate(v.transform,-M_PI/2.0);
    //动画开始
    [UIView beginAnimations:@"rotate" context:nil ];
    //动画时常
    [UIView setAnimationDuration:.3];
    //添加代理
    [UIView setAnimationDelegate:self];
    //获取transform的值
    [v setTransform:transform];
    //关闭动画
    [UIView commitAnimations];
}

- (BOOL)isTraditionUser {
    BOOL isTradition = NO;
    if (![self isBlank:[self getDefaultValuebyKey:ISTradtionUser]] && [[self getDefaultValuebyKey:ISTradtionUser] isEqualToString:@"1"]) {
        isTradition = YES;
    } else {
        isTradition = NO;
    }
    return isTradition;
}

//屏幕适配
#pragma mark - 屏幕尺寸的适配
- (CGFloat) getSize:(CGFloat)size {
    
    CGFloat heigth =[UIScreen mainScreen].bounds.size.height;
    float zoom = 1.0f;
    if (heigth == 480) {
        //iPhone6 Plus 逻辑分辨率 414*736
        zoom = (float)480/568;
    }else if (heigth == 568) {
        //iPhone6  逻辑分辨率 375*667
        zoom = (float)568/568;
    }else if (heigth == 667) {
        //iPhone5S 逻辑分辨率 320*568
        zoom = (float)667/568;
    }else if (heigth == 736) {
        //iPhone 4/4S
        zoom = (float)736/568;
    }
    
    return size * zoom;
}

@end
