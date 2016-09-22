//
//  PhotoView.m
//  douban
//
//  Created by apple on 16/3/8.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import "PhotoView.h"
#import "PhotoCell.h"

@implementation PhotoView


-(instancetype) initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        self.delegate = self;
        self.dataSource = self;
        
        //分页
        self.pagingEnabled = YES;
        
        //注册
        [self registerClass:[PhotoCell class] forCellWithReuseIdentifier:@"PhotoCell"];
    }
    return self;
}

#pragma mark  UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _dataArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCell" forIndexPath:indexPath];
    
    cell.imgUrl = _dataArr[indexPath.row];
    
    return cell;
}


@end
