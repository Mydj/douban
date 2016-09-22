//
//  DetailHeaderView.m
//  douban
//
//  Created by apple on 16/3/12.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import "DetailHeaderView.h"
#import "DetailModel.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import "UIView+viewController.h"

@implementation DetailHeaderView

-(void)setModel:(DetailModel *)model {
    
    _model = model;
    [_imgView sd_setImageWithURL:[NSURL URLWithString:@"image"] placeholderImage:[UIImage imageNamed:@"pig"]];
    _titleCn.text = _model.titleCn;
    _titleEn.text = _model.titleEn;
    _textView.text = _model.content;
    
    //处理button
    NSDictionary *dic1 = _model.videos[0];
    NSString *imgUrl1 = dic1[@"image"];
    UIImage *img1 = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imgUrl1]]];
    [_button1 setImage:img1 forState:UIControlStateNormal];
    
    NSDictionary *dic2 = _model.videos[1];
    NSString *imgUrl2 = dic2[@"image"];
    UIImage *img2 = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imgUrl2]]];
    [_button2 setImage:img2 forState:UIControlStateNormal];
    
    NSDictionary *dic3 = _model.videos[2];
    NSString *imgUrl3 = dic3[@"image"];
    UIImage *img3 = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imgUrl3]]];
    [_button3 setImage:img3 forState:UIControlStateNormal];
    
    
    NSDictionary *dic4 = _model.videos[3];
    NSString *imgUrl4 = dic4[@"image"];
    UIImage *img4 = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imgUrl4]]];
    [_button4 setImage:img4 forState:UIControlStateNormal];

}




- (IBAction)buttonAction:(UIButton *)sender {
    
    NSInteger index = sender.tag - 101;
    NSDictionary *dic = _model.videos[index];
    
    //获取视频的地址
    NSString *url = dic[@"url"];
    AVPlayerViewController *moviePlayer = [[AVPlayerViewController alloc] init];
    AVPlayer *player = [AVPlayer playerWithURL:[NSURL URLWithString:url]];
    moviePlayer.player = player;
    
    [player play];
    
//     [self.viewController presentViewController:moviePlayer animated:YES completion:NULL];
    
    @try{
        //
        
        [self.viewController presentViewController:moviePlayer animated:YES completion:NULL];

    }
    @catch(NSException *exception) {
        NSLog(@"exception:%@", exception);
    }
    @finally {
        
    }
    
    
}

@end
