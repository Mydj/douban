//
//  SectionHeaderView.m
//  douban
//
//  Created by apple on 16/3/13.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import "SectionHeaderView.h"

#define kSectionHeaderHeight 35

@implementation SectionHeaderView

//重写init id 方法
-(instancetype) initWithReuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        
        //创建UI
        [self _createUI];
    }
    return self;
}

-(void)_createUI {
    
    //组头城市
    UIControl *ctr = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kSectionHeaderHeight)];
    ctr.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"hotMovieBottomImage"]];
    _cityCtr = ctr;
    [self addSubview:_cityCtr];
    
    //组头城市名
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, (kSectionHeaderHeight-21)/2, kScreenWidth, 21)];
    label.font = [UIFont systemFontOfSize:13];
    label.textColor = [UIColor colorWithWhite:0.9 alpha:1];
    label.backgroundColor = [UIColor clearColor];
    _cityLabel = label;
    [self addSubview:_cityLabel];
    
}


@end
