//
//  ViewController.m
//  AnimationTest
//
//  Created by Bear on 15/12/30.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "ViewController.h"
#import "CABasicAnimationViewController.h"
#import "CAKeyFrameAnimationDemoVC.h"
#import "RoundCirclePathAnimation.h"
#import "BlockTest.h"

static NSString *titleStr_CABasic = @"CABasicAnimationDemo";
static NSString *titleStr_CAKeyFrame = @"CAKeyFrameAnimationDemo";
static NSString *titleStr_CARoundPath = @"RoundCirclePathAnimation";
static NSString *titleStr_BlockTest = @"BlockTest";

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_tableView;
    NSArray     *_dataArray;
}


@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createUI];
}

- (void)createUI
{
    _dataArray = @[titleStr_CABasic,
                   titleStr_CAKeyFrame,
                   titleStr_CARoundPath,
                   titleStr_BlockTest,
                   ];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [UIView new];
    [self.view addSubview:_tableView];
}


#pragma TableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = @"MyCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    NSString *titleStr = _dataArray[indexPath.row];
    cell.textLabel.text = titleStr;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *selectTitle = _dataArray[indexPath.row];
    
    if ([selectTitle isEqualToString:titleStr_CABasic]) {
        CABasicAnimationViewController *destinationVC = [[CABasicAnimationViewController alloc] init];
        [self.navigationController pushViewController:destinationVC animated:YES];
    }
    
    else if ([selectTitle isEqualToString:titleStr_CAKeyFrame]) {
        CAKeyFrameAnimationDemoVC *destinationVC = [[CAKeyFrameAnimationDemoVC alloc] init];
        [self.navigationController pushViewController:destinationVC animated:YES];
    }
    
    else if ([selectTitle isEqualToString:titleStr_CARoundPath]) {
        RoundCirclePathAnimation *destinationVC = [[RoundCirclePathAnimation alloc] init];
        [self.navigationController pushViewController:destinationVC animated:YES];
    }
    
    else if ([selectTitle isEqualToString:titleStr_BlockTest]) {
        BlockTest *destinationVC = [[BlockTest alloc] init];
        [self.navigationController pushViewController:destinationVC animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
