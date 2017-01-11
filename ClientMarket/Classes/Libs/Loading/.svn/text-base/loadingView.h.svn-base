//
//  loadingView.h
//  TestWebView
//
//  Created by 赵光超 on 14-8-15.
//  Copyright (c) 2014年 zgcrichard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface loadingView : UIView

@property (nonatomic,retain) UIImageView *imageView;
@property (nonatomic,assign) int index;
@property (nonatomic,retain) NSTimer *time;
@property (nonatomic,retain) UIView *viewBottom;
@property (nonatomic,retain) UIView *viewCover;

+ (loadingView*)sharedView ;
+ (void)hudShow;
+ (void)hudHide;
/**
 *	@brief	展现
 */
- (void)loadingShow;
/**
 *	@brief	隐藏
 */
- (void)loadingHide;

@end
