//
//  PosterCell.m
//  douban
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import "PosterCell.h"
#import "NorthModel.h"
@implementation PosterCell
{
    
    //创建一个翻转方向
    BOOL left;
}

-(instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        //创建视图
        [self _createView];
        
        //翻转标记
        left = YES;
        
        self.contentView.transform = CGAffineTransformMakeScale(0.95, 0.95);
        
    }
    
    return self;
}

//添加翻转功能
- (void)filpCell
{
    left =! left;
    
    UIViewAnimationOptions transtion = left ? UIViewAnimationOptionTransitionFlipFromLeft:UIViewAnimationOptionTransitionFlipFromRight;
    
    //使用翻转动画
    [UIView transitionWithView:self.contentView duration:0.5 options:transtion animations:^{
        
        //交换显示视图 根据下标
        [self.contentView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    } completion:NULL];
}


-(void)_createView {
    
    //1.创建imageView
    _imgView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
    
    [self.contentView addSubview:_imgView];
    
    //2:创建翻转视图
    _detailView = [[UIView alloc] initWithFrame:self.contentView.bounds];
    _detailView.backgroundColor = [UIColor whiteColor];
    //把_datailView视图放到_imgaeView视图的下面
    [self.contentView insertSubview:_detailView belowSubview:_imgView];
}

-(void)setModel:(NorthModel *)model {
    
    _model = model;
    //获取url
    NSString *url = [_model.images objectForKey:@"large"];
    
    [_imgView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"pig"]];
}
@end
