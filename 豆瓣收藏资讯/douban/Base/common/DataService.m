//
//  DataService.m
//  douban
//
//  Created by apple on 16/3/6.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import "DataService.h"

@implementation DataService


//加载json 数据
+ (id)loadData:(NSString *)fileName
{
    NSString * filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
    //转成二进制
    NSData * data = [NSData dataWithContentsOfFile:filePath];
    
    id  dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
    
    return dic;
}

@end
