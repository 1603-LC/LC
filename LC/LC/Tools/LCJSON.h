//
//  LCJSON.h
//  LC
//
//  Created by tarena04 on 16/7/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCJSON : NSObject



+ (void) requestJsonDataWithGET:(NSString *) JsonURLStr RequestParameter:(NSDictionary *) Parameter
                  returnDataWih:(void(^)(id)) dicData;
@end
