//
//  ImageCell.m
//  douban
//
//  Created by apple on 16/3/8.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import "ImageCell.h"
#import "ImageModel.h"

@implementation ImageCell


-(void)awakeFromNib {
    [super awakeFromNib];
    //设置圆角
    self.layer.cornerRadius = 10;
    
}

-(void)setModel:(ImageModel *)model {
    
    _model = model;
    [_photoView sd_setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:[UIImage imageNamed:@"pig"]];
    
}

@end
