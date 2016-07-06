//
//  LCMybodycell.m
//  LC
//
//  Created by tarena on 16/7/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LCMybodycell.h"

@interface LCMybodycell()
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UILabel *labelname;


@end

@implementation LCMybodycell

-(void)setBody:(LCMybody *)body{
    
    self.labelname.text=body.topic_name;

    [self.imageview setImageWithURL:[NSURL URLWithString:body.cover_img_new]];


}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
