//
//  LCItemDetailsHehead.m
//  LC
//
//  Created by tarena04 on 16/7/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LCItemDetailsHehead.h"


@interface LCItemDetailsHehead ()

@property (weak, nonatomic) IBOutlet UIImageView *image;

@property (weak, nonatomic) IBOutlet UILabel *worksName;


@property (weak, nonatomic) IBOutlet UILabel *price;

@property (weak, nonatomic) IBOutlet UIImageView *userIcon;

@property (weak, nonatomic) IBOutlet UILabel *userName;

@property (weak, nonatomic) IBOutlet UIButton *likeNumber;

@end


@implementation LCItemDetailsHehead

-(void)setGoods:(LCGoods *)goods
{
    _goods = goods;
    [self.image setImageWithURL:[NSURL URLWithString:goods.goods_image]];
    self.worksName.text =  goods.goods_name;
    self.price.text = goods.price;
    [self.likeNumber setTitle:[NSString stringWithFormat:@"喜欢(%@)",goods.like_count] forState:(UIControlStateNormal)];

}



+ (instancetype) returnXIBView
{
    return [[NSBundle mainBundle] loadNibNamed:@"LCItemDetailsHehead" owner:nil options:nil].lastObject;
    
}

@end
