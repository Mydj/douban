//
//  PhotoViewController.h
//  douban
//
//  Created by apple on 16/3/8.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import "BaseViewController.h"

@interface PhotoViewController : BaseViewController

//获取所有图片
@property (strong,nonatomic) NSArray *imageUrl;

//获取点击的cell
@property (strong,nonatomic) NSIndexPath *selectionIndexpath;
@end
