//
//  PosterView.m
//  douban
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import "PosterView.h"
#import "PosterCollectionView.h"
#import "HeadCollectionView.h"
#import "NorthModel.h"

@implementation PosterView
{
    
    UIImageView *_headView;
    UIButton *_button;
    UIControl *_maskView;
    PosterCollectionView *_postCollectionView;
    HeadCollectionView *_headCollectionView;
    
}

-(id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        //1.创建头部视图
        [self _createHeader];
        
        //2.创建大海报视图
        [self _createPoster];
        
        
        //创建尾部视图
        [self _createFooter];
        
        
        //添加KVO
        [_postCollectionView addObserver:self
                              forKeyPath:@"currentItem"
                                 options:NSKeyValueObservingOptionNew
                                 context:nil];
        
        [_headCollectionView addObserver:self
                              forKeyPath:@"currentItem"
                                 options:NSKeyValueObservingOptionNew
                                 context:nil];
        
    }
    return self;
}

-(void)_createFooter {
    
    _footLaber = [[UILabel alloc] init];
    _footLaber.frame = CGRectMake(0, kScreenHeight - 60, kScreenWidth, 40);
    _footLaber.textAlignment = NSTextAlignmentCenter;
    _footLaber.text = @"haha";
    _footLaber.textColor = [UIColor whiteColor];
    
    [self addSubview:_footLaber];
}


//KVO调用的方法
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    
    //获取改变的数据
    NSNumber *newValue = [change objectForKey:@"new"];
    //NSNumber -->  NSInteger
    NSInteger item = [newValue integerValue];
    
    NSLog(@"item----- = %li",item);
    if (item >= 0 && item < _data.count) {
        
       NSLog(@"item = %li",item);
        if (object == _postCollectionView && _headCollectionView.currentItem != item)
        {
         NSLog(@"item = %li",item);
            //把当前滑动值给小图
            _headCollectionView.currentItem = item;
            //封装IndexPath
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:0];
            
            
            NSLog(@"item = %li",item);
            
            //设置小海报跳转
            [_headCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
            
        }else if (object == _headCollectionView && _postCollectionView.currentItem!= item)
        {
            
            //把当前滑动值给小图
            _postCollectionView.currentItem = item;
            //封装IndexPath
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:0];
            //设置小海报跳转
            [_postCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        }
        
        //显示标题
        NorthModel *model = _data[item];
        _footLaber.text = model.title;
        
    }else {
        
        return;
    }
    

}

-(void)_createPoster {
    
    _postCollectionView = [[PosterCollectionView alloc] initWithFrame:CGRectMake(0, 100, kScreenWidth, self.bounds.size.height-64-99)];
    
    _postCollectionView.backgroundColor = [UIColor yellowColor];
    
    _postCollectionView.pageWith = 220;
  
    
    [self insertSubview:_postCollectionView belowSubview:_headView];
}

-(void)_createHeader {
    
    //1.创建绿色的底
    _headView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 130)];
    _headView.backgroundColor = [UIColor greenColor];
    
    _headView.userInteractionEnabled = YES;
    [self addSubview:_headView];

    
    //创建黑色的imageView
    UIImage *image = [UIImage imageNamed:@"indexBG_home"];
    //拉伸图片
    image = [image stretchableImageWithLeftCapWidth:0 topCapHeight:1];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 130)];
    imgView.image = image;
    
    [_headView addSubview:imgView];
    
    _headCollectionView = [[HeadCollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 100)];
    _headCollectionView.backgroundColor = [UIColor yellowColor];
    
    _headCollectionView.pageWith = 60;
    [_headView insertSubview:_headCollectionView aboveSubview:imgView];
    
    
    
    
    //创建button
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [_button setImage:[UIImage imageNamed:@"down_home"] forState:UIControlStateNormal];
    [_button setImage:[UIImage imageNamed:@"up_home"] forState:UIControlStateSelected];
    _button.frame = CGRectMake((kScreenWidth-16)/2, 130-20, 20, 20);
    //点击事件
    [_button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [_headView addSubview:_button];
    
    
    //添加向下清扫的手势
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    //清扫方向
    swipe.direction = UISwipeGestureRecognizerDirectionDown;
    [self addGestureRecognizer:swipe];
    
    //添加向上清扫的手势
    UISwipeGestureRecognizer *swipe2 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe2:)];
    //清扫方向
    swipe2.direction = UISwipeGestureRecognizerDirectionUp;
    [self addGestureRecognizer:swipe2];
    
}

//获取数据
-(void)setData:(NSArray *)data {
    
    _data = data;
    _postCollectionView.data = _data;
    _headCollectionView.data = _data;
    
    //设置第一个显示的label
    NorthModel *model = _data[0];
    _footLaber.text = model.title;
}

-(void)swipe:(UISwipeGestureRecognizer *)swipe {
    
    //添加蒙版,只能小图滑动
    [self _showHeader];
    
    if (_maskView == nil) {
        
        //蒙版UIControl
        _maskView = [[UIControl alloc] initWithFrame:self.bounds];
        _maskView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        
        [_maskView addTarget:self action:@selector(maskView:) forControlEvents:UIControlEventTouchUpInside];
        [self insertSubview:_maskView belowSubview:_headView];
        
        
    }
}

-(void)maskView:(UIControl *)control {
    
    NSLog(@"..");
}
-(void)_showHeader {
    
    _headView.transform = CGAffineTransformMakeTranslation(0,110);
    _button.selected = YES;
    _maskView.hidden = NO;
}

-(void)swipe2:(UISwipeGestureRecognizer *)swipe {
    
    //添加蒙版,只能小图滑动
    [self _showHeader2];
    
}
-(void)_showHeader2 {
    
    _headView.transform = CGAffineTransformIdentity;
    _button.selected = NO;
    _maskView.hidden = YES;

}


-(void)buttonAction:(UIButton *)button {
    
    if (_maskView == nil) {
        
        //蒙版UIControl
        _maskView = [[UIControl alloc] initWithFrame:self.bounds];
        _maskView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        
        [_maskView addTarget:self action:@selector(maskView:) forControlEvents:UIControlEventTouchUpInside];
        [self insertSubview:_maskView belowSubview:_headView];
        
        
    }
    
    if (button.selected == NO) {
        
        _headView.transform = CGAffineTransformMakeTranslation(0, 110);
        _maskView.hidden = NO;
    }else {
        
        _headView.transform = CGAffineTransformIdentity;
        _maskView.hidden = YES;
    }
    //对原先的状态取反
    button.selected = !button.selected;
    
}

@end
