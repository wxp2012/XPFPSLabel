//
//  FPSLabelContainerVC.m
//  Aipai
//
//  Created by xp on 16/7/18.
//  Copyright © 2016年  All rights reserved.
//

#import "FPSLabelContainerVC.h"

@interface FPSLabelContainerVC ()
{
    UIViewController *presentedViewController;
    UIPanGestureRecognizer *_panGestureRecognizer;
}
@end

@implementation FPSLabelContainerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
}

//布局显示label的位置
- (void) presentViewController:(UIViewController *)viewController withSize:(CGSize)size
{
    presentedViewController = viewController;
    CGSize adjustedSize = CGSizeMake(MIN(size.width, CGRectGetWidth(self.view.bounds)),
                                     MIN(size.height, CGRectGetHeight(self.view.bounds)));
    
    //屏幕中间,偏移52个点
    CGFloat heightOffset = 0;
    CGFloat widthOffset = (CGRectGetWidth(self.view.bounds) - adjustedSize.width) / 2.0 + 52;
    
    CGRect frame = CGRectMake(widthOffset, heightOffset, adjustedSize.width, adjustedSize.height);
    
    [self addChildViewController:presentedViewController];
    presentedViewController.view.frame = frame;
    [self.view addSubview:presentedViewController.view];
    
    //添加移动手势可以拖动
    _panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panMoveOnScreen)];
    _panGestureRecognizer.minimumNumberOfTouches = 1;
    _panGestureRecognizer.maximumNumberOfTouches = 1;
    [presentedViewController.view addGestureRecognizer:_panGestureRecognizer];
}

//可拖动
- (void) panMoveOnScreen
{
    CGPoint translation = [_panGestureRecognizer translationInView:self.view];
    
    CGPoint center = presentedViewController.view.center;
    center.x += translation.x;
    center.y += translation.y;
    
    CGFloat centerHeightOffset = CGRectGetHeight(presentedViewController.view.frame) / 2.0;
    CGFloat centerWidthOffset = CGRectGetWidth(presentedViewController.view.frame) / 2.0;
    
    //确保在屏幕上
    if (center.y - centerHeightOffset < 0) {
        center.y = centerHeightOffset;
    }
    if (center.x - centerWidthOffset < 0) {
        center.x = centerWidthOffset;
    }
    //获取y轴坐标
    CGFloat maximumY = CGRectGetHeight(self.view.bounds) -  CGRectGetHeight(presentedViewController.view.frame);
    if (center.y - centerHeightOffset > maximumY) {
        center.y = maximumY + centerHeightOffset;
    }
    //获取到x轴坐标
    CGFloat maximumX = CGRectGetWidth(self.view.bounds) - CGRectGetWidth(presentedViewController.view.frame);
    if (center.x - centerWidthOffset > maximumX) {
        center.x = maximumX + centerWidthOffset;
    }
    //y轴和x轴相交的点为中心点
    presentedViewController.view.center = center;
    
    [_panGestureRecognizer setTranslation:CGPointZero inView:self.view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
