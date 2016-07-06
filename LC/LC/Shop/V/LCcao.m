//
//  LCcao.m
//  LC
//
//  Created by tarena on 16/7/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LCcao.h"

@implementation LCcao
- (instancetype)init
{
    self = [super init];
    if (self) {
        //        项的大小
        CGRect frame = [UIScreen mainScreen].bounds;
        CGFloat cellW = frame.size.width/2-15;
        self.itemSize = CGSizeMake(cellW, 220);
        self.minimumLineSpacing = 10;
        self.minimumInteritemSpacing = 0;
        self.sectionInset = UIEdgeInsetsMake(10,10, 10, 10);
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        
    }
    return self;
}

@end
