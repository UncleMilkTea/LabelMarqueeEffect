//
//  HYKLeftAndRightController.m
//  LabelMarqueeEffect
//
//  Created by 侯玉昆 on 16/3/22.
//  Copyright © 2016年 suger. All rights reserved.
//

#import "HYKLeftAndRightController.h"
#import "ScrollLabel.h"


@interface HYKLeftAndRightController ()

@end

@implementation HYKLeftAndRightController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
    
    
         ScrollLabel *label = [[ScrollLabel alloc]init];
    
        label.hyk_range = 10;
    
        label.hyk_timeInterval = 6;
    
        UILabel *l = [label hyk_leftAndRightLabelFrame:CGPointMake(140, 240) andTitle:@"https://github.com/houyukun"  andTitleColor:[UIColor redColor] andTitleSize:25];
    
        [self.view addSubview:l];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
