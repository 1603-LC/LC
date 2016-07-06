//
//  LCInfosModel.h
//  LC
//
//  Created by tarena01_07 on 16/7/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCInfosModel : NSObject
@property (nonatomic, copy) NSString *topic_name;
@property (nonatomic, copy) NSString *topic_url;
@property (nonatomic, copy) NSString *cover_img;
@property (nonatomic, copy) NSString *cat_name;

-(instancetype)initWithDic:(NSDictionary *)dic;
@end
