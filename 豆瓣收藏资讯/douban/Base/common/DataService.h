//
//  DataService.h
//  douban
//
//  Created by apple on 16/3/6.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataService : NSObject


//加载json 数据
+ (id)loadData:(NSString *)fileName;

@end
