//
//  CALayer+MyCALayer.m
//  Hambuger-OC
//
//  Created by apple on 15/12/28.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "CALayer+MyCALayer.h"

@implementation CALayer (MyCALayer)

- (void)ocb_applyAnimation:(CABasicAnimation *)animation
{
    if (animation.fromValue == nil) {
        animation.fromValue = [self.presentationLayer valueForKey:animation.keyPath];
    }

    [self addAnimation:animation forKey:animation.keyPath];
    [self setValue:animation.toValue forKey:animation.keyPath];
}

@end
