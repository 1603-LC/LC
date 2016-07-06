//
//  Shopmodel.h
//  LC
//
//  Created by tarena on 16/7/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shopmodel : NSObject
@property(nonatomic,strong)NSDictionary *brand_info;
@property(nonatomic,strong)NSString *brand_desc;
@property(nonatomic,assign)NSInteger brand_id;
@property(nonatomic,strong)NSString *brand_logo;
@property(nonatomic,strong)NSString *brand_name;

@property(nonatomic,assign)NSInteger comment_count;
@property(nonatomic,strong)NSString *coupon_flag;
@property(nonatomic,strong)NSString *discount_price;
@property(nonatomic,assign)NSInteger goods_id;

@property(nonatomic,strong)NSString *goods_image;
@property(nonatomic,strong)NSString *goods_name;
@property(nonatomic,strong)NSString *goods_url;
@property(nonatomic,assign)NSInteger is_gift;

@property(nonatomic,assign)NSInteger like_count;
@property(nonatomic,assign)NSInteger liked;
@property(nonatomic,strong)NSString *owner_id;
@property(nonatomic,assign)NSInteger price;

@property(nonatomic,strong)NSString *promotion_imgurl;
@property(nonatomic,strong)NSString *sale_by;

@end
