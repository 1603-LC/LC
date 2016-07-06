//
//  LCShowMasterLayout.m
//  LC
//
//  Created by tarena04 on 16/7/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LCShowMasterLayout.h"

@implementation LCShowMasterLayout
- (instancetype)init
{
    self = [super init];
    if (self) {
        //        项的大小
        CGRect frame = [UIScreen mainScreen].bounds;
        CGFloat cellW = frame.size.width / 3;
        self.itemSize = CGSizeMake(cellW, 130);
        self.minimumLineSpacing = 0;
        self.minimumInteritemSpacing = 0;
        self.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        
    }
    return self;
}
@end
