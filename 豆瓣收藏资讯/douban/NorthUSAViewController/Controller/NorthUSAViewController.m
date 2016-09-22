//
//  NorthUSAViewController.m
//  douban
//
//  Created by apple on 16/3/4.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import "NorthUSAViewController.h"
#import "NorthModel.h"
#import "USACell.h"
#import "PosterView.h"



@interface NorthUSAViewController () <UITableViewDelegate,UITableViewDataSource>
{
    //创建TabView
    UITableView *_tbView;
    
    
    //创建海报视图
    PosterView * _posterView;
    
    
    //全局数组 获取json 数据
    NSMutableArray * _dataArr;
}

@end

@implementation NorthUSAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"北美榜";
    
    //1:创建导航栏的右边的翻转
    [self _loadNavigationItem];
    
    //2:创建tbVeiw
    [self _loadTableView];
    //3:创建posterView
    [self _loadPosterView];
    
    
    //4:获取数据
    [self _loadJson];
    
    _tbView.rowHeight = 120;
    
//    self.automaticallyAdjustsScrollViewInsets = YES;
    
    
    //设置导航栏上部默为不通明
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    
    
}


//加载数据
- (void)_loadJson{
    _dataArr = [[NSMutableArray alloc] init];
    
    NSString * filePath = [[NSBundle mainBundle] pathForResource:@"us_box" ofType:@"json"];
    //转成二进制
    NSData * data = [NSData dataWithContentsOfFile:filePath];
    
    id  dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
    
    
    NSArray * subjects = dic[@"subjects"];
    
    for (NSDictionary * jsonDic in subjects)
    {
        NorthModel * model = [[NorthModel alloc] init];
        
        NSDictionary * subject = jsonDic[@"subject"];
        NSDictionary * rating = subject[@"rating"];
        model.rating = rating;
        
        //获取标题
        model.title = subject[@"title"];
        
        
        //获取年份
        model.year = subject[@"year"];
        
        
        //原始的标题
        model.original_title = subject[@"original_title"];
        
        
        //url
        model.images = subject[@"images"];
        
        
        [_dataArr addObject:model];
    }
    
    _posterView.data = _dataArr;
    
}

- (void)_loadNavigationItem{

    //1:翻转的父视图
    UIView * buttonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];

    //2:创建右侧的两个Button
    UIButton * button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = buttonView.bounds;
    [button1 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    [button1 setImage:[UIImage imageNamed:@"list_home"] forState:UIControlStateNormal];
    //添加点击事件
    [button1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    button1.tag = 200;
    
    [buttonView addSubview:button1];
    
    UIButton * button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = buttonView.bounds;
    button2.hidden = YES;
    [button2 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    [button2 setImage:[UIImage imageNamed:@"poster_home"] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    button2.tag = 201;
    
    [buttonView addSubview:button2];
    
    
    //把父视图添加到导航栏的右边
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:buttonView];
    
    self.navigationItem.rightBarButtonItem  = rightItem;
}


//创建tbView
- (void)_loadTableView{
    _tbView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    _tbView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    
    //设置代理对象
    _tbView.delegate = self;
    _tbView.dataSource = self;
    
    [self.view addSubview:_tbView];
}


//创建海报视图
- (void)_loadPosterView{
    _posterView = [[PosterView alloc] initWithFrame:CGRectMake(0, -110, kScreenWidth, kScreenHeight)];
    _posterView.backgroundColor = [UIColor orangeColor];
    _posterView.hidden = YES;
    [self.view insertSubview:_posterView atIndex:0];
}



//点击事件
- (void)buttonAction:(UIButton *)button{
    
    //获取buttonView
    UIView * buttonView = self.navigationItem.rightBarButtonItem.customView;
    
    UIButton * button1 = (UIButton *)[buttonView viewWithTag:200];
     UIButton * button2 = (UIButton *)[buttonView viewWithTag:201];
    
    //状态取反
    button1.hidden = ! button1.hidden;
    button2.hidden = ! button2.hidden;
    
    _tbView.hidden = !_tbView.hidden;
    _posterView.hidden =! _posterView.hidden;
    
    //选择选择的方向
    [self flip:buttonView left:button1.hidden];
    [self flip:self.view left:button1.hidden];
  
}


//把代码抽出来 实现翻转
- (void)flip:(UIView *)forView left:(BOOL)flag{

    //判断翻转的方向
    UIViewAnimationOptions filp = flag?
UIViewAnimationOptionTransitionFlipFromLeft:
    UIViewAnimationOptionTransitionFlipFromRight;
    
    //
    [UIView transitionWithView:forView duration:0.3
                       options:filp
                    animations:^{
                        [forView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
                    } completion:NULL];

}


#pragma  mark -- 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellID = @"cellID";
    
    USACell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        //加载xib
        cell = [[[NSBundle mainBundle] loadNibNamed:@"USACell" owner:self options:nil] lastObject];
        
    }
    
    cell.model = _dataArr[indexPath.row];
    
    return cell;
}




- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 115;
}

@end
