//
//  PhotoCell.m
//  douban
//
//  Created by apple on 16/3/8.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import "PhotoCell.h"

@implementation PhotoCell
{
    
    UIImageView *_imgView;
    
    UIAlertController *_alertController;
}

-(instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
    
        [self _createImgView];
    }
    return self;
}

-(void)_createImgView {
    
    _imgView = [[UIImageView alloc] initWithFrame:self.bounds];
    _imgView.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.contentView addSubview:_imgView];
    
    
    //开始接受触摸事件
    _imgView.userInteractionEnabled = YES;
    
    //添加手指长按
    [_imgView addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(showPhoto:)]];
    
}
-(void)showPhoto:(UIGestureRecognizer *)gesture {
    
    _alertController = [UIAlertController alertControllerWithTitle:@"是否保存到本地" message:@"赵鑫怡" preferredStyle:UIAlertControllerStyleAlert];
    
    [_alertController addAction:[UIAlertAction actionWithTitle:@"保存" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        //创建加载进度
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.window animated:YES];
        
        //点击image
        UIImage *image = _imgView.image;
        
        //用来保存图片到本地
        UIImageWriteToSavedPhotosAlbum(image, self,@selector(image:didFinishSavingWithError:contextInfo:), (__bridge void *)(hud));
        
        
    }]];
    
    [_alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:NULL]];
    
    [self.viewController presentViewController:_alertController animated:YES completion:nil];
    
}           

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    
    MBProgressHUD *hud = (__bridge MBProgressHUD *)(contextInfo);
    
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark"]];
    hud.mode = MBProgressHUDModeCustomView;
    hud.labelText = @"已保存";
    [hud hide:YES afterDelay:1];
}
     
-(void)setImgUrl:(NSString *)imgUrl {
    
    _imgUrl = imgUrl;
    
    [_imgView sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:[UIImage imageNamed:@"pig"]];
}

@end
