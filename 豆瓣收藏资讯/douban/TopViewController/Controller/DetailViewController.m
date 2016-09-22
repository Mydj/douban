//
//  DetailViewController.m
//  douban
//
//  Created by apple on 16/3/11.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailModel.h"
#import "DetailHeaderView.h"
#import "CommentModel.h"
#import "CommentCell.h"

@interface DetailViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
    DetailHeaderView *_headerView;
    NSMutableArray *_dataArr;
    NSIndexPath *_selectIndexPath;
    __weak IBOutlet UITableView *tabelView;
    
}
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

  
    //1.创建UI
    [self _createUI];
    
    //2.加载数据
    [self _loadData];
    
    tabelView.rowHeight = 100;
    
    

}
//
-(void)_loadData {
    
    
    NSDictionary *jsonDic = [DataService loadData:movie_detail];

    DetailModel * model = [[DetailModel alloc] init];
        
    //获取标题
    model.titleCn = jsonDic[@"titleCn"];
    model.titleEn = jsonDic[@"titleEn"];
    //获取图片
    model.image = jsonDic[@"image"];
    model.content = jsonDic[@"content"];
    model.videos = jsonDic[@"videos"];
        
    _headerView.model = model;

    
    //处理评论的数据
    _dataArr = [NSMutableArray array];
    NSDictionary *commentJsonDic = [DataService loadData:movie_comment];
    NSArray *list = commentJsonDic[@"list"];
    for (NSDictionary *dic in list) {
        
        CommentModel *model1 = [[CommentModel alloc] init];
        model1.userImage = dic[@"userImage"];
        model1.nickName = dic[@"nickname"];
        model1.rating = dic[@"rating"];
        model1.content = dic[@"content"];
        
        [_dataArr addObject:model1];
        
    }
    
    
    
}

//选中事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (![_selectIndexPath isEqual:indexPath]) {
        
        _selectIndexPath = indexPath;
        
        //
        [tabelView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
    }
}


//返回cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([_selectIndexPath isEqual:indexPath]) {
        
        //获取数据
        CommentModel *model = _dataArr[indexPath.row];
        
        //设置字体大小
        NSDictionary *arrDic = @{
                                 NSFontAttributeName : [UIFont systemFontOfSize:13]
                                 };
        
        //返回一个frame
        CGRect frame = [model.content boundingRectWithSize:CGSizeMake(kScreenWidth-120, 200)
                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                attributes:arrDic
                                                   context:nil];
        CGFloat height = frame.size.height+40;
        return height;
    }else {
        
        return 100;
    }
}

-(void)_createUI {
    
    _headerView = [[[NSBundle mainBundle] loadNibNamed:@"DetailHeaderView" owner:self options:nil]lastObject];
    
    tabelView.tableHeaderView = _headerView;
    
    //注册cell
    [tabelView registerNib:[UINib nibWithNibName:@"CommentCell" bundle:nil] forCellReuseIdentifier:@"CommentCellID"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    CommentCell *cell = [tabelView dequeueReusableCellWithIdentifier:@"CommentCellID" forIndexPath:indexPath];
    cell.model = _dataArr[indexPath.row];
    
    return cell;
}


@end
