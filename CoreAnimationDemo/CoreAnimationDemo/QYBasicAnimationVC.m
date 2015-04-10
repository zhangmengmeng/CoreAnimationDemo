//
//  QYBasicAnimationVC.m
//  CoreAnimationDemo
//
//  Created by qingyun on 15-4-2.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "QYBasicAnimationVC.h"

@interface QYBasicAnimationVC ()
@property (nonatomic, strong) CALayer *cuteLayer;
@end

@implementation QYBasicAnimationVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // 创建并添加layer
    _cuteLayer = [CALayer layer];
    
    // 外观
    _cuteLayer.backgroundColor = [UIColor redColor].CGColor;
    _cuteLayer.cornerRadius = 12; // 圆角
    
    // 几何属性
    _cuteLayer.bounds = CGRectMake(0, 0, 200, 200);
    _cuteLayer.position = self.view.center;
    
    [self.view.layer addSublayer:_cuteLayer];
    
    // 设置layer的动画
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
//    anim.fromValue =
    anim.toValue = @1.1;
    anim.duration = 0.5;
    
    // 时间函数
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    anim.autoreverses = YES;
    anim.repeatCount = INT_MAX;
    
    
    [_cuteLayer addAnimation:anim forKey:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
