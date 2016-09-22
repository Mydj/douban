//
//  MoreTableViewController.m
//  douban
//
//  Created by apple on 16/3/13.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import "MoreTableViewController.h"

@interface MoreTableViewController ()

@end

@implementation MoreTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"更多";
    self.view.backgroundColor = [UIColor blackColor];
}

//视图加载
-(void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    //1.计算缓存
    [self _readCacheSize];
}

-(void)_readCacheSize {
    
    //获取缓存
    CGFloat size = [self _getCacheSize];
    
    //换算缓存大小
    double mbSize = size / 1024.0 / 1024.0;
    
    _sizeLabel.text = [NSString stringWithFormat:@"%.2fMB",mbSize];
}

//获取缓存
-(CGFloat)_getCacheSize {
    
    CGFloat size = 0;
    //获取缓存路径
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"];
    
    //获取Caches下所有文件
    NSDirectoryEnumerator *fileEnumerator = [[NSFileManager defaultManager] enumeratorAtPath:filePath];
    
    for (NSString *fileName in fileEnumerator) {
        
        NSString *path = [filePath stringByAppendingPathComponent:fileName];
        
        //
        NSDictionary *dic = [[NSFileManager defaultManager] attributesOfItemAtPath:path error:nil];
        
        //获取文件大小
        size += [dic fileSize];
    }
    
    return size;
}


//选中celln
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        UIAlertController *alertCtr = [UIAlertController alertControllerWithTitle:@"清理缓存" message:@"是否清理缓存" preferredStyle:UIAlertControllerStyleAlert];
        
        [alertCtr addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            //清理缓存
            [self _clearCache];
            
            //读取缓存
            [self _readCacheSize];
        }]];
        
        [alertCtr addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
        
        [self presentViewController:alertCtr animated:YES completion:nil];
    }
    
}
-(void)_clearCache {
    
    //获取缓存路径
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"];
    
    //清理缓存
    [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];

    
}
  
     
     

@end
