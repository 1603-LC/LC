//
//  LCMainLoginView.m
//  LC
//
//  Created by tarena01_07 on 16/7/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LCMainLoginView.h"

@implementation LCMainLoginView
//获取view的controller
- (UIViewController *)viewController
{
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)getBackController:(id)sender {
    [[self viewController]dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)goRegisterView:(id)sender {
    //创建一个消息对象
    NSNotification * notice = [NSNotification notificationWithName:@"myNotice" object:nil userInfo:@{@"type":@"goRegister"}];
    //发送消息
    [[NSNotificationCenter defaultCenter]postNotification:notice];
    
}
- (IBAction)goLoginView:(id)sender {
    //创建一个消息对象
    NSNotification * notice = [NSNotification notificationWithName:@"myNotice" object:nil userInfo:@{@"type":@"goLoginView"}];
    //发送消息
    [[NSNotificationCenter defaultCenter]postNotification:notice];
    
}


@end
