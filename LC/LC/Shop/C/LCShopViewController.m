//
//  LCShopViewController.m
//  LC
//
//  Created by tarena04 on 16/7/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LCShopViewController.h"
#import "LCIficationController.h"
#import "LCBrandTableViewController.h"
#import "LCProjectTableViewController.h"
#import "LCGiftViewController.h"
#import "LCHomeViewController.h"

static CGFloat const titleH = 44;
static CGFloat const navBarH = 64;
static CGFloat const maxTitleScale = 1.2;

//屏幕宽
#define YCKScreenW [UIScreen mainScreen].bounds.size.width
//屏幕高
#define YCKScreenH [UIScreen mainScreen].bounds.size.height


@interface LCShopViewController ()<UIScrollViewDelegate>
//头条滚动视图
@property (nonatomic, strong) UIScrollView *titleScrollView;
//内容滚动视图
@property (nonatomic, weak) UIScrollView *contentScrollView;
// 选中按钮
@property (nonatomic, weak) UIButton *selTitleButton;

//数组buttin
@property (nonatomic, strong) NSMutableArray *buttons;

@end

@implementation LCShopViewController

- (NSMutableArray *)buttons
{
    if (!_buttons)
    {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title=@"商店";
    self.navigationController.navigationBar.backgroundColor = [UIColor blackColor];
    self.navigationController.navigationBar.barStyle=UIBarStyleBlackOpaque;
    
    
    //设置头部标题栏
    [self setupContentScrollView];                       //设置内容
    [self addChildViewController];                        //添加子控制器
    //设置标题
    [self setupTitleScrollView];
    [self setupTitle];
    self.automaticallyAdjustsScrollViewInsets = NO;  //默认为Yes
    
    //内容滚动位置
    self.contentScrollView.contentSize = CGSizeMake(self.childViewControllers.count * YCKScreenW, 0);
    //整页翻转
    self.contentScrollView.pagingEnabled = YES;
    ////是否显示水平滚动条
    self.contentScrollView.showsHorizontalScrollIndicator = NO;
    self.contentScrollView.delegate = self;
}


#pragma mark - 设置头部标题栏
- (void)setupTitleScrollView
{
    // 判断是否存在导航控制器                   判断y值
    CGFloat y = self.navigationController ? navBarH : 0;
    CGRect rect = CGRectMake(0, y, YCKScreenW, titleH);
    
    self.titleScrollView = [[UIScrollView alloc] initWithFrame:rect];
    self.titleScrollView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.titleScrollView];
    

}

#pragma mark - 设置内容
- (void)setupContentScrollView
{
    
    //获取y坐标值+控件高度的值       (y的最大值)

    CGFloat y = 108;
    CGRect rect = CGRectMake(0, y, YCKScreenW, YCKScreenH - navBarH);
    
    UIScrollView *contentScrollView = [[UIScrollView alloc] initWithFrame:rect];
   
    [self.view addSubview:contentScrollView];
      self.contentScrollView = contentScrollView;
}

#pragma mark - 添加子控制器
- (void)addChildViewController
{
    LCIficationController *vc = [[LCIficationController alloc] init];
    vc.title = @"分类";
    vc.view.backgroundColor = [UIColor whiteColor];
    [self addChildViewController:vc];
    
    LCBrandTableViewController *vc1 = [[LCBrandTableViewController alloc] init];
    vc1.title = @"品牌";
    [self addChildViewController:vc1];
    
    LCHomeViewController *vc2 = [[LCHomeViewController alloc] init];
    vc2.title = @"首页";
    [self addChildViewController:vc2];
    
    LCProjectTableViewController*vc3 = [[LCProjectTableViewController alloc] init];
    vc3.title = @"专题";
    [self addChildViewController:vc3];
    
    LCGiftViewController *vc4=[[LCGiftViewController alloc]init];
    vc4.title=@"礼物";
    [self addChildViewController:vc4];
}


