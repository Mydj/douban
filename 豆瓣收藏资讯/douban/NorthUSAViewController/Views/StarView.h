//
//  StarView.h
//  douban
//
//  Created by apple on 16/3/6.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarView : UIView
{
    //金星
    UIView * _yellowView;
//    //灰星
    UIView * _grayView;
//
}

@property (assign,nonatomic)CGFloat rating; //评分

@end
