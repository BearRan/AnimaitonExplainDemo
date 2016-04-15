//
//  BlockTest.m
//  AnimationTest
//
//  Created by apple on 16/4/15.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "BlockTest.h"

@interface BlockTest ()
{
    void (^block1)(void);
}

@end

@implementation BlockTest

- (void)viewDidLoad
{
    self.view.backgroundColor = [UIColor whiteColor];
    int a = sumblocks(2,3);
    
    NSLog(@"a:%d", a);
    
    CGPoint (^pointBlock)(CGPoint point1) = ^(CGPoint point1){
        return point1;
    };
    
    CGPoint tempPoint = pointBlock(CGPointMake(0, 0));
    NSLog(@"tempPoint:%@", NSStringFromCGPoint(tempPoint));
    
    NSLog(@"self:%@", self);
    
    __weak BlockTest *weakSelf = self;
    __weak typeof(*&self) weakSelf1 = self;
    block1 = ^{
        NSLog(@"self:%@", weakSelf);
        NSLog(@"self:%@", weakSelf1);
    };
}


int (^sumblocks)(int a, int b) = ^(int a, int b){
    return a + b;
};

@end
