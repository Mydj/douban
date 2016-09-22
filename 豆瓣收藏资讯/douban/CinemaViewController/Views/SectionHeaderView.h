//
//  SectionHeaderView.h
//  douban
//
//  Created by apple on 16/3/13.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionHeaderView : UITableViewHeaderFooterView

//组头城市
@property (weak,nonatomic,readonly) UIControl *cityCtr;

//组头城市名
@property (weak,nonatomic,readonly) UILabel *cityLabel;

@end
