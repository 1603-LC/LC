//
//  LCSearchResult.h
//  LC
//
//  Created by tarena04 on 16/7/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "JSONModel.h"

@interface LCSearchResult : JSONModel

@property (nonatomic,strong) NSDictionary *user_images;
@property (nonatomic,strong) NSString *nickname;
@property (nonatomic,strong) NSNumber *uid;


@end
