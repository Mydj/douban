//
//  ImageViewController.m
//  douban
//
//  Created by apple on 16/3/6.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import "ImageViewController.h"
#import "ImageModel.h"
#import "ImageCell.h"
#import "PhotoViewController.h"

//宏定义cell的高度和宽度  一行cell的个数
#define KItemWidth 70
#define KItemHeight 70
#define KItemCount  4

//宏定义间隔 的最小值  设置的小一点
#define KItemSpace (kScreenWidth -KItemWidth*KItemCount) / (KItemCount+5)

@interface ImageViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    
    UICollectionView *_collectionView;
    NSMutableArray *_dataArr;
}
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;


@end
@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //加载数据
    [self _loadData];
    
    //创建UI
    [self _createUI];
    
}
-(void)_createUI {
    
    //设置cell的大小
    self.flowLayout.itemSize = CGSizeMake(KItemWidth, KItemHeight);
    //设置间距
    //横向间距
    self.flowLayout.minimumLineSpacing = KItemSpace;
    //纵向间距
    self.flowLayout.minimumInteritemSpacing = KItemSpace;
    
    //设置距离
//    self.flowLayout.sectionInset = UIEdgeInsetsMake(KItemSpace, KItemSpace, 0, KItemSpace);
    
}


-(void)_loadData {
    
    NSArray *arr = [DataService loadData:image_list];
    _dataArr = [NSMutableArray arrayWithCapacity:arr.count];
    
    for (NSDictionary *dic in arr) {
        
        ImageModel *model = [[ImageModel alloc] init];
        
        model.imageid = [dic[@"id"] integerValue];
        model.image = dic[@"image"];
        model.type = [dic[@"type"] integerValue];
        
        [_dataArr addObject:model];
    }
    
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _dataArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImageCell" forIndexPath:indexPath];
    cell.model = _dataArr[indexPath.row];
    
    return cell;
}


//选中cell方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PhotoViewController *photoVc = [[PhotoViewController alloc] init];
    //把当前选中的cell的IndexPath传入
    photoVc.selectionIndexpath = indexPath;
    
    NSMutableArray *newArr = [NSMutableArray arrayWithCapacity:_dataArr.count];
    
    for (ImageModel *model in _dataArr) {
        
        [newArr addObject:model.image];
    }
    
    photoVc.imageUrl = newArr;
    [self.navigationController pushViewController:photoVc animated:YES];
}

@end
