//
//  HeadCollectionView.h
//  douban
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeadCollectionView : UICollectionView<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

//设置一页的宽度
@property (nonatomic,assign) CGFloat pageWith;

//从PosterView获取数据
@property (strong,nonatomic)NSArray *data;


//当前视图的页数
@property (nonatomic,assign) NSInteger currentItem;


@end
