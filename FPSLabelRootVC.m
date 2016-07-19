//
//  FPSLabelRootVC.m
//  Aipai
//
//  Created by xp on 16/7/18.
//  Copyright © 2016年  All rights reserved.
//

#import "FPSLabelRootVC.h"

@interface FPSLabelRootVC ()

@property (nonatomic,strong) FPSShowLabel *fpsLabel;

@end

@implementation FPSLabelRootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    //label的大小
    _fpsLabel = [FPSShowLabel new];
    _fpsLabel.frame = CGRectMake(0, 0, 52, 52/2);
    [_fpsLabel sizeToFit];
    [self.view addSubview:_fpsLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
