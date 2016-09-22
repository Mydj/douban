//
//  NewsCell.m
//  douban
//
//  Created by apple on 16/3/6.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import "NewsCell.h"
#import "NewsModel.h"

@implementation NewsCell

- (void)awakeFromNib {
    // Initialization
}

- (void)setModel:(NewsModel *)model
{
    //model 从NewContr ----> cell _model
    _model = model;
    
    [_imgView sd_setImageWithURL:[NSURL URLWithString:_model.image] placeholderImage:[UIImage imageNamed:@"pig"]];
    
    _titleLabel.text = _model.title;
    _summaryLabel.text = _model.summary;
    
    //定义imagName
    NSString * imageName = nil;
    
    switch (_model.type) {
        case WordType:
            imageName = @"word";
            break;
            
                   case ImgType:
            imageName = @"sctpxw";
            break;
            
        case VideoType:
            imageName = @"scspxw";
            break;
            
        default:
            break;
    }
    
    _typeView.image = [UIImage imageNamed:imageName];
    
}

@end









