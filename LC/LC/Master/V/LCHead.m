//
//  LCHead.m
//  LC
//
//  Created by tarena04 on 16/7/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LCHead.h"
#import "LCMsterModel.h"
@interface LCHead ()

@property (weak, nonatomic) IBOutlet UIImageView *image;

@property (weak, nonatomic) IBOutlet UILabel *name;

@property (weak, nonatomic) IBOutlet UILabel *user_desc;

@property (weak, nonatomic) IBOutlet UIButton *like_count;
@property (weak, nonatomic) IBOutlet UIButton *recommendation_count;
@property (weak, nonatomic) IBOutlet UIButton *following_count;
@property (weak, nonatomic) IBOutlet UIButton *followed_count;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *btnS;

@end


@implementation LCHead


-(void)setDetailedMolde:(LCMasterDetailed *)detailedMolde
{
    _detailedMolde = detailedMolde;
//    LCMsterModel *model = [[LCMsterModel alloc] init];
//    [model setValuesForKeysWithDictionary:detailedMolde[@"items"]];
    
    [self.image setImageWithURL:[NSURL URLWithString:self.model.user_images[@"orig"]]];
    self.name.text = self.model.username;
    self.user_desc.text = self.model.duty;

 
    [self.like_count setTitle:[NSString stringWithFormat:@"喜欢(%@)",detailedMolde.like_count] forState:(UIControlStateNormal)];
    [self.recommendation_count setTitle:[NSString stringWithFormat:@"推荐(%@)",detailedMolde.recommendation_count] forState:(UIControlStateNormal)];
    [self.following_count setTitle:[NSString stringWithFormat:@"关注(%@)",detailedMolde.following_count] forState:(UIControlStateNormal)];
    [self.followed_count setTitle:[NSString stringWithFormat:@"粉丝(%@)",detailedMolde.followed_count] forState:(UIControlStateNormal)];

}


- (IBAction)clickBtn:(UIButton *)sender {
    sender.selected = YES;
    
    
    for (UIButton *btn in self.btnS) {
        if (btn != sender) {
            
        btn.selected = NO;
            
        }
        
    }

}





+ (instancetype) returnXIBView
{
    return [[NSBundle mainBundle] loadNibNamed:@"LCHead" owner:nil options:nil].lastObject;
}

@end
