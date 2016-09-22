//
//  DetailHeaderView.h
//  douban
//
//  Created by apple on 16/3/12.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DetailModel;
@interface DetailHeaderView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleCn;
@property (weak, nonatomic) IBOutlet UILabel *titleEn;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;

@property (strong,nonatomic) DetailModel *model;

@end
