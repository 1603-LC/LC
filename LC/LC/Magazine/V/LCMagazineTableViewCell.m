//
//  LCMagazineTableViewCell.m
//  LC
//
//  Created by tarena01_07 on 16/7/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LCMagazineTableViewCell.h"


@implementation LCMagazineTableViewCell
-(void)setInfos:(LCInfosModel *)infos{

    self.topic_name_label.text = infos.topic_name;
    self.cat_name_label.text = infos.cat_name;
    [self.cover_img_imageView setImageWithURL:[NSURL URLWithString:infos.cover_img] placeholderImage:[UIImage imageNamed:@"earth_23"]];
//    self.cover_img_imageView

}

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
