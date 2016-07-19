//
//  FPSLabelRootWindow.m
//  Aipai
//
//  Created by xp on 16/7/18.
//  Copyright © 2016年  All rights reserved.
//

#import "FPSLabelRootWindow.h"

@implementation FPSLabelRootWindow

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.windowLevel = UIWindowLevelStatusBar;
    }
    return self;
}

- (BOOL) pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    if ([_touchesDelegate window:self shouldReceiveTouchAtPoint:point]) {
        return [super pointInside:point withEvent:event];
    }
    return NO;
}

@end
