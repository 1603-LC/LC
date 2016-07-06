//
//  LCCommentUserTableViewCell.m
//  LC
//
//  Created by tarena04 on 16/7/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LCCommentUserTableViewCell.h"


@interface LCCommentUserTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *icon;

@property (weak, nonatomic) IBOutlet UILabel *name;

@property (weak, nonatomic) IBOutlet UILabel *content;

@property (weak, nonatomic) IBOutlet UILabel *timer;

@end

@implementation LCCommentUserTableViewCell


-(void)setModelData:(LCCommentUserModel *)modelData
{
    _modelData = modelData;
    
    [self.icon setImageWithURL:[NSURL URLWithString:modelData.user_image]];
    self.name.text = modelData.user_name;
    self.content.text = modelData.msg;
    self.timer.text = modelData.create_time;
    
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
