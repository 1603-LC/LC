//
//  LCMainViewController.m
//  LC
//
//  Created by tarena04 on 16/7/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LCMainViewController.h"

@interface LCMainViewController ()

@property (nonatomic,strong) NSArray *tabBarItemImage;

@end

@implementation LCMainViewController
- (NSArray *)tabBarItemImage
{
    if (!_tabBarItemImage) {
        NSString *path  =[[NSBundle mainBundle] pathForResource:@"tabbarImages.plist" ofType:nil];
        _tabBarItemImage  =[NSArray arrayWithContentsOfFile:path];
    }
    return _tabBarItemImage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.barTintColor = [UIColor blackColor];
    for (int i = 0; i < self.childViewControllers.count; i++) {
        UIViewController *vc = self.childViewControllers[i];
        NSDictionary *dic = self.tabBarItemImage[i];
        NSDictionary *attributesDic = @{
                                        NSForegroundColorAttributeName:[UIColor whiteColor]
                                        };
        [vc.tabBarItem setTitleTextAttributes:attributesDic forState:UIControlStateHighlighted];
        vc.tabBarItem.title = dic[@"title"];
        
        
        vc.tabBarItem.image = [self setImageOriginalWithImageName:dic[@"image"]];
        vc.tabBarItem.selectedImage = [self setImageOriginalWithImageName:dic[@"selectedImage"]];
    }
}


- (UIImage *) setImageOriginalWithImageName:(NSString *) imageName
{
    return  [[UIImage imageNamed:imageName] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
