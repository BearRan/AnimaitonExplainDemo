//
//  ViewController.m
//  AnimationTest
//
//  Created by Bear on 15/12/30.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    UIView          *canvansView;
    UIView          *rocketView;
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *startBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    [startBtn setTitle:@"开始" forState:UIControlStateNormal];
    [startBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(startBtnEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startBtn];
    
    [self createUI];
}

- (void)createUI
{
    canvansView = [[UIView alloc] initWithFrame:CGRectMake(20, 200, 200, 200)];
    canvansView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:canvansView];
    
    
    rocketView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    rocketView.backgroundColor = [UIColor greenColor];
    [canvansView addSubview:rocketView];
    [rocketView setMyCenter:dir_Vertical destinationView:nil parentRelation:YES];
}

- (void)startBtnEvent
{
    int select = 2;
    switch (select) {
        case 1: [self animation1];  break;
        case 2: [self animation2];  break;
            
        default:
            break;
    }
}


//  原始的动画
- (void)animation1
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    animation.toValue = [NSNumber numberWithInt:300];
    animation.duration = 1.0f;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    if (animation.fromValue == nil) {
        animation.fromValue = [rocketView.layer.presentationLayer valueForKey:animation.keyPath];
    }
    
    [rocketView.layer addAnimation:animation forKey:animation.keyPath];
}

//  根据文章写的动画，其实都一样了
- (void)animation2
{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
    animation.fromValue = @0;
    animation.toValue = @300;
    animation.duration = 1.0f;
    
    
    int select = 1;
    switch (select) {
        case 1:
            //  保持运动后的状态1
            rocketView.layer.position = CGPointMake(300, rocketView.center.y);
            break;
            
        case 2:
            //  保持运动后的状态2
            animation.removedOnCompletion = NO;
            animation.fillMode = kCAFillModeForwards;
            break;
            
        default:
            break;
    }
    
    [rocketView.layer addAnimation:animation forKey:@"basic"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
