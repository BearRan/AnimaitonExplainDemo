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
    UIView *_testView;
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
    
    _testView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    _testView.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];
    [self.view addSubview:_testView];
    [_testView BearSetCenterToParentViewWithAxis:kAXIS_X_Y];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
