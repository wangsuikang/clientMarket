//
//  AppDelegate.m
//  ClientMarket
//
//  Created by etlfab on 17/1/3.
//  Copyright © 2017年 etlfab. All rights reserved.
//

#import "AppDelegate.h"
#import "XYTabBarViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] init];
    self.window.frame = [UIScreen mainScreen].bounds;
    
    XYTabBarViewController *tabBarViewController = [[XYTabBarViewController alloc] init];
    [tabBarViewController.tabBar setBackgroundImage:[UIImage imageNamed:@"tapbar_top_line"]];
    //
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 5, self.window.frame.size.width, 44)];
    backView.backgroundColor = [UIColor whiteColor];
    [tabBarViewController.tabBar insertSubview:backView atIndex:0];
    tabBarViewController.tabBar.opaque = YES;
    
    self.window.rootViewController =tabBarViewController;
    //4.显示窗口
    [self.window makeKeyAndVisible];


    return YES;
}

- (void)setupGlobalConfig {
    [[UINavigationBar appearance] setBarTintColor:[UIColor orangeColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : [UIFont systemFontOfSize:18]}];
    // 设置tabBarItem的颜色
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor orangeColor], NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
