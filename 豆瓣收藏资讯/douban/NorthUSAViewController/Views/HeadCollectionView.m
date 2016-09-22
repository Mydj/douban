//
//  HeadCollectionView.m
//  douban
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import "HeadCollectionView.h"
#import "HeadCell.h"

@implementation HeadCollectionView
{
    
    NSString *identify;

}


-(instancetype)initWithFrame:(CGRect)frame {
    
    //创建一个布局对象
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    //设置方向
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self = [super initWithFrame:frame collectionViewLayout:flowLayout];
    if (self) {
        
        self.delegate = self;
        self.dataSource = self;
        
        flowLayout.minimumLineSpacing = 0;
        
        //不能实现
        //     self.pagingEnabled = YES;
        
        //item大小
        flowLayout.itemSize = CGSizeMake(60, self.frame.size.height);
        
        identify = @"identify";
        //注册
        [self registerClass:[HeadCell class] forCellWithReuseIdentifier:identify];
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _data.count;
}
-(void)setData:(NSArray *)data {
    
    _data = data;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    HeadCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor grayColor];
    
    cell.model = _data[indexPath.row];
    
    return cell;
}


-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    //获取cell的位置
    CGFloat X = (CGRectGetWidth(self.frame)-_pageWith)/2;
    
    return UIEdgeInsetsMake(0, X, 0, X);
}

//手指离开屏幕时
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    
    NSLog(@"targetContentOffset->x = %f",targetContentOffset->x);
    //目标偏移量
    NSInteger index = (targetContentOffset->x + _pageWith /2)/_pageWith;
    targetContentOffset->x = index * _pageWith;

    self.currentItem = index;
}

@end
