//
//  Common.h
//  douban
//
//  Created by apple on 16/3/4.
//  Copyright © 2016年 nihao. All rights reserved.
//

#ifndef Common_h
#define Common_h


//设置屏幕的宽高
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight  [UIScreen mainScreen].bounds.size.height


//导入第三方 框架
#import "UIImageView+WebCache.h"
#import "MBProgressHUD.h"

//新闻界面数据
#define news_list  @"news_list.json" 
//图片数据
#define image_list  @"image_list.json" 
//
#define top250  @"top250.json"
//movie_detail
#define movie_detail  @"movie_detail.json"
#define movie_comment  @"movie_comment.json"
#define district_list  @"district_list.json"
#define cinema_list  @"cinema_list.json"


//获取json数据
#import "DataService.h"


#import "UIView+viewController.h"
#endif /* Common_h */
