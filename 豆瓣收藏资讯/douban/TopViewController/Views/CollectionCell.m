//
//  CollectionCell.m
//  douban
//
//  Created by apple on 16/3/11.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import "CollectionCell.h"
#import "TopModel.h"
#import "StarView.h"

@implementation CollectionCell

-(void)setModel:(TopModel *)model {
    
    _model = model;
    
    //显示数据
    NSString *imgStr = [_model.images objectForKey:@"medium"];
    
    [_imgView sd_setImageWithURL:[NSURL URLWithString:imgStr] placeholderImage:[UIImage imageNamed:@"pig"]];
    
    //显示标题
    _titleLabel.text = model.title;
    //处理评分
    NSNumber *ratingNum = [model.ratingDic objectForKey:@"average"];
    _ratingLabel.text = [NSString stringWithFormat:@"%.1f",[ratingNum floatValue]];
    
    //星星
    _ratingView.rating  = [ratingNum floatValue];
    
}



@end
