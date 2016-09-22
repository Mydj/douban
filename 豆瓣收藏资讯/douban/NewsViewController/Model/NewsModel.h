//
//  NewsModel.h
//  douban
//
//  Created by apple on 16/3/6.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 {
 "newsid" : 1491520,
 "type" : 0,
 "title" : "科幻大作《全面回忆》全新预告片发布",
 "summary" : "",
 "image" : "http://img31.mtime.cn/mg/2012/06/28/100820.21812355.jpg"
 }
 */

//枚举
typedef enum
{
    WordType,ImgType,VideoType
}NewsType;
@interface NewsModel : NSObject

@property (assign,nonatomic)NSInteger newsid;
//获取标记 0 是文字  1是图片  2 是 视频
@property (assign,nonatomic)NewsType type;

@property (copy,nonatomic)NSString * title;

@property (copy,nonatomic)NSString * summary;

@property (copy,nonatomic)NSString *image;

@end
