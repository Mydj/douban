//
//  CinemaCell.h
//  douban
//
//  Created by apple on 16/3/12.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CinemaModel;
@interface CinemaCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *seatImgView;
@property (weak, nonatomic) IBOutlet UIImageView *groupImgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;

@property (nonatomic,strong) CinemaModel *model;

@end
