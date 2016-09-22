//
//  WordController.m
//  douban
//
//  Created by apple on 16/3/6.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import "WordController.h"

@interface WordController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WordController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"新闻";
    //设置代理对象
    _webView.delegate = self;
    //使用
    //加载界面
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    self.tabBarController.hidesBottomBarWhenPushed = YES;
    
    //加载数据
    [self.webView loadRequest:request];


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
