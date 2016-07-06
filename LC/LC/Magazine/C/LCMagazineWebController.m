//
//  LCMagazineWebController.m
//  LC
//
//  Created by tarena01_07 on 16/7/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LCMagazineWebController.h"

@interface LCMagazineWebController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end

@implementation LCMagazineWebController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:self.webUrl]];
    [self.webView loadRequest:request];
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
