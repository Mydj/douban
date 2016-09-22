//
//  UIView+viewController.m
//  douban
//
//  Created by apple on 16/3/8.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import "UIView+viewController.h"

@implementation UIView (viewController)


-(UIViewController *)viewController {
    
    UIResponder *next = self.nextResponder;
    while (YES) {
        
        if ([next isKindOfClass:[UIViewController class]]) {
            
            break;
        }
        next = next.nextResponder;
    }
    return (UIViewController *)next;
}
@end
