//
//  FenleiModel.h
//  LC
//
//  Created by tarena on 16/7/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "JSONModel.h"

@interface FenleiModel : JSONModel

@property(nonatomic,strong)NSString *cat_id;
@property(nonatomic,strong)NSString *cat_name;
@property(nonatomic,strong)NSString *cover_img;

@property(nonatomic,strong)NSArray *second;
@end
