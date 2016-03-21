//
//  ScrollLabel.m
//  LabelMarqueeEffect
//
//  Created by 侯玉昆 on 16/3/21.
//  Copyright © 2016年 suger. All rights reserved.
//

#import "ScrollLabel.h"

#define kConstrainedSize CGSizeMake(CGFLOAT_MAX, 40)




@interface ScrollLabel ()

// 滚动label
@property (nonatomic,strong) UILabel *firstLabel;
@property (nonatomic,strong) UILabel *secondLabel;

// 计时器
@property(strong,nonatomic) NSTimer *timer;

// label间隔
@property(assign,nonatomic) NSInteger space;

// label初始位置
@property(assign,nonatomic) CGRect firstLabelInitialFrame;
@property(assign,nonatomic) CGRect secondLabelInitialFrame;

// scrollView位置
@property(assign,nonatomic) CGRect scrollViewFrame;

// 刷新模式
@property(assign,nonatomic) NSInteger mode;

@end

@implementation ScrollLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.showsVerticalScrollIndicator = NO;
        
        self.showsHorizontalScrollIndicator = NO;
        
        self.bounces = NO;
        
        self.userInteractionEnabled = NO;
        
        self.hyk_animationOption = 0;
        
        self.scrollViewFrame = frame;
        
        self.hyk_direction = Horizontal;

    }
    return self;
}

/**
 *  设置滚动文字的属性
 *
 *  @param title     标题
 *  @param color     颜色
 *  @param size      大小
 *  @param space     间隔
 */
- (void)hyk_scrollTitle:(NSString *)title andTitleColor:(UIColor *)color andTitleSize:(CGFloat)size{
    
    CGSize labelSize = [self setLabelSize:size andText:title];
    
    self.contentSize = labelSize;
    
    //判断是title的长还是Scroll的长
    if (_scrollViewFrame.size.width > labelSize.width) {
        
        _space = _scrollViewFrame.size.width - labelSize.width;
        
    }else{
        
        _space = labelSize.width - _scrollViewFrame.size.width ;
    }
    
    //滚动方向判断
    if (_hyk_direction == Horizontal){
    //初始化第一次显示的label
    _firstLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, labelSize.width, labelSize.height)];
    
    //初始化后面第二次显示的label在第一次的后面
        _secondLabel = [[UILabel alloc]initWithFrame:CGRectMake(labelSize.width + _space ,0 , labelSize.width, labelSize.height)];
    }else{
        
        _firstLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, labelSize.width, labelSize.height)];
        
        _secondLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,labelSize.height + 10 , labelSize.width, labelSize.height)];
    }
    
    _firstLabel.text = title;
    _firstLabel.textColor = color;
    _firstLabel.font = [UIFont systemFontOfSize:size];
    _firstLabel.backgroundColor = [UIColor clearColor];
    
    _secondLabel.text = title;
    _secondLabel.textColor = color;
    _secondLabel.font = [UIFont systemFontOfSize:size];
    _secondLabel.backgroundColor = [UIColor clearColor];

    
    [self addSubview:_firstLabel];
    [self addSubview:_secondLabel];
    
    //保存两个label初始位置
    _firstLabelInitialFrame = _firstLabel.frame;
    _secondLabelInitialFrame = _secondLabel.frame;
    
    //开始滚动
    [self beginScrollwithMode:0]; _mode = 0;
}
/**
 *  只滚动一次
 *
 *  @param title 标题
 *  @param color 颜色
 *  @param size  大小
 */
- (void)hyk_reduceScrollTitle:(NSString *)title andTitleColor:(UIColor *)color andTitleSize:(CGFloat)size{
    
    CGSize labelSize = [self setLabelSize:size andText:title];
    
    self.contentSize = labelSize;
    
    _firstLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, labelSize.width, labelSize.height)];
    
    _scrollViewFrame = _firstLabel.frame;

    _firstLabel.text = title;
    _firstLabel.textColor = color;
    _firstLabel.font = [UIFont systemFontOfSize:size];
    _firstLabel.backgroundColor = [UIColor clearColor];
    
    [self addSubview:_firstLabel];
    
    _firstLabelInitialFrame = _firstLabel.frame;
    
    [self beginScrollwithMode:1]; _mode = 1;
}


/**
 *  开启计时器
 */
-(void)beginScrollwithMode:(NSUInteger)mode{

    if (_hyk_timeInterval < 1) {
        
        _hyk_timeInterval = 3;
    }
    if(mode == 0){
        
    _timer = [NSTimer timerWithTimeInterval:_hyk_timeInterval target:self selector:@selector(labelAnimation) userInfo:nil repeats:YES];
        
    }else{
        _timer = [NSTimer timerWithTimeInterval:_hyk_timeInterval target:self selector:@selector(labelAnimationReduce) userInfo:nil repeats:YES];
    }
    
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];

}

/**
 *  暂停滚动
 */
- (void)hyk_pause{
    
    if (_timer) {
        
        [_timer invalidate];
        
        _timer = nil;
    }
}

/**
 *  开始滚动
 */
- (void)hyk_start{
    
    if ([_timer isValid]) return;
    
    [self beginScrollwithMode:_mode];
}

/**
 *  连续滚动动画
 */
