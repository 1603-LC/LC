//
//  WebUtils.m
//  菜谱大全
//
//  Created by tarena on 16/6/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//
#import "Menu.h"
#import "WebUtils.h"
#import "LCInfosModel.h"

@implementation WebUtils

+(void)requestDateWithCallback:(MyCallback)callback{
    
    NSString *path = @"http://mobile.iliangcang.com/topic/magazineList/?&app_key=iPhone&v=3.0.0&sig=F1F823FE-BEE8-4BD6-868D-1908BA87BB1A&user_token=24e7262404f89296486f67cf4c90e15a";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //把返回的json字符串 从Data转成字符串
        //        NSString *jsonStr = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        //        NSLog(@"%@",jsonStr);
        //
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        
        NSArray *dataArray = dic[@"data"][@"items"][@"keys"];
        
        NSMutableArray *menus = [NSMutableArray array];
        for (int i = 0; i < dataArray.count; i++) {
            NSString *string = dataArray[i];
            
            NSString *dateString = [string substringFromIndex:5];
            [menus addObject:dateString];
            
            NSArray *dataArray = dic[@"data"][@"items"][@"infos"][string];
            for (int a = 0; a < dataArray.count; a++) {
                LCInfosModel *infos = [[LCInfosModel alloc]initWithDic:dataArray[a]];
                [menus addObject:infos];
            }
            
        }
        
        
        callback(menus);
        
        NSLog(@"获取数据成功");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"获取数据失败：%@",error);
    }];
    
}

@end
