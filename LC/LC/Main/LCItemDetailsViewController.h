//
//  LCItemDetailsViewController.h
//  LC
//
//  Created by tarena04 on 16/7/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LCGoods.h"
#import "LCMsterModel.h"
@interface LCItemDetailsViewController : UIViewController

@property (nonatomic,strong) LCMsterModel *model;


@property (nonatomic,strong) LCGoods *goods;


@end
