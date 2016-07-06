//
//  LCPersonalCells.m
//  LC
//
//  Created by tarena01_07 on 16/7/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LCPersonalCells.h"

@implementation LCPersonalCells
+(NSArray *)returnCells{
    return [[NSBundle mainBundle]loadNibNamed:@"LCPersonalCells" owner:nil options:nil];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
