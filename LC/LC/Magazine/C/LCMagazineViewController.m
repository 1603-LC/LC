//
//  LCMagazineViewController.m
//  LC
//
//  Created by tarena04 on 16/7/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LCMagazineViewController.h"
#import "LCMagazineTableViewCell.h"
#import "LCDateTableViewCell.h"
#import "WebUtils.h"
#import "LCMagazineWebController.h"


@interface LCMagazineViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) UILabel *dateLabel;

@end

@implementation LCMagazineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60, 20)];
    self.dateLabel.font = [UIFont systemFontOfSize:15];
    self.dateLabel.textColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.dateLabel];
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 40, 20)];
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"杂志";
    self.navigationItem.titleView = titleLabel;
    
    
    self.myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.myTableView.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:self.myTableView];

    self.myTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    // 马上进入刷新状态
    [self.myTableView.mj_header beginRefreshing];
    self.myTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:nil];
}

-(void)loadNewData{
    [WebUtils requestDateWithCallback:^(id obj) {
        
        self.dataArray = obj;
        
        [self.myTableView reloadData];
        [self.myTableView.mj_header endRefreshing];
        
        for (id dateText in self.dataArray) {
            if (![dateText isKindOfClass:[LCInfosModel class]]) {
                self.dateLabel.text = dateText;
            }
            break;
        }
    }];
}

//1.有个几个分区
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//2.每个分区有多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}
//3.每行长什么样子
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(![self.dataArray[indexPath.row ] isKindOfClass:[LCInfosModel class]]){
        LCDateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
        if (!cell) {
            cell = [[NSBundle mainBundle]loadNibNamed:@"LCDateTableViewCell" owner:nil options:nil].lastObject;
        }
        cell.dateLabel.text = self.dataArray[indexPath.row ];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cell;
    }else{
        //从一个队列中取出一个名字为 cell1 的空闲的cell(可以重用)
        LCMagazineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
        if (!cell) {
              cell = [[NSBundle mainBundle]loadNibNamed:@"LCMagazineTableViewCell" owner:nil options:nil].firstObject;
        }
        cell.infos = self.dataArray[indexPath.row ];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cell;
    }

    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 0;
    }
    if (![self.dataArray[indexPath.row ] isKindOfClass:[LCInfosModel class]]) {
        LCDateTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"LCDateTableViewCell" owner:nil options:nil].lastObject;
        return cell.height;
    }
    LCMagazineTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"LCMagazineTableViewCell" owner:nil options:nil].lastObject;
    return cell.height;
}
//1答， 点中了做什么事
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.dataArray[indexPath.row ] isKindOfClass:[LCInfosModel class]]) {
        LCMagazineWebController *webV = [LCMagazineWebController new];
        LCInfosModel *infos = self.dataArray[indexPath.row ];
        webV.webUrl = infos.topic_url;
    [self.navigationController pushViewController:webV animated:YES];
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
 
    NSIndexPath *path =  [self.myTableView indexPathForRowAtPoint:CGPointMake(scrollView.contentOffset.x, scrollView.contentOffset.y + 64)];
    if (![self.dataArray[path.row ] isKindOfClass:[LCInfosModel class]]) {
        
        self.dateLabel.text = self.dataArray[path.row];
    }
    
    
}
@end