- (void)setupTitle
{
    NSUInteger count = self.childViewControllers.count;
    
    CGFloat x = 0;
    CGFloat w = 75;
    CGFloat h = titleH;
    
    for (int i = 0; i < count; i++)
    {   //遍历子视图
        UIViewController *vc = self.childViewControllers[i];
        //设置button的位置大小
        x = i * w;
        CGRect rect = CGRectMake(x, 0, w, h);
        UIButton *btn = [[UIButton alloc] initWithFrame:rect];
        //给button设置tag值
        btn.tag = i;
        [btn setTitle:vc.title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        
        [btn addTarget:self action:@selector(chick:) forControlEvents:UIControlEventTouchDown];
        
        [self.buttons addObject:btn];
        [self.titleScrollView addSubview:btn];
        
        if (i == 0)
        {
            [self chick:btn];
        }
        
    }
    //滚动视图的滚动位置
    self.titleScrollView.contentSize = CGSizeMake(count * w, 0);
    //是否显示水平滚动条
    self.titleScrollView.showsHorizontalScrollIndicator = NO;
}

// 按钮点击
- (void)chick:(UIButton *)btn
{
    [self selTitleBtn:btn];
    
    NSUInteger i = btn.tag;
    CGFloat x = i * YCKScreenW;
    
    [self setUpOneChildViewController:i];
    self.contentScrollView.contentOffset = CGPointMake(x, 0);
    
}
// 选中按钮
- (void)selTitleBtn:(UIButton *)btn
{
    [self.selTitleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.selTitleButton.transform = CGAffineTransformIdentity;    //清空所有设置的transform
    
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn.transform = CGAffineTransformMakeScale(maxTitleScale, maxTitleScale);   //x y 的放大倍数
    
    self.selTitleButton = btn;
    [self setupTitleCenter:btn];
}

- (void)setUpOneChildViewController:(NSUInteger)i
{
    CGFloat x = i * YCKScreenW;
    
    UIViewController *vc = self.childViewControllers[i];
    
    if (vc.view.superview) {
        return;
    }
    vc.view.frame = CGRectMake(x, 0, YCKScreenW, YCKScreenH - self.contentScrollView.frame.origin.y);
    
    [self.contentScrollView addSubview:vc.view];
    
}

- (void)setupTitleCenter:(UIButton *)btn
{
    CGFloat offset = btn.center.x - YCKScreenW * 0.5;
    
    if (offset < 0)
    {
        offset = 0;
    }
    
    CGFloat maxOffset = self.titleScrollView.contentSize.width - YCKScreenW;
    if (offset > maxOffset)
    {
        offset = maxOffset;
    }
    
    [self.titleScrollView setContentOffset:CGPointMake(offset, 0) animated:YES];
    
    
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSUInteger i = self.contentScrollView.contentOffset.x / YCKScreenW;
    [self selTitleBtn:self.buttons[i]];
    [self setUpOneChildViewController:i];
}

// 只要滚动UIScrollView就会调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGFloat offsetX = scrollView.contentOffset.x;
    NSInteger leftIndex = offsetX / YCKScreenW;
    NSInteger rightIndex = leftIndex + 1;
    
  
    
    UIButton *leftButton = self.buttons[leftIndex];
    
    UIButton *rightButton = nil;
    if (rightIndex < self.buttons.count) {
        rightButton = self.buttons[rightIndex];
    }
    
    CGFloat scaleR = offsetX / YCKScreenW - leftIndex;
    
    CGFloat scaleL = 1 - scaleR;
    
    
    CGFloat transScale = maxTitleScale - 1;
    leftButton.transform = CGAffineTransformMakeScale(scaleL * transScale + 1, scaleL * transScale + 1);
    
    rightButton.transform = CGAffineTransformMakeScale(scaleR * transScale + 1, scaleR * transScale + 1);
    
    
    UIColor *rightColor = [UIColor colorWithRed:scaleR green:0 blue:0 alpha:1];
    UIColor *leftColor = [UIColor colorWithRed:scaleL green:0 blue:0 alpha:1];
    
    [leftButton setTitleColor:leftColor forState:UIControlStateNormal];
    [rightButton setTitleColor:rightColor forState:UIControlStateNormal];
    
    
}


@end
