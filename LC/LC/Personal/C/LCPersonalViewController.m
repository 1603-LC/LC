//
//  LCPersonalViewController.m
//  LC
//
//  Created by tarena04 on 16/7/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LCPersonalViewController.h"
#import "LCPersonalCells.h"
#import "LCLoginViewController.h"

@interface LCPersonalViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray *cellsArray;
@property (nonatomic, strong) UITableView *myTableView;
@end

@implementation LCPersonalViewController


- (void)viewDidLoad {
    [super viewDidLoad]; 
    UILabel *naviTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60, 40)];
    naviTitleLabel.textAlignment = NSTextAlignmentCenter;
    naviTitleLabel.font = [UIFont systemFontOfSize:15];
    naviTitleLabel.text = @"个人设置";
    naviTitleLabel.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = naviTitleLabel;
    
    self.cellsArray = [LCPersonalCells returnCells];
    self.myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height + 64) style:UITableViewStylePlain];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.bounces = NO;
    self.myTableView.backgroundColor = [UIColor blackColor];

    [self.view addSubview:self.myTableView];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

//1.有个几个分区
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
//2.每个分区有多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 2;
            break;
        case 2:
            return 3;
            break;
    }
    return 0;
}
//3.每行长什么样子
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LCPersonalCells *cell;
    switch (indexPath.section) {
        case 0:
            cell = self.cellsArray[0];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            return cell;
        case 1:
            if (indexPath.row == 0) {
                cell = self.cellsArray[1];
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                return cell;
            }else if (indexPath.row == 1){
                cell = self.cellsArray[2];
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                return cell;
            }
        case 2:
            if (indexPath.row == 0) {
                cell = self.cellsArray[3];
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                return cell;
            }else if (indexPath.row == 1){
                cell = self.cellsArray[4];
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                return cell;
            }else{
                cell = self.cellsArray[5];
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                return cell;
            }
    }
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    return (self.view.height - 114 - 110) / 6.0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 10;
    }
    return 25;
}

-(UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    // Create header view and add label as a subview
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor blackColor];
    
    return view;
    
}

//1答， 点中了做什么事
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
            [self presentViewController:[LCLoginViewController new] animated:YES completion:nil];
            
        case 1:
            if (indexPath.row == 0) {
                
                
            }else if (indexPath.row == 1){
                
            }
        case 2:
            if (indexPath.row == 0) {
                
            }else if (indexPath.row == 1){
               
            }else{
                
            }
    }
}
+ (void) setJumpViewAni
{
    static BOOL JumpAniSubtyoe = YES;
    CATransition *animation = [CATransition new];
    animation.duration = 1;
    animation.type = @"rippleEffect";
    animation.subtype = JumpAniSubtyoe ? kCATransitionFromRight : kCATransitionFromLeft;
    [[UIApplication sharedApplication].keyWindow.layer addAnimation:animation forKey:nil];
    JumpAniSubtyoe = !JumpAniSubtyoe;
}
@end
