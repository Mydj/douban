//
//  CommentCell.m
//  douban
//
//  Created by apple on 16/3/12.
//  Copyright © 2016年 nihao. All rights reserved.
//

#import "CommentCell.h"
#import "CommentModel.h"

@implementation CommentCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(CommentModel *)model {
    
    _model = model;
    //设置图片
    [_userImage sd_setImageWithURL:[NSURL URLWithString:_model.userImage] placeholderImage:[UIImage imageNamed:@"pig"]];
    
    _nameLabel.text = model.nickName;
    _ratingLabel.text = model.rating;
    _commentLabel.text = model.content;
    
}

@end
