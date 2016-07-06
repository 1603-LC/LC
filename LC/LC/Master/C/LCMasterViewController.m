//
//  LCMasterViewController.m
//  LC
//
//  Created by tarena04 on 16/7/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LCMasterViewController.h"
#import "LCShowMasterLayout.h"
#import "LCMsterModel.h"
#import "LCMasterShowCollectionViewCell.h"
#import "LCMasterDetailedViewController.h"
#import "LCSearchResultViewController.h"
@interface LCMasterViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UITextFieldDelegate>


@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,strong) NSMutableArray *dataArray;

@property (nonatomic,strong) MJRefreshGifHeader *header;
@property (nonatomic,strong) MJRefreshBackGifFooter *footer;

@property (nonatomic,strong) UIView *searchView;


@end

@implementation LCMasterViewController

int i = 1;
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title = @"达人";
    self.title = @"达人";
    UILabel *labelTitle = [[UILabel alloc] init];
    labelTitle.text = @"达人";
    labelTitle.font = [UIFont systemFontOfSize:14];
    labelTitle.textColor = [UIColor whiteColor];
    labelTitle.textAlignment = NSTextAlignmentCenter;
    labelTitle.frame = CGRectMake(0, 0, 100, 100);
    self.navigationItem.titleView = labelTitle;
    
    
    self.dataArray = [NSMutableArray array];

    [self addSubView];
    self.header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(PullUp)];
    [self.header setRefreshAddAt:self.collectionView];
    [self.collectionView.mj_header beginRefreshing];
    self.footer = [MJRefreshBackGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(pulldown)];
    self.collectionView.mj_footer = self.footer;
    

}

- (void) addSubView
{
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:[LCShowMasterLayout new]];
    [self.collectionView registerNib:[UINib nibWithNibName:@"LCMasterShowCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.collectionView];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[self setImageOriginalWithImageName:@"Unknown-11"] style:(UIBarButtonItemStyleDone) target:self action:@selector(addSearch)];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[self setImageOriginalWithImageName:@"Unknown-12"] style:(UIBarButtonItemStyleDone) target:self action:@selector(addSearch)];
    
   
    
}


- (UIImage *) setImageOriginalWithImageName:(NSString *) imageName
{
    return  [[UIImage imageNamed:imageName] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
}


- (void) addSearch
{
    if (self.searchView) {
        return;
    }
    self.searchView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, self.view.width, 40)];
    self.searchView.backgroundColor = [UIColor blackColor];
    self.searchView.alpha = 0.7;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    [ self.searchView addGestureRecognizer:tap];
    UITextField *textFiled = [[UITextField alloc] initWithFrame:CGRectMake(10, 0,self.view.width - 20 , 30)];
    textFiled.delegate = self;
    //设置圆形
    textFiled.layer.cornerRadius = 10;
    textFiled.layer.masksToBounds = YES;
    [textFiled becomeFirstResponder];
    textFiled.placeholder = @"搜索";
    textFiled.backgroundColor = [UIColor whiteColor];
    [ self.searchView addSubview:textFiled];
    [self.view addSubview: self.searchView];
    [UIView animateWithDuration:0.5 animations:^{
        
        self.searchView.height = self.view.height;
        
    }];
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField;
{
    
    LCSearchResultViewController *searchVC =  [LCSearchResultViewController new];
    searchVC.SearchContent = textField.text;
    [self.navigationController pushViewController:searchVC animated:YES];

    [self tap];
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

- (void) PullUp
{
    [self getDataWith:1];
    
}

- (void) pulldown
{
    i++;
     [self getDataWith:i];
}

- (void) getDataWith:(int) i
{

    NSString *url = [NSString stringWithFormat:@"http://mobile.iliangcang.com/user/masterList/?&uid=693171132&count=20&page=%d&app_key=iPhone&v=3.0.0&sig=F1F823FE-BEE8-4BD6-868D-1908BA87BB1A&user_token=24e7262404f89296486f67cf4c90e15a",i];
        [LCJSON requestJsonDataWithGET:url RequestParameter:nil returnDataWih:^(id data) {
       
            if (i == 1) {
                self.dataArray = [[LCMsterModel arrayOfModelsFromDictionaries:data[@"data"][@"items"] error:nil] mutableCopy];
            }else
            {
               [self.dataArray addObjectsFromArray:[LCMsterModel arrayOfModelsFromDictionaries:data[@"data"][@"items"] error:nil]];
            }
            
        [self.collectionView.mj_footer endRefreshing];
        [self.collectionView.mj_header endRefreshing];
        [self.collectionView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
     LCMasterShowCollectionViewCell *cell =  [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.row];
    
    return cell;
}



- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    LCMasterDetailedViewController *detailedVC = [LCMasterDetailedViewController new];
    detailedVC.model = self.dataArray[indexPath.row];
    [self.navigationController pushViewController:detailedVC animated:YES];
}






@end
