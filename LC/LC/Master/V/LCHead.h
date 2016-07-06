//
//  LCHead.h
//  LC
//
//  Created by tarena04 on 16/7/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCMasterDetailed.h"
#import "LCMsterModel.h"
@interface LCHead : UIView

@property (nonatomic,strong) LCMasterDetailed *detailedMolde;
@property (nonatomic,strong) LCMsterModel *model;


+ (instancetype) returnXIBView;
@end
