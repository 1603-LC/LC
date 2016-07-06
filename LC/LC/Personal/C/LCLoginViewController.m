//
//  LCLoginViewController.m
//  LC
//
//  Created by tarena01_07 on 16/7/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LCLoginViewController.h"
#import "LCMainLoginView.h"
#import "LCRegisterView.h"
#import "LCLoginView.h"

@interface LCLoginViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *obscureView;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (nonatomic, strong) UIScrollView *myScrollView;
@property (nonatomic, strong) NSTimer *myTimer;
@property (nonatomic, assign) BOOL obscureWhether;
@property (nonatomic, strong) LCRegisterView *registerView;
@property (nonatomic, strong) LCLoginView *loginView;
@end

@implementation LCLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myImageView.image = [UIImage imageNamed:@"earth_0"];
    
    LCMainLoginView *mainLoginView = [[NSBundle mainBundle]loadNibNamed:@"LCMainLoginView" owner:nil options:nil].lastObject;
    mainLoginView.frame = self.view.frame;
    
    self.myScrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];
    self.myScrollView.contentSize = CGSizeMake(self.view.width * 2, self.view.height);
    self.myScrollView.delegate = self;
    [self.myScrollView addSubview:mainLoginView];
    [self.view addSubview:self.myScrollView];
    self.myScrollView.scrollEnabled = NO;
    
    //获取通知中心单例对象
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    //添加当前类对象为一个观察者，name和object设置为nil，表示接收一切通知
    [center addObserver:self selector:@selector(notice:) name:@"myNotice" object:nil];
    
    //开启定时器，在一段时间内不断修改 alpha
    self.myTimer = [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(changeImageView:) userInfo:nil repeats:YES];
    //模糊
    [self obfuscationWithImage:self.obscureView];
    self.obscureView.alpha = 0;
}

/** 
 重启定时器;
 *销毁
 *开启定时器，在一段时间内不断修改 alpha
 *立即执行
 */
-(void)rebootTimer{
    [self.myTimer invalidate];
    
    self.myTimer = [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(changeImageView:) userInfo:nil repeats:YES];
    [self changeImageView:nil];
}

//界面跳转
-(void)notice:(NSNotification *)sender{
    if ([sender.userInfo[@"type"] isEqualToString:@"goRegister"]) {
        
        self.registerView   = [[NSBundle mainBundle]loadNibNamed:@"LCRegisterView" owner:nil options:nil].lastObject;
        self.registerView.frame  = CGRectMake(self.view.width, 0, self.view.width, self.view.height);
        [self.myScrollView addSubview: self.registerView];
        [self.myScrollView setContentOffset:CGPointMake(self.view.width, 0) animated:YES];
    
        self.obscureWhether = YES;
        
        [self rebootTimer];
        
    }else if ([sender.userInfo[@"type"] isEqualToString:@"goLoginView"]) {
        self.loginView   = [[NSBundle mainBundle]loadNibNamed:@"LCLoginView" owner:nil options:nil].lastObject;
        self.loginView.frame  = CGRectMake(self.view.width, 0, self.view.width, self.view.height);
        [self.myScrollView addSubview: self.loginView];
        [self.myScrollView setContentOffset:CGPointMake(self.view.width, 0) animated:YES];
        
        self.obscureWhether = YES;
        
        [self rebootTimer];
        
    }else if ([sender.userInfo[@"type"] isEqualToString:@"getBackMainLogin"]) {
        [self.myScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
        
        self.obscureWhether = NO;
        [self rebootTimer];

    }
    
    NSLog(@"%@",sender.userInfo[@"type"]);
}

//动画结束后删除View
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    if (!self.obscureWhether) {
        [self.registerView removeFromSuperview];
        [self.loginView    removeFromSuperview];
    }
}

//暗屏动画
-(void)changeImageView:(NSTimer*)sender {
    
    [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionCurveEaseOut  animations:^{
        self.myImageView.alpha = 0;
        
    } completion:^(BOOL finished) {

         self.myImageView.image = [UIImage imageNamed:@"earth_5"];
        [UIView animateWithDuration:2 animations:^{
            if (self.obscureWhether) {
                self.obscureView.alpha = 0.7f;
            }else{
                self.obscureView.alpha = 0;
            }
            self.myImageView.alpha = 1;
            
        }];
    }];
    
}
//模糊View
-(void)obfuscationWithImage:(UIView *)obscureV{
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
    obscureV.contentMode = UIViewContentModeScaleAspectFit;
    
    effectview.frame = obscureV.bounds;
    
    [obscureV addSubview:effectview];
}

//注销通知
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
