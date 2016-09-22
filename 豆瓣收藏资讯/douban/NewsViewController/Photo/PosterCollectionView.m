//
//  PosterCollectionView.m
//  douban
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import "PosterCollectionView.h"
#import "PosterCell.h"

@implementation PosterCollectionView
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
        flowLayout.itemSize = CGSizeMake(220, self.frame.size.height);
        
        identify = @"identify";
        //注册
        [self registerClass:[PosterCell class] forCellWithReuseIdentifier:identify];
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
    
    PosterCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    
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
    
    //设置界面
    if (index == _currentItem) {
        
        //向右滑动,快速的滑动块的话,直接到下一页
        if (velocity.x > 0.4)
        {
            index++;
        }else if (velocity.x < -0.4)
        {
            index--;
        }
    }
    
    targetContentOffset->x = index * _pageWith;
    
    self.currentItem = index;
    
}

//选中单元格事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    /*
     PosterCell * cell  = (PosterCell *)[collectionView cellForItemAtIndexPath:indexPath];
     [cell filpCell];
     */
    
    if (self.currentItem == indexPath.item)
    {
        PosterCell * cell  = (PosterCell *)[collectionView cellForItemAtIndexPath:indexPath];
        [cell filpCell];
    }else
    {
        //让单元格选中居中显示
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }
    self.currentItem = indexPath.row;
}

@end
