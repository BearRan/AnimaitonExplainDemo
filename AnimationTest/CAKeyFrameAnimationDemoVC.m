//
//  CAKeyFrameAnimationDemoVC.m
//  AnimationTest
//
//  Created by Bear on 16/3/31.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CAKeyFrameAnimationDemoVC.h"

@interface CAKeyFrameAnimationDemoVC ()
{
    UIButton *_testBtn;
}

@end

@implementation CAKeyFrameAnimationDemoVC

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _testBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    _testBtn.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];
    [_testBtn setTitle:@"Click" forState:UIControlStateNormal];
    [_testBtn addTarget:self action:@selector(btnEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_testBtn];
    [_testBtn BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    
    // Do any additional setup after loading the view.
}

- (void)btnEvent
{
    CGFloat tempCenterX = _testBtn.centerX;
    
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animation];
    keyFrameAnimation.values = @[@(tempCenterX - 10),
                                 @(tempCenterX + 10),
                                 @(tempCenterX - 10),
                                 @(tempCenterX + 10),
                                 @(tempCenterX + 0)];
    keyFrameAnimation.duration = 0.4f;
    keyFrameAnimation.keyPath = @"position.x";
    [_testBtn.layer addAnimation:keyFrameAnimation forKey:@"shake"];
}

@end
