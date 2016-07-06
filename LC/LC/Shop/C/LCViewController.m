//
//  LCViewController.m
//  LC
//
//  Created by tarena on 16/7/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LCViewController.h"
#import "LCcao.h"
#import "LCShop.h"
#import "Shopmodel.h"
#import "LCMoneyViewController.h"

@interface LCViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSMutableArray *dataArray;

@end


@implementation LCViewController

static NSString * const reuseIdentifier = @"Cell";


- (void)viewDidLoad {
    [super viewDidLoad];
   NSString *dat= [NSString stringWithFormat:@"http://mobile.iliangcang.com/goods/goodsShare?a=b&page=1&uid=693171132&count=10&coverId=1&cat_code=%@&app_key=iPhone&v=3.0.0&sig=F1F823FE-BEE8-4BD6-868D-1908BA87BB1A&user_token=24e7262404f89296486f67cf4c90e15a",self.cat];
    
    self.dataArray = [NSMutableArray array];
    [LCJSON requestJsonDataWithGET: dat RequestParameter:nil returnDataWih:^(id data) {
//               NSLog(@"%@",data);
        
//        self.dataArray =  [Shopmodel arrayOfModelsFromDictionaries:data[@"data"][@"items"] error:nil];
        for (NSDictionary *dic in data[@"data"][@"items"]) {
            Shopmodel *model =  [[Shopmodel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            [self.dataArray addObject:model];
            
        }
    
//        NSLog(@"%@",data);
        [self.collectionView reloadData];
        
    }];
    

    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:[LCcao new]];
     [self.collectionView registerNib:[UINib nibWithNibName:@"LCShop" bundle:nil] forCellWithReuseIdentifier:@"cell"];
//     [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.collectionView];
    
    
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
    
    LCShop *cell =  [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.shop = self.dataArray[indexPath.row];
    
   
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    LCMoneyViewController *mt=[[LCMoneyViewController alloc]init];
    [self.navigationController pushViewController:mt animated:YES];
    

//    detailedVC.model = self.dataArray[indexPath.row];
//    [self.navigationController pushViewController:detailedVC animated:YES];
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
