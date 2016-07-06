//
//  LCBrand.m
//  LC
//
//  Created by tarena on 16/7/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LCBrand.h"

@interface LCBrand()
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UILabel *name;


@end

@implementation LCBrand

-(void)setBrand:(LCBrandModel *)brand{

    _brand=brand;
    self.name.text=brand.brand_name;
    [self.imageview setImageWithURL:[NSURL URLWithString:brand.brand_logo]];

}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
