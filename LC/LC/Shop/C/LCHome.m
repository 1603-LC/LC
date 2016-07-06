//
//  LCHome.m
//  LC
//
//  Created by tarena on 16/7/6.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LCHome.h"

@implementation LCHome
- (instancetype)init
{
    self = [super init];
    if (self) {
        //        项的大小
        CGRect frame = [UIScreen mainScreen].bounds;
        CGFloat cellW = frame.size.width/2-15;
        self.itemSize = CGSizeMake(cellW, 180);
        self.minimumLineSpacing = 10;
        self.minimumInteritemSpacing = 0;
        self.headerReferenceSize = CGSizeMake(frame.size.width, 150);
        self.sectionInset = UIEdgeInsetsMake(10,10, 10, 10);
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        
    }
    return self;
}

@end
