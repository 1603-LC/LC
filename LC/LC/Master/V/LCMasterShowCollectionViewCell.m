//
//  LCMasterShowCollectionViewCell.m
//  LC
//
//  Created by tarena04 on 16/7/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LCMasterShowCollectionViewCell.h"

@interface LCMasterShowCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *image;

@property (weak, nonatomic) IBOutlet UILabel *name;

@property (weak, nonatomic) IBOutlet UILabel *duty;

@end


@implementation LCMasterShowCollectionViewCell

-(void)setModel:(LCMsterModel *)model
{
    _model = model;
    
    [self.image setImageWithURL:[NSURL URLWithString:model.user_images[@"orig"]]];
    self.name.text = model.username;
    self.duty.text = model.duty;
    
}


-(void)setResult:(LCSearchResult *)result
{
    _result = result;
    [self.image setImageWithURL:[NSURL URLWithString:result.user_images[@"orig"]]];
    self.name.text = result.nickname;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
