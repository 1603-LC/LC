//
//  LCCommentUserModel.h
//  LC
//
//  Created by tarena04 on 16/7/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "JSONModel.h"

@interface LCCommentUserModel : JSONModel

@property (nonatomic,strong) NSNumber *comment_id;
@property (nonatomic,strong) NSString *create_time;
@property (nonatomic,strong) NSNumber *goods_id;
@property (nonatomic,strong) NSNumber *is_daren;
@property (nonatomic,strong) NSString *msg;
@property (nonatomic,strong) NSNumber *parent_id;
@property (nonatomic,strong) NSNumber *parent_uid;
@property (nonatomic,strong) NSString *parent_user_image;
@property (nonatomic,strong) NSString *parent_user_name;
@property (nonatomic,strong) NSNumber *user_id;
@property (nonatomic,strong) NSString *user_image;
@property (nonatomic,strong) NSString *user_name;





@end
