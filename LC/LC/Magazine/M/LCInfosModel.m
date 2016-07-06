//
//  LCInfosModel.m
//  LC
//
//  Created by tarena01_07 on 16/7/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LCInfosModel.h"

@implementation LCInfosModel
- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        self.topic_name = dic[@"topic_name"];
        self.topic_url = dic[@"topic_url"];
        
        self.cat_name = [NSString stringWithFormat:@"# %@",dic[@"cat_name"]];
        self.cover_img = dic[@"cover_img"];
    }
    return self;
}
@end
