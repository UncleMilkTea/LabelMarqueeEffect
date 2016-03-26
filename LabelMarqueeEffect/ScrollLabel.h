//
//  ScrollLabel.h
//  LabelMarqueeEffect
//
//  Created by 侯玉昆 on 16/3/21.
//  Copyright © 2016年 suger. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    
        Horizontal,
    
        Vertical,
    
} hyk_scrollWithDirection;

@interface ScrollLabel : UIScrollView

//设置动画时长
@property(nonatomic,assign) NSInteger hyk_timeInterval;

//设置动画效果
@property (nonatomic,assign) UIViewAnimationOptions hyk_animationOption;

//设置左右滚动的幅度
@property(assign,nonatomic) CGFloat hyk_range;

//设置label的滚动方向
@property(assign,nonatomic) hyk_scrollWithDirection hyk_direction;


/**
 *  匀速滚动
 */
- (void)hyk_scrollTitle:(NSString *)title andTitleColor:(UIColor *)color andTitleSize:(CGFloat)size;

/**
 *  惯性滚动
 */
- (void)hyk_reduceScrollTitle:(NSString *)title andTitleColor:(UIColor *)color andTitleSize:(CGFloat)size;

/**
 *   左右循环滚动
 */
- (UILabel *)hyk_leftAndRightLabelFrame:(CGPoint)point andTitle:(NSString *)title andTitleColor:(UIColor *)color andTitleSize:(CGFloat)size;

/**
 *  单次滚动
 */
- (UILabel *)hyk_onceLabelFrame:(CGPoint)point andTitle:(NSString *)title andTitleColor:(UIColor *)color andTitleSize:(CGFloat)size;
/**
 *  暂停滚动
 */
- (void)hyk_pause;

/**
 *  开始滚动
 */
- (void)hyk_start;
@end
