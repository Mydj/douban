//
//  PhotoFlowLayout.m
//  douban
//
//  Created by apple on 16/3/8.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import "PhotoFlowLayout.h"

@implementation PhotoFlowLayout

-(instancetype)init {
    
    self = [super init];
    if (self) {
        
        //设置布局  水平滑动
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        self.minimumLineSpacing = 0;
        
        //
        self.itemSize = CGSizeMake(kScreenWidth, kScreenHeight - 64);
        
    }
    return self;
}

@end
