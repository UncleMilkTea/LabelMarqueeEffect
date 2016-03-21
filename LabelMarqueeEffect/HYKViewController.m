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

@end

@implementation HYKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];

    
}




- (void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    ScrollLabel *label = [[ScrollLabel alloc]initWithFrame:CGRectMake(40, 200, 300, 40)];

    label.hyk_timeInterval = 8;
    
    label.hyk_direction = Horizontal;

    label.backgroundColor = [UIColor yellowColor];
    
    [label hyk_scrollTitle:@"https://github.com/houyukun" andTitleColor:[UIColor redColor] andTitleSize:24];
    
    [self.view addSubview:label];
    

    

}


@end
