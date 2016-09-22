//
//  CinemaCell.m
//  douban
//
//  Created by apple on 16/3/12.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import "CinemaCell.h"
#import "CinemaModel.h"
@implementation CinemaCell


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



-(void)setModel:(CinemaModel *)model {
    
    _model = model;
    _nameLabel.text = model.name;
    _addressLabel.text = model.address;
    _ratingLabel.text = model.grade;
    _priceLabel.text = [NSString stringWithFormat:@"$%@",_model.lowPrice];
    _distanceLabel.text = @"1km";
    
    if ([model.isSeatSupport integerValue] == 1) {
        
        _seatImgView.hidden = NO;
    }else {
        
        _seatImgView.hidden = YES;
    }
    if ([model.isCouponSupport integerValue] == 1) {
        
        _groupImgView.hidden = NO;
        
    }else {
        
        _groupImgView.hidden = YES;
    }
    
}
@end
