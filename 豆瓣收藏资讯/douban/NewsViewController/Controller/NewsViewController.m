//
//  NewsViewController.m
//  douban
//
//  Created by apple on 16/3/4.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsModel.h"
#import "NewsCell.h"

@interface NewsViewController () <UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *_dataArr;
    
    
    //背部的头视图
    UIImageView * imgView;
}
@property (weak, nonatomic) IBOutlet UITableView *tbView;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title =  @"新闻";
    
    
    //1:加载数据
    [self _loadData];
    
    //2:创建UI
    [self _createUI];
    
    _tbView.rowHeight = 120;
}


//加载数据
- (void)_loadData
{
    
    NSArray * jsonArr = [DataService loadData:news_list];
    
    _dataArr = [NSMutableArray arrayWithCapacity:jsonArr.count];
    
    for (NSDictionary * dic in jsonArr)
    {
        NewsModel * model = [[NewsModel alloc] init];
        
        model.title = dic[@"title"];
        model.summary = dic[@"summary"];
        model.newsid = [dic[@"newsid"] integerValue];
        model.image = dic[@"image"];
        model.type = (NewsType)[dic[@"type"] integerValue];
        
        
        [_dataArr addObject:model];
        
    }
    
    
}

//2:创建UI
- (void)_createUI
{
    //获取数组里面的model
    NewsModel * model = _dataArr[0];
    [_dataArr removeObjectAtIndex:0];
    
    
    //创建头视图的背景
    imgView = [[UIImageView alloc] init];
    imgView.frame = CGRectMake(0, 64, kScreenWidth, 150);
    [imgView sd_setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:[UIImage imageNamed:@"pig"]];
    
    //把imgView 放到headerView 下面
    [self.view insertSubview:imgView belowSubview:_tbView];
    
    
    _tbView.backgroundColor = [UIColor clearColor];
    //
    UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 150)];
    headerView.backgroundColor = [UIColor clearColor];
    _tbView.tableHeaderView = headerView;
    
    
}

#pragma  mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * cellID = @"cellID";
    NewsCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        //获取xib
        cell  = [[[NSBundle mainBundle] loadNibNamed:@"NewsCell" owner:self options:nil]lastObject];
    }
    
    //传输数据
    cell.model = _dataArr[indexPath.row];
    
    
    return cell;
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat y = scrollView.contentOffset.y;
    
    if (y<0) { //往下滑
        CGFloat width = (150-y)/150  * [UIScreen mainScreen].bounds.size.width;
        CGFloat heigth = 150 -y ;
        imgView.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width-width)/2, 64, width, heigth);
        
    }else{
        imgView.frame = CGRectMake(0, -y+64, [UIScreen mainScreen].bounds.size.width, 150);
    }

}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //获取行里面的信息
    NewsModel *model = _dataArr[indexPath.row];
    //
    NSString *viewCtrID = nil;
    //获取的是文字还是图片
    int type = model.type;
    //是文字
    if (type == WordType) {
        
        viewCtrID = @"WordControllerID";
    }else if (type == ImgType) {
        
        viewCtrID = @"ImageViewControllerID";
    }else {
        
        return;
    }
    
    //根据ID获取视图控制器
    UIViewController *viewCtr = [self.storyboard instantiateViewControllerWithIdentifier:viewCtrID];
    
    //隐藏tabBar
    viewCtr.hidesBottomBarWhenPushed = YES;
    
    //push
    [self.navigationController pushViewController:viewCtr animated:YES];
}


@end
