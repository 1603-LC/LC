//
//  LCBrandModel.h
//  LC
//
//  Created by tarena on 16/7/5.
//  Copyright © 2016年 tarena. All rights reserved.
//
#import "JSONModel.h"
#import <Foundation/Foundation.h>

@interface LCBrandModel : JSONModel
@property(nonatomic,strong)NSString *brand_id;
@property(nonatomic,strong)NSString *brand_logo;
@property(nonatomic,strong)NSString *brand_name;
@end
