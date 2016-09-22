//
//  NewsCell.h
//  douban
//
//  Created by apple on 16/3/6.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NewsModel;
@interface NewsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (weak, nonatomic) IBOutlet UIImageView *typeView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;


@property (strong,nonatomic)NewsModel * model;
@end
