//
//  LCMasterDetailedViewController.m
//  LC
//
//  Created by tarena04 on 16/7/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LCMasterDetailedViewController.h"
#import "LCHead.h"
#import "LCMasterDetailed.h"
#import "LCGoods.h"
#import "LCMasterLayout.h"
#import "LCItemDetailsViewController.h"
@interface LCMasterDetailedViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>


@property (nonatomic,strong) LCHead *headView;


@property (nonatomic,strong) UICollectionView *collectionView;


@property (nonatomic,strong) NSArray *goods;

@end



@implementation LCMasterDetailedViewController



-(LCHead *)headView
{
    if (!_headView) {
        _headView = [LCHead returnXIBView];
        _headView.frame = CGRectMake(0, 64, _headView.width, _headView.height);
        
    }
    
    return _headView;
    
}



- (void)setModel:(LCMsterModel *)model
{
    NSString *url = [NSString stringWithFormat:@"http://mobile.iliangcang.com/user/masterListInfo/?&count=10&owner_id=%@&page=1&app_key=iPhone&v=3.0.0&sig=F1F823FE-BEE8-4BD6-868D-1908BA87BB1A&user_token=24e7262404f89296486f67cf4c90e15a",model.uid];
    [LCJSON requestJsonDataWithGET:url RequestParameter:nil returnDataWih:^(id data) {
        LCMasterDetailed *detailed = [[LCMasterDetailed alloc] initWithDic:data[@"data"][@"items"]];
        self.headView.model = model;
        self.headView.detailedMolde = detailed;
        self.goods = [LCGoods arrayOfModelsFromDictionaries:detailed.goods  error:nil];
        [self.collectionView reloadData];

    }];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.headView];
    
    self.collectionView  = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.headView.frame), self.view.width, self.view.height - (self.headView.height + 64)) collectionViewLayout:[LCMasterLayout new]];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.goods.count;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    UIImageView *imageView =  [[UIImageView alloc] initWithFrame:cell.bounds];
    LCGoods *goods =  self.goods[indexPath.row];
    
    [imageView setImageWithURL:[NSURL URLWithString:goods.goods_image]];
    
    cell.backgroundView = imageView;
    
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    LCGoods *goods =  self.goods[indexPath.row];
    
    LCItemDetailsViewController *itemDetails = [LCItemDetailsViewController new];
    
    itemDetails.goods = goods;
    
    [self.navigationController pushViewController:itemDetails animated:YES];
    
    
}


@end
