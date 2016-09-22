//
//  PosterView.h
//  douban
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PosterView : UIView


//从NorthViewController里面获取数据
@property (strong,nonatomic)NSArray *data;

//尾部视图
@property (nonatomic,copy) UILabel *footLaber;

@end
