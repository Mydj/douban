//
//  NavigationController.m
//  douban
//
//  Created by apple on 16/3/5.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //设置字体的颜色
    NSDictionary *textArr = @{
                              NSForegroundColorAttributeName:[UIColor whiteColor]
                              };
    self.navigationBar.titleTextAttributes = textArr;
}

//设置状态栏的颜色
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end
