//
//  USACell.m
//  douban
//
//  Created by apple on 16/3/5.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import "USACell.h"
#import "NorthModel.h"
#import "StarView.h"


@implementation USACell

- (void)setModel:(NorthModel *)model{
    _model = model;
    
    //获取标题
    titleLabel.text = model.title;
    yearLabel.text = model.year;
    
    //分数
    NSNumber * rating = model.rating[@"average"];
    ratingLabel.text = [rating stringValue];
    
    //获取分数 显示星星
    starView.rating = [model.rating[@"average"] floatValue];
    
    
    //获取图片
    NSString * imagName = model.images[@"medium"];
    
    //加载图片
    [imgView sd_setImageWithURL:[NSURL URLWithString:imagName] placeholderImage:[UIImage imageNamed:@"pig"]];
    
}



@end
