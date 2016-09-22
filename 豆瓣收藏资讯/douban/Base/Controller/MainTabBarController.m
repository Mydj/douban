//
//  MainTabBarController.m
//  douban
//
//  Created by apple on 16/3/4.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import "MainTabBarController.h"
#import "TabBarItem.h"

@interface MainTabBarController ()
{
    //创建选中按钮
    UIImageView * _selectImgView;
    
    
}

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //设置导航栏背景
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"nav_bg_all-64"] forBarMetrics:UIBarMetricsDefault];
    
    
    //加载stroyboard
    [self _loadStroyboard];
   

}

- (void)_loadStroyboard{

    //加载自定义的Stroyboard
    UIStoryboard * north = [UIStoryboard storyboardWithName:@"NorthUSA" bundle:nil];
    UIStoryboard * news = [UIStoryboard storyboardWithName:@"News" bundle:nil];
    UIStoryboard * top = [UIStoryboard storyboardWithName:@"Top" bundle:nil];
    UIStoryboard * cinema = [UIStoryboard storyboardWithName:@"Cinema" bundle:nil];
    UIStoryboard * more = [UIStoryboard storyboardWithName:@"More" bundle:nil];
    
//    [north instantiateInitialViewController];
    
//    self.viewControllers =
    
    NSArray *viewCtrs = @[
                          [north instantiateInitialViewController],
                          [news instantiateInitialViewController],
                          [top instantiateInitialViewController],
                          [cinema instantiateInitialViewController],
                          [more instantiateInitialViewController]
                          ];
    
    self.viewControllers = viewCtrs;
    
}



- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
     [self _createTabBar];
}


//设置tabBar 移除 Item
- (void)_createTabBar
{
    //1:隐藏item
    for (UIView * view  in self.tabBar.subviews)
    {
//        NSLog(@"%@",view);
//        UITabBarButton
        //取UITabBarButton得类对象
        Class cls  = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:cls])
        {
            [view removeFromSuperview];
        }
    }
    //2:设计背景
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tab_bg_all"]];
    
    
    //3:设置自定义按钮
    NSArray * imgArr = @[
                         @"movie_home.png",
                         @"msg_new.png",
                         @"start_top250.png",
                         @"icon_cinema.png",
                         @"more_setting.png"
                         ];
    
    NSArray *titleArr = @[
                          @"北美榜",
                          @"新闻",
                          @"Top",
                          @"电影",
                          @"更多"
                          ];
    

    //创建选中按钮
    _selectImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 45)];
    _selectImgView.image = [UIImage imageNamed:@"selectTabbar_bg_all1"];
    [self.tabBar addSubview:_selectImgView];
    
    //指定按钮的宽高
    CGFloat width = kScreenWidth / imgArr.count;
    CGFloat heigth = CGRectGetHeight(self.tabBar.frame);
    
    
    for (int i = 0; i < imgArr.count; i++)
    {
        NSString * imgName = imgArr[i];
        NSString * titleName = titleArr[i];
    
        
        //创建
        TabBarItem * item = [[TabBarItem alloc] initWithFrame:CGRectMake(i*width, 0, width, heigth) imageName:imgName titleName:titleName];
        //为每个Item添加点击事件
        item.tag = 100 + i;
        [item addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.tabBar addSubview:item];
        
        if (i == 0) {
            _selectImgView.center = item.center;
        }
        
    }
    
}

//点击方法
- (void)clickItem:(TabBarItem *)item{
    
//    NSLog(@"--item.tag=%li",item.tag);
    self.selectedIndex = item.tag  - 100;
    
    [UIView animateWithDuration:0.2 animations:^{
        _selectImgView.center = item.center;
        
    }];
    
}

@end
















