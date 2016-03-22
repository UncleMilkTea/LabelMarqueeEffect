//
//  HYKViewController.m
//  LabelMarqueeEffect
//
//  Created by 侯玉昆 on 16/3/21.
//  Copyright © 2016年 suger. All rights reserved.
//

#import "HYKViewController.h"
#import "ScrollLabel.h"

@interface HYKViewController ()

@property(strong,nonatomic) ScrollLabel *label;

@end

@implementation HYKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];

    UIButton *start = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [start setTitle:@"开始" forState:UIControlStateNormal];
    
    start.frame = CGRectMake(40, 250, 100, 40);
    
    [start addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:start];
    
    UIButton *pause = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [pause setTitle:@"暂停" forState:UIControlStateNormal];
    
    pause.frame = CGRectMake(240, 250, 100, 40);
    
    [pause addTarget:self action:@selector(pause) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:pause];
    
}


- (void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    _label = [[ScrollLabel alloc]initWithFrame:CGRectMake(40, 200, 300, 40)];

    _label.hyk_timeInterval = 8;
    
    _label.hyk_direction = Horizontal;

    _label.backgroundColor = [UIColor yellowColor];
    
    [_label hyk_scrollTitle:@"https://github.com/houyukun" andTitleColor:[UIColor redColor] andTitleSize:24];
    
    [self.view addSubview:_label];
}

- (void)start{
    
    [_label hyk_start];
    
}
- (void)pause{
    
    [_label hyk_pause];
}

@end
