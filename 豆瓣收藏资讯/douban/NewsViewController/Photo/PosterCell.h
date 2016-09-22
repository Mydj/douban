//
//  PosterCell.h
//  douban
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NorthModel;
@interface PosterCell : UICollectionViewCell
{
    
    //显示图片
    UIImageView *_imgView;
    
    //翻转后的图片
    UIView *_detailView;
    
}

@property (copy,nonatomic) NorthModel *model;

//添加翻转功能
-(void)filpCell;


@end
