//
//  PhotoViewController.m
//  douban
//
//  Created by apple on 16/3/8.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import "PhotoViewController.h"
#import "PhotoCell.h"
#import "PhotoView.h"
#import "PhotoFlowLayout.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //1. 创建UI
    [self _createUI];

    
 


}

-(void)_createUI {
    
    //1.创建布局
    PhotoFlowLayout *flowLayout = [[PhotoFlowLayout alloc] init];
    //2.创建imageView
    PhotoView *view = [[PhotoView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    [self.view addSubview:view];

    view.dataArr = _imageUrl;
    //3. 添加图片
    [view scrollToItemAtIndexPath:_selectionIndexpath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}



@end
