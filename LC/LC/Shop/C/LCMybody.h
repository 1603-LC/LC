//
//  LCMybody.h
//  LC
//
//  Created by tarena on 16/7/5.
//  Copyright © 2016年 tarena. All rights reserved.
//
#import "JSONModel.h"
#import <Foundation/Foundation.h>

@interface LCMybody : JSONModel
@property(nonatomic,strong)NSString *access_url;
@property(nonatomic,strong)NSString *addtime;
@property(nonatomic,strong)NSString *author_id;
@property(nonatomic,strong)NSString *cat_id;
@property(nonatomic,strong)NSString *cat_name;

@property(nonatomic,strong)NSString *cover_img;
@property(nonatomic,strong)NSString *cover_img_new;
@property(nonatomic,strong)NSString *goods_number;
@property(nonatomic,strong)NSString *hit_number;
@property(nonatomic,strong)NSString *img_path;

@property(nonatomic,strong)NSString *is_published;
@property(nonatomic,strong)NSString *is_show_list;
@property(nonatomic,strong)NSString *publish_time;
@property(nonatomic,strong)NSString *publish_type;
@property(nonatomic,strong)NSString *taid;


@property(nonatomic,strong)NSString *topic_name;
@property(nonatomic,strong)NSString *topic_url;

@end
