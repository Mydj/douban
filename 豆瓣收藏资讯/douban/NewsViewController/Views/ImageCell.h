//
//  ImageCell.h
//  douban
//
//  Created by apple on 16/3/8.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ImageModel;
@interface ImageCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (strong,nonatomic) ImageModel *model;

@end
