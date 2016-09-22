//
//  ChangeViewController.m
//  douban
//
//  Created by apple on 16/3/13.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import "ChangeViewController.h"
#import "MainTabBarController.h"

@interface ChangeViewController ()<UIScrollViewDelegate>

@end

@implementation ChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self _createUI];

}

-(void)_createUI {
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    //设置属性
    scrollView.contentSize = CGSizeMake(kScreenWidth * 4, kScreenHeight);
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    
    scrollView.delegate = self;
    
    for (int i = 0 ; i < 4; i++) {
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth * i, 0, kScreenWidth, kScreenHeight)];
        
        imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i+1]];
        
        [scrollView addSubview:imgView];
    }
    [self.view addSubview:scrollView];
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    if (scrollView.contentOffset.x == kScreenWidth * 3) {
        
        MainTabBarController *tabCtr = [[MainTabBarController alloc] init];
        
        [UIView transitionWithView:self.view.window
                          duration:1
                           options:UIViewAnimationOptionTransitionFlipFromLeft
                        animations:^{
                            
                            self.view.window.rootViewController = tabCtr;
                            
                        }
                        completion:nil];
    }
    
}

@end
