//
//  StarView.m
//  douban
//
//  Created by apple on 16/3/6.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import "StarView.h"

@implementation StarView

- (void)awakeFromNib
{
        //创建视图
        [self _createView];
}

- (void)_createView
{
    //获取图片
    UIImage * yellowImg = [UIImage imageNamed:@"yellow"];
    UIImage *grayImg = [UIImage imageNamed:@"gray"];
    
    //创建UIView
     _grayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, grayImg.size.width*5, grayImg.size.height)];
    _grayView.backgroundColor = [UIColor colorWithPatternImage:grayImg];
    [self addSubview:_grayView];
    
    _yellowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, yellowImg.size.width*5, yellowImg.size.height)];
    _yellowView.backgroundColor = [UIColor colorWithPatternImage:yellowImg];
    [self addSubview:_yellowView];
    
    
    //view
    //获取view
    CGFloat star5Width = self.frame.size.height * 5;
    //view frame
    CGRect frame = self.frame;
    
    //重设它的宽度
    frame.size.width = star5Width;
    
    //
    self.frame = frame;
    
    
    //view
    CGFloat scale = self.frame.size.height  / yellowImg.size.height;
    
    
    CGAffineTransform t = CGAffineTransformMakeScale(scale, scale);
    _yellowView.transform = t;
    _grayView.transform =t;
    
    //设置原点
    CGRect  f1 = _yellowView.frame;
    CGRect f2 = _grayView.frame;
    
    f1.origin = CGPointZero;
    f2.origin = CGPointZero;
    
    _yellowView.frame = f1;
    _grayView.frame = f2;
    
    
    
    
    
    
    
}

- (void)setRating:(CGFloat)rating
{
    _rating = rating;
    //
    CGFloat s = rating/10.0;
    CGFloat width = s * self.frame.size.width;
    
    CGRect frame = _yellowView.frame;
    frame.size.width = width;
    
    _yellowView.frame = frame;
    
    
}

@end