- (void)labelAnimation{
    
    //设定默认值(匀速滚动)
    if (_hyk_animationOption == 0) {
        
        _hyk_animationOption = UIViewAnimationOptionCurveLinear;
    }
    
    [UIView animateWithDuration:_hyk_timeInterval - 0.2 delay:0 options:_hyk_animationOption animations:^{
        
        if(_hyk_direction == Horizontal){
            
            _firstLabel.frame = CGRectMake(_firstLabel.frame.origin.x - _firstLabel.frame.size.width - _space, _firstLabel.frame.origin.y, _firstLabel.frame.size.width, _firstLabel.frame.size.height);
            
            _secondLabel.frame = CGRectMake(_secondLabel.frame.origin.x - _secondLabel.frame.size.width - _space, _secondLabel.frame.origin.y, _secondLabel.frame.size.width, _secondLabel.frame.size.height);
            
        }else{
            
            _firstLabel.frame = CGRectMake(_firstLabel.frame.origin.x , _firstLabel.frame.origin.y- _firstLabel.frame.size.height - 10, _firstLabel.frame.size.width, _firstLabel.frame.size.height);
            
            _secondLabel.frame = CGRectMake(_secondLabel.frame.origin.x , _secondLabel.frame.origin.y- _secondLabel.frame.size.height - 10, _secondLabel.frame.size.width, _secondLabel.frame.size.height);
        }
    
           } completion:^(BOOL finished) {
        
        //动画完成后将label回归原位
        _firstLabel.frame = _firstLabelInitialFrame;
        
        _secondLabel.frame = _secondLabelInitialFrame;
    }];
}
/**
 *  左右滚动
 */
-(UILabel *)hyk_leftAndRightLabelFrame:(CGPoint)point andTitle:(NSString *)title andTitleColor:(UIColor *)color andTitleSize:(CGFloat)size{
    
    
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:size]};
    
    CGSize labelSize = [title sizeWithAttributes:attributes];
    
    

    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(point.x, point.y, labelSize.width, labelSize.height)];
    
    //取消、停止所有的动画
    [label.layer removeAllAnimations];
    
    label.text = title;
    label.textColor = color;
    label.font = [UIFont systemFontOfSize:size];
    label.backgroundColor = [UIColor clearColor];
    
    CGRect labelFrame = label.frame;
    
    labelFrame.size.width = labelSize.width;
    
    label.frame = labelFrame;
    
    const CGFloat width = _hyk_range == 0 ? 100 : _hyk_range;
    
    if (labelSize.width > width) {
        
        float offset = labelSize.width - width;
        
        [UIView animateWithDuration:_hyk_timeInterval = _hyk_timeInterval < 1 ? 3 : _hyk_timeInterval
                              delay:0
                            options:UIViewAnimationOptionRepeat //动画重复的主开关
         |UIViewAnimationOptionAutoreverse //动画重复自动反向，需要和上面这个一起用
         |UIViewAnimationOptionCurveLinear //动画的时间曲线，滚动字幕线性比较合理
                         animations:^{
                             
                             label.transform = CGAffineTransformMakeTranslation(-offset, 0);
                             
                         }
                         completion:^(BOOL finished) {
                             
                         }
         ];
    }
    
    return label;
}

/**
 *  单次滚动
 */
-(UILabel *)hyk_onceLabelFrame:(CGPoint)point andTitle:(NSString *)title andTitleColor:(UIColor *)color andTitleSize:(CGFloat)size{
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(point.x, point.y, 0, 0)];
    
        label.text = title;
        label.textColor = color;
        label.font = [UIFont systemFontOfSize:size];
        label.backgroundColor = [UIColor clearColor];
    
        [label sizeToFit];
        CGRect frame = label.frame;
        frame.origin.x = _hyk_range == 0 ? 320 : _hyk_range;
        label.frame = frame;
    
        [UIView beginAnimations:@"testAnimation" context:NULL];
        [UIView setAnimationDuration:_hyk_timeInterval = _hyk_timeInterval < 1 ? 3 : _hyk_timeInterval];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationRepeatAutoreverses:NO];
        [UIView setAnimationRepeatCount:CGFLOAT_MAX];
    
        frame = label.frame;
        frame.origin.x = -frame.size.width;
        label.frame = frame;
        [UIView commitAnimations];

    return label;
}


// 惯性滚动动画
-(void)labelAnimationReduce{
    
    if (_hyk_animationOption == 0) {
        
        _hyk_animationOption = UIViewAnimationOptionCurveLinear;
    }
    [UIView animateWithDuration:_hyk_timeInterval-0.1 delay:0 options:_hyk_animationOption animations:^{
        
        if (_firstLabel.frame.origin.x == 0) {
            
            _firstLabel.frame = CGRectMake(_firstLabel.frame.origin.x -  _firstLabel.frame.size.width, _firstLabel.frame.origin.y, _firstLabel.frame.size.width, _firstLabel.frame.size.height);
        }else{
            
            _firstLabel.frame = CGRectMake(_firstLabel.frame.origin.x -  _firstLabel.frame.size.width - _scrollViewFrame.size.width, _firstLabel.frame.origin.y, _firstLabel.frame.size.width, _firstLabel.frame.size.height);
        }
        
        
    } completion:^(BOOL finished) {
        
        _firstLabel.frame = CGRectMake(_scrollViewFrame.size.width, _firstLabel.frame.origin.y, _firstLabel.frame.size.width, _firstLabel.frame.size.height);
    }];
}


/**
 *  设置label的大小
 *
 *  @param size  大小
 *  @param title 内容
 *
 *  @return 返回label大小
 */
- (CGSize)setLabelSize:(CGFloat)size andText:(NSString *)title{
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:size], NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    return [title boundingRectWithSize:kConstrainedSize options: NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;

}
@end
