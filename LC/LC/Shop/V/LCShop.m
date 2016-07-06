//
//  LCShop.m
//  LC
//
//  Created by tarena on 16/7/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LCShop.h"

@interface LCShop()
@property (weak, nonatomic) IBOutlet UIImageView *Imageview;
@property (weak, nonatomic) IBOutlet UILabel *Jieshao;
@property (weak, nonatomic) IBOutlet UILabel *Money;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *number;


@end

@implementation LCShop



-(void)setShop:(Shopmodel *)shop{

    _shop=shop;
    
     [self.Imageview setImageWithURL:[NSURL URLWithString:shop.goods_image]];
    self.Jieshao.text=shop.goods_name;
    self.Money.text=shop.brand_name;
    self.price.text= [NSString stringWithFormat:@"%.02ld",shop.price];
    self.number.text=[NSString stringWithFormat:@"%ld",shop.like_count];


}


- (void)awakeFromNib {
    // Initialization code
}

@end
