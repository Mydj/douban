//
//  NorthModel.h
//  douban
//
//  Created by apple on 16/3/5.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NorthModel : NSObject

@property (strong,nonatomic)NSDictionary *rating; //字典 获取分数
@property (copy,nonatomic)NSString * title; //标题
@property (copy,nonatomic)NSString *year; //年份
@property (copy,nonatomic)NSString * original_title; //原始标题
@property (strong,nonatomic)NSDictionary *images; //电影URL 




@end
