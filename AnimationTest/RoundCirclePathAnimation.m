//
//  RoundCirclePathAnimation.m
//  AnimationTest
//
//  Created by apple on 16/4/6.
//  Copyright (c) 2016年 apple. All rights reserved.
//

#import "RoundCirclePathAnimation.h"

@implementation RoundCirclePathAnimation

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
