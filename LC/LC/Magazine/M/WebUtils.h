//
//  WebUtils.h
//  菜谱大全
//
//  Created by tarena on 16/6/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^MyCallback)(id obj);
@interface WebUtils : NSObject

+(void)requestDateWithCallback:(MyCallback)callback;

@end
