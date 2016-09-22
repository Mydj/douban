//
//  HeadCell.m
//  douban
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import "HeadCell.h"
#import "NorthModel.h"
@implementation HeadCell

-(instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        //创建视图
        [self _createView];
        
        self.contentView.transform = CGAffineTransformMakeScale(0.95, 1);
        
    }
    
    return self;
}

-(void)_createView {
    
    //1.创建imageView
    _imgView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
    
    [self.contentView addSubview:_imgView];
}

-(void)setModel:(NorthModel *)model {
    
    _model = model;
    //获取url
    NSString *url = [_model.images objectForKey:@"small"];
    
    [_imgView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"pig"]];
}
@end
