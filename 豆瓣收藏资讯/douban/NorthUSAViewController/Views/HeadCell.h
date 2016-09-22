//
//  HeadCell.h
//  douban
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NorthModel;
@interface HeadCell : UICollectionViewCell

{
    
    //显示图片
    UIImageView *_imgView;
    

    
}

@property (copy,nonatomic) NorthModel *model;


@end
