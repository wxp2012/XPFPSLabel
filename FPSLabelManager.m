//
//  FPSLabelManager.m
//  Aipai
//
//  Created by xp on 16/7/18.
//  Copyright © 2016年  All rights reserved.
//

#import "FPSLabelManager.h"
#import "FPSLabelRootWindow.h"
#import "FPSLabelRootVC.h"
#import "FPSLabelContainerVC.h"

@interface FPSLabelManager ()<FPSLabelRootWindowDelegate>

@property (nonatomic, strong) FPSLabelRootWindow *fpsLabelWindow;
@property (nonatomic, strong) FPSLabelRootVC *fpsLabelVC;
@property (nonatomic, strong) FPSLabelContainerVC *containerVC;

@end

@implementation FPSLabelManager

- (instancetype) init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

#pragma mark - Private methods
- (void) setup
{
    _containerVC = [FPSLabelContainerVC new];
    _fpsLabelWindow = [[FPSLabelRootWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _fpsLabelWindow.rootViewController = _containerVC;
    _fpsLabelWindow.hidden = NO;
    _fpsLabelWindow.touchesDelegate = self;
    _fpsLabelVC = [FPSLabelRootVC new];
    [_containerVC presentViewController:_fpsLabelVC
                                           withSize:CGSizeMake(52,
                                                               52)];
}

#pragma mark - FPSLabelRootWindowDelegate
- (BOOL)window:(UIWindow *)window shouldReceiveTouchAtPoint:(CGPoint)point
{
    return CGRectContainsPoint(_fpsLabelVC.view.bounds,
                               [_fpsLabelVC.view convertPoint:point
                                                                   fromView:window]);
}

@end
