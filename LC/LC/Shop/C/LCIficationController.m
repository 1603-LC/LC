//
//  LCIficationController.m
//  LC
//
//  Created by tarena on 16/7/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LCIficationController.h"
#import "FenleiModel.h"

#import "LCViewController.h"

@interface LCIficationController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, strong)UITableView *tableView;
//section标题
@property(nonatomic, strong)NSMutableArray *sectionArray;
//section中的cell个数
@property(nonatomic, strong)NSMutableArray *rowInSectionArray;
//是否被点击
@property(nonatomic, strong)NSMutableArray *selectedArray;

@property (nonatomic,strong) NSArray *titleArray;

@end

@implementation LCIficationController

//在UIviewcontroller中创建UITableview
-(void)loadView
{
    [super loadView];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0 ,-40 , self.view.frame.size.width, self.view.frame.size.height)style:UITableViewStyleGrouped];
    _tableView.tableFooterView = [[UIView alloc]init];
    self.tableView.backgroundColor = [UIColor blackColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
// 马上进入刷新状态
    [self.tableView.mj_header beginRefreshing];
    
    

    
//    
    self.view.backgroundColor=[UIColor blackColor];
    //每个分区的标题
//    _sectionArray = [NSMutableArray arrayWithObjects:@"池大王",@"池大大王",@"大王池",@"大王池大大", nil];
//    //每个分区中cell的个数
//    _rowInSectionArray = [NSMutableArray arrayWithObjects:@"4",@"3",@"2",@"3"@"3", nil];
    //这个用于判断展开还是缩回当前section的cell
    //0闭合，1展开
    _selectedArray = [NSMutableArray arrayWithObjects:@"0",@"0",@"0",@"0",@"0", nil];
    
}

-(void)loadNewData{
    [LCJSON requestJsonDataWithGET:@"http://mobile.iliangcang.com/goods/goodsCategory?a=b&app_key=iPhone&v=3.0.0&sig=F1F823FE-BEE8-4BD6-868D-1908BA87BB1A&user_token=24e7262404f89296486f67cf4c90e15a" RequestParameter:nil returnDataWih:^(id data) {
        //        NSLog(@"%@",data);
        
        self.titleArray =  [FenleiModel arrayOfModelsFromDictionaries:data[@"data"][@"items"] error:nil];
        [self.tableView reloadData];
        
        [self.tableView.mj_header endRefreshing];
    }];
    
}

#pragma mark section的个数
//有多少个分区
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.titleArray.count;
}

#pragma mark cell的行数
//每个分区有多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //判断section的标记是否为1,如果是说明为展开,就返回真实个数,如果不是就说明是缩回,返回0.
    if ([_selectedArray[section] isEqualToString:@"1"]) {
//        return [_rowInSectionArray[section]integerValue];
        FenleiModel *model  = self.titleArray[section];

        return [model.second[0] count];
    }
    return 0;
}
#pragma mark cell的内容
//第三问 每一行有什么
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
     FenleiModel *model  = self.titleArray[indexPath.section];
   // NSLog(@"%@",model.second[0][indexPath.row]);
    cell.textLabel.text = model.second[0][indexPath.row][@"cat_name"];
    
    return cell;
}

//分区高度
#pragma cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 200;
}


//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return 30;
//}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0001;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    LCViewController *mm=[[LCViewController alloc]init];
    
    FenleiModel *model  = self.titleArray[indexPath.section];
//    NSLog(@"%@,%@",model.second[0][indexPath.row],model);
    NSInteger index = [model.second[0][indexPath.row][@"cat_id"] integerValue];
    NSString *string = [NSString stringWithFormat:@"000%@00%.02ld",model.cat_id,(long)index];

    mm.cat=string;
  //  NSLog(@"%@",model.cat_id);
  //  NSLog(@"%@",model.second[0][indexPath.row][@"cat_id"]);
    [self.navigationController pushViewController:mm animated:YES];
    
}


#pragma mark - section内容
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    //每个section上面有一个button,给button一个tag值,用于在点击事件中改变_selectedArray[button.tag - 1000]的值
    UIView *sectionView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, 200)];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:sectionView.bounds];
    FenleiModel *model  = self.titleArray[section];
    [imageView setImageWithURL:[NSURL URLWithString:model.cover_img]];
    
    [sectionView addSubview:imageView];
    
    sectionView.backgroundColor = [UIColor clearColor];
    
    //创建button在view上
    UIButton *sectionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    sectionButton.frame = sectionView.frame;
//    [sectionButton setTitle:[_sectionArray objectAtIndex:section] forState:UIControlStateNormal];
    [sectionButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    //设置button的tag值
    sectionButton.tag = 100 + section;
    [sectionView addSubview:sectionButton];
    return sectionView;
}


#pragma mark button点击方法
-(void)buttonAction:(UIButton *)button
{
//    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:1];
//       [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
//    [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:(UITableViewScrollPositionTop)];
    if ([_selectedArray[button.tag - 100] isEqualToString:@"0"]) {
        
        //如果当前点击的section是缩回的,那么点击后就需要把它展开,是_selectedArray对应的值为1,这样当前section返回cell的个数就变为真实个数,然后刷新这个section就行了
        [_selectedArray replaceObjectAtIndex:button.tag - 100 withObject:@"1"];
        [_tableView reloadSections:[NSIndexSet indexSetWithIndex:button.tag - 100] withRowAnimation:UITableViewRowAnimationFade];
    }
    else
    {
        //如果当前点击的section是展开的,那么点击后就需要把它缩回,使_selectedArray对应的值为0,这样当前section返回cell的个数变成0,然后刷新这个section就行了
        [_selectedArray replaceObjectAtIndex:button.tag - 100 withObject:@"0"];
        [_tableView reloadSections:[NSIndexSet indexSetWithIndex:button.tag - 100] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
