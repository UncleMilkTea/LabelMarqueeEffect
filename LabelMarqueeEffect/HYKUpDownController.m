//
//  HYKUpDownController.m
//  LabelMarqueeEffect
//
//  Created by 侯玉昆 on 16/3/22.
//  Copyright © 2016年 suger. All rights reserved.
//

#import "HYKUpDownController.h"
#import "ScrollLabel.h"

@interface HYKUpDownController ()

@end

@implementation HYKUpDownController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
    
    
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    ScrollLabel *label = [[ScrollLabel alloc]initWithFrame:CGRectMake(10, 200, 350, 40)];
    
    label.hyk_timeInterval = 3;
    
    label.hyk_direction = Vertical;
    
    label.backgroundColor = [UIColor yellowColor];
    
    [label hyk_scrollTitle:@"https://github.com/houyukun" andTitleColor:[UIColor redColor] andTitleSize:24];
    
    [self.view addSubview:label];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
