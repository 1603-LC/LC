//
//  LCMasterShowCollectionViewCell.h
//  LC
//
//  Created by tarena04 on 16/7/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCMsterModel.h"
#import "LCSearchResult.h"
@interface LCMasterShowCollectionViewCell : UICollectionViewCell

@property (nonatomic,strong) LCMsterModel *model;

@property (nonatomic,strong) LCSearchResult *result;


@end
