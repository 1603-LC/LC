//
//  LCMasterDetailed.h
//  LC
//
//  Created by tarena04 on 16/7/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "JSONModel.h"

@interface LCMasterDetailed : JSONModel

@property (nonatomic,strong) NSString *friends;

@property (nonatomic,strong) NSString *like_count;

@property (nonatomic,strong) NSString *recommendation_count;

@property (nonatomic,strong) NSString *following_count;

@property (nonatomic,strong) NSString *followed_count;

@property (nonatomic,strong) NSString *user_name;

@property (nonatomic,strong) NSString *email;

@property (nonatomic,strong) NSDictionary *user_image;

@property (nonatomic,strong) NSString *user_desc;

@property (nonatomic,strong) NSArray *goods;

- (instancetype) initWithDic:(NSDictionary *) dic;



@end
