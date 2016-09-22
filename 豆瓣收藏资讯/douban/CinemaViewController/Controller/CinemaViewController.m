//
//  CinemaViewController.m
//  douban
//
//  Created by apple on 16/3/4.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import "CinemaViewController.h"
#import "CinemaModel.h"
#import "CinemaCell.h"
#import "SectionHeaderView.h"

@interface CinemaViewController () <UITableViewDelegate,UITableViewDataSource>
{
    //每组的状态
    BOOL status[30];
    NSArray *_districtArr;
    NSMutableDictionary *_cinemaDic;
    
}
@property (weak, nonatomic) IBOutlet UITableView *tbView;


@end

@implementation CinemaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置电影标题
    self.navigationItem.title = @"影院";
    
    //1:第一步解析数据
    //2:UI(UITbableView cell)
    //3:逻辑
    [self _loadData];
    [self _createUI];
    
    _tbView.rowHeight = 75;
}
/*
 "lowPrice" : "40.00",
 "grade" : "8.8",
 "coord" : "116.36047,40.01433",
 "distance" : null,
 "address" : "北京市海淀区学清路甲8号，圣熙8号购物中心五层西侧。",
 "name" : "嘉华国际影城",
 "id" : "1396",
 "msg" : null,
 "districtId" : "1015",
 "tel" : "010-82732228",
 "isSeatSupport" : "1",
 "isCouponSupport" : "1",
 "isImaxSupport" : "0",
 "isGroupBuySupport" : "0",
 "circleName" : "五道口"
 */
//加载数据
- (void)_loadData
{
    //district_list.json 用力获取组头的
    //district 地区
    //内容是在哪个区的影院
    NSDictionary * districtDic = [DataService loadData:district_list];
    _districtArr = districtDic[@"districtList"];
    
    //电影信息列表
    _cinemaDic = [NSMutableDictionary dictionary];
    
    NSMutableDictionary *listDic = [DataService loadData:cinema_list];
    NSArray * listArr = listDic[@"cinemaList"];
    
    for (NSDictionary * dic in listArr)
    {
        CinemaModel * model = [[CinemaModel alloc] init];
        //想创建一个key区域的id 对应一个数组 数组里面包含着这个与之对应id的电影院
        
        //1:获取这个影院的所在的地区 id
        NSString * districtId = dic[@"districtId"];
        
        
        //2:判断与之相对应的ID有没有被创建
        NSMutableArray * cinemaArr = [_cinemaDic objectForKey:districtId];
        
        //如何没有被创建
        if (cinemaArr == nil)
        {
            //我们创建一个可变数组
            cinemaArr = [NSMutableArray array];
            
            //把空的可变数组放到对应的districtId字典中
            [_cinemaDic setObject:cinemaArr forKey:districtId];
        }
        
        //获取低价
        model.lowPrice = dic[@"lowPrice"];
        //获取评价
        model.grade = dic[@"grade"];
        //地址
        model.address = dic[@"address"];
        //影院名字
        model.name = dic[@"name"];
        //支持选座
        model.isSeatSupport = dic[@"isSeatSupport"];
        //是否有劵
        model.isCouponSupport = dic[@"isCouponSupport"];
        
        //所在区域的id
        model.districtId = dic[@"districtId"];
        
        [cinemaArr addObject:model];
        
    }
}


//创建UI
- (void)_createUI
{
    //设置tbView 的分割线的颜色
    self.tbView.separatorColor = [UIColor colorWithWhite:0.32 alpha:1];
    //注册一个cell
    [self.tbView registerNib:[UINib nibWithNibName:@"CinemaCell" bundle:nil] forCellReuseIdentifier:@"KCinemaCellID"];
    
}



#pragma mark --  UITableViewDataSource

//返回组数
- (NSInteger )numberOfSectionsInTableView:(UITableView *)tableView
{
    return _districtArr.count;
}

//返回每一组的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (!status[section]) {
        return 0;
    }
    
    //根据组数获取区域 字典
    NSDictionary *dic = _districtArr[section];
    //根据id 获取所在的区域
    NSString * districtID = dic[@"id"];
    //根据id 获取 所对应的字典元素数组
    NSArray * arr =  _cinemaDic[districtID];
    
    return arr.count;
    
    
}

//创建每一个cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CinemaCell * cell  = [tableView dequeueReusableCellWithIdentifier:@"KCinemaCellID" forIndexPath:indexPath];
    //根据组数 获取 某一组的对应的字典
    NSDictionary *dic = _districtArr[indexPath.section];
    //根据key id 获取  所对应的地区的ID
    NSString *districtID = dic[@"id"];
    //根据地区的ID获取 地区所有的影院
    NSArray *arr = _cinemaDic[districtID];
    //根据那一行找到 对应的 cell
    cell.model = arr[indexPath.row];
    
    return  cell;
}

//创建头视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    //创建头视图
    SectionHeaderView * headerView = [_tbView dequeueReusableHeaderFooterViewWithIdentifier:@"kCinemaHeaderFooterViewID"];
    
    if (headerView == nil)
    {
        headerView = [[SectionHeaderView alloc] initWithReuseIdentifier:@"kCinemaHeaderFooterViewID"];
        
        //添加点击事件
        [headerView.cityCtr addTarget:self action:@selector(clickSectionheader:) forControlEvents:UIControlEventTouchUpInside];
    }
    //设置tag值
    headerView.cityCtr.tag = 1000+section;
    
    //获取每组所对应的字典
    NSDictionary *dic = _districtArr[section];
    //设置组标题
    headerView.cityLabel.text = dic[@"name"];
    
    return headerView;
}

//点击头视图调用的方法
-(void)clickSectionheader:(UIControl *)headView
{
    NSInteger section = headView.tag - 1000;
    status[section] = !status[section];
    
    //重新加载指定的部分使用给定的动画效果。
    [self.tbView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationFade];
}

@end
