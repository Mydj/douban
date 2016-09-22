//
//  PhotoView.h
//  douban
//
//  Created by apple on 16/3/8.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoView : UICollectionView <UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (strong,nonatomic) NSArray *dataArr;

@end
