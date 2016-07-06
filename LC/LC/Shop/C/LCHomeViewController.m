//
//  LCHomeViewController.m
//  LC
//
//  Created by tarena on 16/7/5.
//  Copyright © 2016年 tarena. All rights reserved.
//
#import "LCHome.h"
#import "LCHomeViewController.h"
#import "LCCollectionReusableView.h"
@interface LCHomeViewController ()<UIScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UIScrollView *scrollview;
@property(nonatomic,strong)UIPageControl *pagecontrol;


@property (nonatomic,strong) UICollectionView *collectionView;
@property(nonatomic,strong)UIView *view1;
@property(nonatomic)int index;
@end


@implementation LCHomeViewController

-(UIView *)view1
{
    if (!_view1) {
        self.view1 = [[UIView alloc]init];
        self.view1.frame = CGRectMake(0, 0, self.view.frame.size.width, 150);
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view1.frame];
        imageView.image = [UIImage imageNamed:@"1.jpg"];
        [self.view1 addSubview:imageView];
        [self configScrollView];
        [self PageControl];
    }
    return _view1;
}


static NSString * const reuseIdentifier = @"Cell";


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    

    
    [LCJSON requestJsonDataWithGET:@"http://mobile.iliangcang.com/goods/shopHome?a=b&app_key=iPhone&v=3.0.0&sig=F1F823FE-BEE8-4BD6-868D-1908BA87BB1A&user_token=24e7262404f89296486f67cf4c90e15a" RequestParameter:nil returnDataWih:^(id data) {
        NSLog(@"%@",data);
        
      
    }];

    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:[LCHome new]];
    [self.collectionView registerNib:[UINib nibWithNibName:@"LCShop" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
    //注册表头
    [self.collectionView registerNib:[UINib nibWithNibName:@"LCCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"123"];

    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.collectionView];
    
    
   
    [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(time:) userInfo:nil repeats:YES];
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath

{
    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader){
    
     LCCollectionReusableView *lc  =[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"123" forIndexPath:indexPath];
    
      [lc addSubview:self.view1];

      reusableview = lc;
     }
    return reusableview;

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger pageNum=round(self.scrollview.contentOffset.x/self.scrollview.frame.size.width);
    self.pagecontrol.currentPage=pageNum;
}


-(void)configScrollView{
    
    self.scrollview=[[UIScrollView alloc]initWithFrame:self.view1.frame];
    self.scrollview.delegate=self;
    self.scrollview.contentSize=CGSizeMake(self.view1.frame.size.width*4, self.view1.frame.size.height);
    
    for (int i=0; i<4; i++) {
        UIImageView *imageview=[[UIImageView alloc]init];
        NSString *imageName=[NSString stringWithFormat:@"%d.jpg",i+1];
        imageview.image=[UIImage imageNamed:imageName];
        imageview.frame=CGRectMake(i*self.view1.frame.size.width, 0, self.view1.frame.size.width, self.view1.frame.size.height);
        [self.scrollview addSubview:imageview];
    }
    [self.view1 addSubview:self.scrollview];
    self.scrollview.showsHorizontalScrollIndicator=NO;
    self.scrollview.showsVerticalScrollIndicator=NO;
    self.scrollview.pagingEnabled = YES;
    self.scrollview.bounces=NO;
    
}

-(void)PageControl{
    
    self.pagecontrol=[[UIPageControl alloc]init];
    self.pagecontrol.frame=CGRectMake(0, self.view1.frame.size.height-20, self.view1.frame.size.width, 20);
    self.pagecontrol.numberOfPages=4;
    self.pagecontrol.currentPage=0;
    self.pagecontrol.pageIndicatorTintColor=[UIColor whiteColor];
    self.pagecontrol.currentPageIndicatorTintColor=[UIColor blackColor];
    self.pagecontrol.userInteractionEnabled=NO;
    [self.view1 addSubview:self.pagecontrol];
}

-(void)time:(NSTimer*)sender{
    //偏移量
    [self.scrollview setContentOffset:CGPointMake(++self.index%4*self.view1.frame.size.width, 0)];
    
    //动画
    CATransition *animation = [CATransition new];
    animation.duration = 1;
    
    [self.scrollview.layer addAnimation:animation forKey:nil];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor yellowColor];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
