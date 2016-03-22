//
//  ViewController.m
//  LabelMarqueeEffect
//
//  Created by 侯玉昆 on 16/3/21.
//  Copyright © 2016年 suger. All rights reserved.
//

#import "ViewController.h"
#import "HYKViewController.h"
#import "ScrollLabel.h"
#import "HYKReduceController.h"
#import "HYKLeftAndRightController.h"
#import "HYKUpDownController.h"
#import "HYKOnceController.h"


@interface ViewController ()

@end

@implementation ViewController

- (IBAction)clickBtn:(UIButton *)sender {
    
    switch (sender.tag) {
        case 1:
             [self.navigationController pushViewController: [[HYKViewController alloc]init] animated:YES];
            break;
        case 2:
            [self.navigationController pushViewController: [[HYKReduceController alloc]init] animated:YES];
            break;
        case 3:
            [self.navigationController pushViewController: [[HYKLeftAndRightController alloc]init] animated:YES];
            break;
        case 4:
            [self.navigationController pushViewController: [[HYKUpDownController alloc]init] animated:YES];
            break;
        case 5:
            [self.navigationController pushViewController: [[HYKOnceController alloc]init] animated:YES];
            break;
            
    }
    
   
}

@end
