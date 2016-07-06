//
//  LCMagazineTableViewCell.h
//  LC
//
//  Created by tarena01_07 on 16/7/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCInfosModel.h"

@interface LCMagazineTableViewCell : UITableViewCell
@property (nonatomic, strong) LCInfosModel *infos;
/** cell1 */
@property (weak, nonatomic) IBOutlet UILabel *topic_name_label;
@property (weak, nonatomic) IBOutlet UILabel *cat_name_label;
@property (weak, nonatomic) IBOutlet UIImageView *cover_img_imageView;
/** cell2 */

@end
