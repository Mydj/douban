//
//  TabBarItem.m
//  douban
//
//  Created by apple on 16/3/4.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import "TabBarItem.h"

@implementation TabBarItem

//- (id)initWithFrame:(CGRect)frame


- (id)initWithFrame:(CGRect)frame imageName:(NSString *)name titleName:(NSString *)title{
    
    self  = [super initWithFrame:frame];
    if (self) {
        
        //1:创建子视图
        UIImageView * imgView = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width-20)/2, 5, 20, 20)];
        imgView.image = [UIImage imageNamed:name];
        
        //设置使用原图
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self addSubview:imgView];
        
        
        //2:创建标题视图
        //获取imageView的坐标的MAX Y 值
        CGFloat maxY = CGRectGetMaxY(imgView.frame);
        //
        
        
        UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, maxY,frame.size.width, 20)];
        titleLabel.text = title;
//        titleLabel.backgroundColor = [UIColor grayColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.font = [UIFont systemFontOfSize:11];
        
        [self addSubview:titleLabel];
        
        
    }
    return self;
}

@end
