//
//  RoundCirclePathAnimation.m
//  AnimationTest
//
//  Created by apple on 16/4/6.
//  Copyright (c) 2016年 apple. All rights reserved.
//

#import "RoundCirclePathAnimation.h"

@interface RoundCirclePathAnimation ()
{
    UIView *_boxView;
}

@end

@implementation RoundCirclePathAnimation

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createUI];
}

- (void)createUI
{
    _boxView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    _boxView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_boxView];
    [_boxView BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    
    [self roundAnimation];
    

}

- (void)roundAnimation
{
    CGFloat radius = 100;
    
    CAKeyframeAnimation *orbit = [CAKeyframeAnimation animation];
    orbit.keyPath = @"position";
    orbit.path = CGPathCreateWithEllipseInRect(CGRectMake(-radius, -radius, 2 * radius, 2 * radius), nil);
    orbit.duration = 4.0f;
    orbit.additive = YES;
//    orbit.repeatDuration = HUGE_VALF;
    orbit.calculationMode = kCAAnimationPaced;
    orbit.rotationMode = kCAAnimationRotateAuto;
//    orbit.autoreverses = YES;
    orbit.speed = 2;
    orbit.repeatCount = HUGE_VALF;
    orbit.beginTime = CACurrentMediaTime() + 10;
    
    [_boxView.layer addAnimation:orbit forKey:orbit.keyPath];
}

@end
