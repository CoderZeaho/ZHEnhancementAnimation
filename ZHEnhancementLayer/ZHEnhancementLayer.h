//
//  ZHEnhancementLayer.h
//  EnhancementAnimation
//
//  Created by Zeaho on 2017/7/22.
//  Copyright © 2017年 Northeast Dianli University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ZHEnhancementLayer : CAReplicatorLayer

/**
    弧的宽度
 */
@property (nonatomic, assign) CGFloat arcLineWidth;

/**
    弧的颜色
 */
@property (nonatomic, strong) UIColor *acrLineColor;
/**
    动画时间
 */
@property (nonatomic, assign) NSTimeInterval animationDuration;

/**
    开启动画
 */
- (void)startAnimation;

/**
    暂停动画
 */
- (void)pauseAnimate;


/**
    继续动画
 */
- (void)resumeAnimate;

/**
    重新构造弧的路径

 @param center 中心点
 @param radius 半径
 @param startAngle 起点角度
 @param endAngle 终点角度
 @param clockwise 顺时针方向
 */
- (void)rebuildNormalAcrPathWithCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise;

- (void)rebuildSmallAcrPathWithCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise;

@end
