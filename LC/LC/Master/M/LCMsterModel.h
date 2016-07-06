//
//  LCMsterModel.h
//  LC
//
//  Created by tarena04 on 16/7/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "JSONModel.h"

@interface LCMsterModel : JSONModel

@property (nonatomic,copy) NSString *duty;

@property (nonatomic,strong) NSNumber *is_daren;

@property (nonatomic,copy) NSString *nickname;

@property (nonatomic,copy) NSString *username;

@property (nonatomic,strong) NSNumber *uid;

@property (nonatomic,strong) NSDictionary *user_images;



@end
