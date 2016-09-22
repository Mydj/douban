//
//  CollectionCell.h
//  douban
//
//  Created by apple on 16/3/11.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StarView.h"


@class TopModel;
@interface CollectionCell : UICollectionViewCell



@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet StarView *ratingView;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;

@property (nonatomic,strong) TopModel *model;

@end
