//
//  LCMinaNaviViewController.m
//  LC
//
//  Created by tarena04 on 16/7/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LCMinaNaviViewController.h"

@interface LCMinaNaviViewController ()<UITextFieldDelegate>

@property (nonatomic,strong) UIView *searchView;

@end

@implementation LCMinaNaviViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.barTintColor = [UIColor blackColor];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemSave) target:self action:@selector(addSearch)];
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    
}


- (void) addSearch
{
    if (self.searchView) {
        return;
    }
    self.searchView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, self.view.width, 40)];
    self.searchView.backgroundColor = [UIColor blackColor];
    self.searchView.alpha = 0.6;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    [ self.searchView addGestureRecognizer:tap];
    UITextField *textFiled = [[UITextField alloc] initWithFrame:CGRectMake(10, 0,self.view.width - 20 , 40)];
    textFiled.delegate = self;
    textFiled.backgroundColor = [UIColor whiteColor];
    [ self.searchView addSubview:textFiled];
    [self.view addSubview: self.searchView];
    [UIView animateWithDuration:0.5 animations:^{
        
        self.searchView.height = self.view.height;
        
    }];
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField;
{
    
    
    return YES;
}

- (void) tap
{
    [self.view endEditing:YES];
    [UIView animateWithDuration:0.5 animations:^{
        
        self.searchView.height = 0;
        
    }completion:^(BOOL finished) {
        [self.searchView.subviews[0] removeFromSuperview];
        self.searchView = nil;
        [self.searchView removeFromSuperview];
        
    }];
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
