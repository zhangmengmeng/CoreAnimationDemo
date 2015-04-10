//
//  QYAnimsGrpVC.m
//  CoreAnimationDemo
//
//  Created by qingyun on 15-4-2.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "QYAnimsGrpVC.h"

@interface QYAnimsGrpVC ()
@property (nonatomic, strong) CALayer *cuteLayer;
@end

@implementation QYAnimsGrpVC

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
    
    // 向cuteLayer添加一组动画
    // 1. 缩放动画
    CABasicAnimation *scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnim.duration = 2;
    scaleAnim.toValue = @1.2;
    scaleAnim.fillMode = kCAFillModeForwards;
    
    // 2. 颜色渐变动画
    CABasicAnimation *colorAnim = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    colorAnim.beginTime = 0.5;
    colorAnim.duration = 1.5;
//    colorAnim.fromValue = (__bridge id)([UIColor yellowColor].CGColor);
    colorAnim.toValue = (__bridge id)([UIColor blueColor].CGColor);
    colorAnim.fillMode = kCAFillModeForwards;
    
    // 3. 旋转动画
    CABasicAnimation *rotateAnim = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotateAnim.beginTime = 0.5;
    rotateAnim.duration = 0.5;
    rotateAnim.toValue = @(M_PI_4);
    rotateAnim.fillMode = kCAFillModeForwards;
    
    CAAnimationGroup *grp = [CAAnimationGroup animation];
    grp.animations = @[scaleAnim, colorAnim, rotateAnim];
    
    grp.duration = 2.25;
    grp.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    grp.autoreverses = YES;
    grp.repeatCount = INT_MAX;
    
    [_cuteLayer addAnimation:grp forKey:nil];

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
