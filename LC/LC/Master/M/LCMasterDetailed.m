//
//  LCMasterDetailed.m
//  LC
//
//  Created by tarena04 on 16/7/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LCMasterDetailed.h"

@implementation LCMasterDetailed
- (instancetype) initWithDic:(NSDictionary *) dic
{

    
    if (self = [super init]) {
        
        self.friends = dic[@"friends"];
        self.like_count = dic[@"like_count"];
        self.recommendation_count = dic[@"recommendation_count"];
        self.following_count = dic[@"following_count"];
        self.followed_count = dic[@"followed_count"];
        self.goods = dic[@"goods"];
        
        self.user_name = dic[@"user_name"];
        self.email = dic[@"email"];
        self.user_image = dic[@"user_image"];
        self.user_desc = dic[@"user_desc"];

    }

    return self;
}
@end
