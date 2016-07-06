//
//  LCSearchResultViewController.m
//  LC
//
//  Created by tarena04 on 16/7/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LCSearchResultViewController.h"
#import "LCShowMasterLayout.h"
#import "LCMasterShowCollectionViewCell.h"
#import "LCSearchResult.h"
#import "LCMasterDetailed.h"
#import "LCMasterDetailedViewController.h"
#import "LCMsterModel.h"
#import "LCItemDetailsViewController.h"
@interface LCSearchResultViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,strong) NSArray *dataArray;

@end

@implementation LCSearchResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *labelTitle = [[UILabel alloc] init];
    labelTitle.text = @"搜索结果";
    labelTitle.font = [UIFont systemFontOfSize:14];
    labelTitle.textColor = [UIColor whiteColor];
    labelTitle.textAlignment = NSTextAlignmentCenter;
    labelTitle.frame = CGRectMake(0, 0, 100, 100);
    self.navigationItem.titleView = labelTitle;

    [self addSubView];

}

- (void) addSubView
{
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:[LCShowMasterLayout new]];
    [self.collectionView registerNib:[UINib nibWithNibName:@"LCMasterShowCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.collectionView];
    
    
}

- (void)setSearchContent:(NSString *)SearchContent
{
    _SearchContent = SearchContent;
    
    NSString *URL = [NSString stringWithFormat:@"http://mobile.iliangcang.com/user/search?&count=10&keyword=%@&page=1&app_key=iPhone&v=3.0.0&sig=F1F823FE-BEE8-4BD6-868D-1908BA87BB1A",SearchContent];
    URL = [URL stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [LCJSON requestJsonDataWithGET:URL RequestParameter:nil returnDataWih:^(id data) {
        NSLog(@"%@",data);
        
       self.dataArray =  [LCSearchResult arrayOfModelsFromDictionaries:data[@"data"][@"items"] error:nil];
       [self.collectionView reloadData];

    }];
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LCMasterShowCollectionViewCell *cell =  [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.result = self.dataArray[indexPath.row];
    
    return cell;
}



- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    LCSearchResult *uid = self.dataArray[indexPath.row];
    NSLog(@"%@",uid);
    NSString *string = [NSString stringWithFormat:@"http://mobile.iliangcang.com/user/masterListInfo/?&count=10&owner_id=%@&page=1&app_key=iPhone&v=3.0.0&sig=F1F823FE-BEE8-4BD6-868D-1908BA87BB1A&user_token=24e7262404f89296486f67cf4c90e15a",uid.uid];
  
//    [LCJSON requestJsonDataWithGET:string RequestParameter:nil returnDataWih:^(id data) {
//         LCMasterDetailed *detailed = [[LCMasterDetailed alloc] initWithDic:data[@"data"][@"items"]];
//        
//        
//        LCItemDetailsViewController *vc = [LCItemDetailsViewController new];
//        vc.goods = detailed.goods;
//        [self.navigationController pushViewController:vc animated:YES];
//        
//
//        
//    }];

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
