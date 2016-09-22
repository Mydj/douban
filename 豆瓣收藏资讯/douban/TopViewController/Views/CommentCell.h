//
//  CommentCell.h
//  douban
//
//  Created by apple on 16/3/12.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CommentModel;
@interface CommentCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;

@property (strong,nonatomic) CommentModel *model;

@end
