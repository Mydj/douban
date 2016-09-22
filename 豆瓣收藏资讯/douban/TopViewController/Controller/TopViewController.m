//
//  TopViewController.m
//  douban
//
//  Created by apple on 16/3/4.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import "TopViewController.h"
#import "TopModel.h"
#import "CollectionCell.h"


#define kItemWidth 100
#define kItem 3
#define kItemHeight 160

@interface TopViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


//创建collectionView
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
//创建布局条件
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

//创建可变数组
@property (strong,nonatomic) NSMutableArray *dataArr;
@end

@implementation TopViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.加载数据
    [self _loadData];
    
    //2.创建UI
    [self _createUI];
    

    
    self.title = @"top";
 

    
}



-(void)_createUI {
    
    _flowLayout.itemSize = CGSizeMake(kItemWidth, kItemHeight);
}

-(void)_loadData {
    
    _dataArr = [NSMutableArray array];
    
    NSDictionary *jsonDic = [DataService loadData:top250];
    NSArray * jsonArr = jsonDic[@"subjects"];
    
    for (NSDictionary * dic in jsonArr)
    {
        TopModel * model = [[TopModel alloc] init];
        
        //获取标题
        model.title = dic[@"title"];
        //获取图片
        model.images = dic[@"images"];
        //获取评分
        model.ratingDic = dic[@"rating"];
        
        [_dataArr addObject:model];
        
    }
}


#pragma mark ---UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _dataArr.count;
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCellID" forIndexPath:indexPath];
    
    cell.model = _dataArr[indexPath.row];
    
    return cell;
}



//选中单元格事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
  
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewControllerID"];
    //隐藏标签栏
    vc.hidesBottomBarWhenPushed = YES;

    [self.navigationController pushViewController:vc animated:YES];

    
    
    
//    
//    if (self.currentItem == indexPath.item)
//    {
//        PosterCell * cell  = (PosterCell *)[collectionView cellForItemAtIndexPath:indexPath];
//        [cell filpCell];
//    }else
//    {
//        //让单元格选中居中显示
//        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
//    }
//    self.currentItem = indexPath.row;
}



@end
