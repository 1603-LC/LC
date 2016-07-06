//
//  LCMasterLayout.m
//  LC
//
//  Created by tarena04 on 16/7/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LCMasterLayout.h"


@implementation LCMasterLayout


- (instancetype)init
{
    self = [super init];
    if (self) {
        //        项的大小
        CGRect frame = [UIScreen mainScreen].bounds;
        CGFloat cellW = frame.size.width / 2 - 20;
        self.itemSize = CGSizeMake(cellW, 140);
        self.minimumLineSpacing = 5;
        self.minimumInteritemSpacing = 5;
        self.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        
    }
    return self;
}

@end
