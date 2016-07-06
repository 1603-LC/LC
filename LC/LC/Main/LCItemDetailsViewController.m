//
//  LCItemDetailsViewController.m
//  LC
//
//  Created by tarena04 on 16/7/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LCItemDetailsViewController.h"
#import "LCItemDetailsHehead.h"
#import "LCCommentUserModel.h"
#import "LCCommentUserTableViewCell.h"
@interface LCItemDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic,strong) UITableView *tableView;


@property (nonatomic,strong) NSMutableArray *dataArray;


@property (nonatomic,strong) LCItemDetailsHehead *headView;


@end

@implementation LCItemDetailsViewController


-(LCItemDetailsHehead *)headView
{
    if (!_headView) {
        _headView = [LCItemDetailsHehead returnXIBView];
        _headView.goods = self.goods;
    }
    return _headView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray  = [NSMutableArray array];
    [self addSubView];
   
}

- (void) addSubView
{
    self.tableView = [[UITableView alloc] init];
    self.tableView.backgroundColor = [UIColor blackColor];
    self.tableView.frame = self.view.bounds;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.tableHeaderView = self.headView;
    
    [self.view addSubview:self.tableView];
}

-(void)setGoods:(LCGoods *)goods
{
    _goods = goods;
    
    NSString *URLStr = [NSString stringWithFormat:@"http://mobile.iliangcang.com/comments/goods?a=b&page=1&count=10&goods_id=%@&app_key=iPhone&v=3.0.0&sig=F1F823FE-BEE8-4BD6-868D-1908BA87BB1A&user_token=24e7262404f89296486f67cf4c90e15a",goods.goods_id];
    
    [LCJSON requestJsonDataWithGET:URLStr RequestParameter:nil returnDataWih:^(id data) {
        
        for (NSDictionary *dic in data[@"data"][@"items"]) {
            LCCommentUserModel *model = [[LCCommentUserModel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            [self.dataArray addObject:model];
        }
        
        
        [self.tableView reloadData];

    }];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
    return self.dataArray.count;
}


- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    LCCommentUserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"LCCommentUserTableViewCell" owner:nil options:nil].lastObject;
        
    }
    cell.backgroundColor = [UIColor clearColor];
    
    cell.modelData = self.dataArray[indexPath.row];
    
    return cell;
    
}


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  LCCommentUserTableViewCell *cell = [[NSBundle mainBundle] loadNibNamed:@"LCCommentUserTableViewCell" owner:nil options:nil].lastObject ;
    return cell.height;
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
