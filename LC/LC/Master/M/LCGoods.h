//
//  LCGoods.h
//  LC
//
//  Created by tarena04 on 16/7/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "JSONModel.h"

@interface LCGoods : JSONModel

@property (nonatomic,strong) NSString *goods_id;

@property (nonatomic,strong) NSString *goods_image;

@property (nonatomic,strong) NSString *goods_name;

@property (nonatomic,strong) NSString *price;

@property (nonatomic,strong) NSString *owner_id;

@property (nonatomic,strong) NSString *comment_count;

@property (nonatomic,strong) NSString *is_outter;

@property (nonatomic,strong) NSString *like_count;

@property (nonatomic,strong) NSString *liked;


@end
