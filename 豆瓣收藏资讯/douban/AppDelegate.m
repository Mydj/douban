//
//  AppDelegate.m
//  douban
//
//  Created by apple on 16/3/4.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import "AppDelegate.h"
#import "MainTabBarController.h"
#import "ChangeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 创建window
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    //设置self.window为keywindows并显示
    [self.window makeKeyAndVisible];
  
    
//    MainTabBarController *mainTabBar = [[MainTabBarController alloc] init];
    
    BOOL flage = [[NSUserDefaults standardUserDefaults] boolForKey:KFirstStart];
    
    //不是第一次进入
    if (flage) {
        
        self.window.rootViewController = [[MainTabBarController alloc] init];
    }else {
        
        //滑动页面
        self.window.rootViewController = [[ChangeViewController alloc] init];
        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:KFirstStart];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
    }
    
    
    
    
    
    return YES;
}

@end
