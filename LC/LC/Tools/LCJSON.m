//
//  LCJSON.m
//  LC
//
//  Created by tarena04 on 16/7/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LCJSON.h"

@implementation LCJSON



+ (AFHTTPSessionManager *) returnManager
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    return manager;
}


+ (void) requestJsonDataWithGET:(NSString *) JsonURLStr RequestParameter:(NSDictionary *) Parameter
                  returnDataWih:(void(^)(id)) dicData
{
    [[self returnManager] GET:JsonURLStr parameters:Parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        dicData(dic);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}



@end
