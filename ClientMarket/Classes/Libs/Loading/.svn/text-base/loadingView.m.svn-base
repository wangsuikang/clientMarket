//
//  loadingView.m
//  TestWebView
//
//  Created by 赵光超 on 14-8-15.
//  Copyright (c) 2014年 zgcrichard. All rights reserved.
//

#import "loadingView.h"

@implementation loadingView
@synthesize imageView;
@synthesize index;
@synthesize time;
@synthesize viewBottom;
@synthesize viewCover;


+ (loadingView*)sharedView {
    static dispatch_once_t once;
    static loadingView *sharedView;
    dispatch_once(&once, ^ { sharedView = [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]]; });
    return sharedView;
}

- (id)initWithFrame:(CGRect)frame
{
//    self = [super initWithFrame:frame];
    self = [super initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    if (self) {
        // Initialization code
        
        [self loadingShow];
        
    }
    return self;
}

- (void)loadStart:(NSTimer *)timeT{
    self.time = timeT;
    self.index++;
    if (self.index==14) {
        self.index = 1;
    }
    imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png",self.index]];
}

+ (void)hudShow
{
    [[loadingView sharedView] loadingShow];
}

+ (void)hudHide
{
    [[loadingView sharedView] loadingHide];
}

/**
 *	@brief	展现
 */
- (void)loadingShow
{
    [self loadingHide];
    //添加底层阴影
    viewBottom = [[UIView alloc] initWithFrame:self.frame];
    viewBottom.backgroundColor = [UIColor colorWithRed:154/255.0f green:154/255.0f blue:154/255.0f alpha:0.2f];
    viewBottom.tag = 111;
    [self addSubview:viewBottom];
    
    //添加imageView
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-120/2)/2, ([UIScreen mainScreen].bounds.size.height-120/2)/2+10, 120/2, 120/2)];
    imageView.contentMode = UIViewContentModeScaleToFill;
    imageView.backgroundColor = [UIColor clearColor];
    [self addSubview:imageView];
    
    //增加遮盖，触碰不到底部
    viewCover = [[UIView alloc] initWithFrame:self.frame];
    viewCover.backgroundColor = [UIColor clearColor];
    viewCover.tag = 222;
    [self addSubview:viewCover];
    
    //开始运转
    self.index = 0;
   self.time = [NSTimer scheduledTimerWithTimeInterval:0.08 target:self selector:@selector(loadStart:) userInfo:nil repeats:YES];
    
    
    NSEnumerator *frontToBackWindows = [[[UIApplication sharedApplication]windows]reverseObjectEnumerator];
    
    for (UIWindow *window in frontToBackWindows){
        if (window.windowLevel == UIWindowLevelNormal) {
            [window addSubview:self];
            break;
        }
    }
}

/**
 *	@brief	隐藏
 */
- (void)loadingHide
{
    if (self.viewBottom.superview) {
        [self.viewBottom removeFromSuperview];
    }
    
    if (self.imageView.superview) {
        [self.imageView removeFromSuperview];
    }
    
    if (self.viewCover.superview) {
        [self.viewCover removeFromSuperview];
    }
    
    UIView *vBottom = (UIView *)[self viewWithTag:111];
    if (vBottom.superview) {
        [vBottom removeFromSuperview];
    }
    
    UIView *vCover = (UIView *)[self viewWithTag:222];
    if (vCover.superview) {
        [vCover removeFromSuperview];
    }
    
    if (self) {
        [self removeFromSuperview];
    }

//    [self removeFromSuperview];
    [self.time invalidate];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
