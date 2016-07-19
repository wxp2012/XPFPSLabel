//
//  FPSLabelRootWindow.h
//  Aipai
//
//  Created by xp on 16/7/18.
//  Copyright © 2016年  All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FPSLabelRootWindowDelegate <NSObject>

- (BOOL)window:(nullable UIWindow *)window shouldReceiveTouchAtPoint:(CGPoint)point;

@end

@interface FPSLabelRootWindow : UIWindow

@property (nonatomic, weak, nullable) id<FPSLabelRootWindowDelegate> touchesDelegate;

@end
