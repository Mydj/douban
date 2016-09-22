//
//  USACell.h
//  douban
//
//  Created by apple on 16/3/5.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StarView;
@class  NorthModel;
@interface USACell : UITableViewCell
{

    __weak IBOutlet StarView *starView;
    __weak IBOutlet UIImageView *imgView;
    
    __weak IBOutlet UILabel *titleLabel;
    __weak IBOutlet UILabel *ratingLabel;
    __weak IBOutlet UILabel *yearLabel;
}

@property (strong,nonatomic)NorthModel *model;

@end
