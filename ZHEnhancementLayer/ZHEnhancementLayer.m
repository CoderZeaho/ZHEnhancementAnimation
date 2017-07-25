//
//  ZHEnhancementLayer.m
//  EnhancementAnimation
//
//  Created by Zeaho on 2017/7/22.
//  Copyright © 2017年 Northeast Dianli University. All rights reserved.
//

#import "ZHEnhancementLayer.h"

@interface ZHEnhancementLayer ()

@property (nonatomic, strong) CAShapeLayer *normalArcLayer;
@property (nonatomic, strong) CAShapeLayer *smallArcLayer;

@property (nonatomic, strong) CAKeyframeAnimation *normalArcOpacityAnimation;
@property (nonatomic, strong) CAKeyframeAnimation *smallArcOpacityAnimation;

@end

@implementation ZHEnhancementLayer

- (instancetype)init {
    
    self = [super init];
    if (self) {
        [self _createSublayers];
        [self _configurateSublayersDefault];
        [self _installConstraints];
    }
    return self;
}

#pragma mark - private

- (void)_createSublayers {
    
    self.arcLineWidth = 5.f;
    self.acrLineColor = [UIColor blackColor];
    
    [self addSublayer:[self normalArcLayer]];
    [self addSublayer:[self smallArcLayer]];
}

- (void) _configurateSublayersDefault {

    self.repeatCount = INFINITY;
    self.instanceCount = 2;
    self.instanceTransform = CATransform3DMakeRotation(M_PI, 0, 0, 1);

    self.animationDuration = 2;
}

- (void)_installConstraints {
    
    self.normalArcLayer.position = self.position;
    self.smallArcLayer.position = self.position;
}

- (void)_creatSublayersAnimation {
    
    _normalArcOpacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    _normalArcOpacityAnimation.values = @[@0, @0, @1, @1, @0];
    _normalArcOpacityAnimation.keyTimes = @[@0, @.2, @.6, @.8, @1];
    _normalArcOpacityAnimation.beginTime = CACurrentMediaTime();
    _normalArcOpacityAnimation.duration = self.animationDuration;
    _normalArcOpacityAnimation.repeatCount = INFINITY;
    _normalArcOpacityAnimation.removedOnCompletion = NO;
    _normalArcOpacityAnimation.fillMode = kCAFillModeRemoved;
    
    _smallArcOpacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    _smallArcOpacityAnimation.values = @[@0, @1, @1, @1, @0];
    _smallArcOpacityAnimation.keyTimes = @[@0, @.4, @.6, @.8, @1];
    _smallArcOpacityAnimation.duration = self.animationDuration;
    _smallArcOpacityAnimation.beginTime = CACurrentMediaTime();
    _smallArcOpacityAnimation.repeatCount = INFINITY;
    _smallArcOpacityAnimation.removedOnCompletion = NO;
    _smallArcOpacityAnimation.fillMode = kCAFillModeRemoved;
}

- (void)startAnimation {
    
    [self _creatSublayersAnimation];
    
    [[self normalArcLayer] addAnimation:_normalArcOpacityAnimation forKey:nil];
    [[self smallArcLayer] addAnimation:_smallArcOpacityAnimation forKey:nil];
}

- (void)pauseAnimate {
    
    CFTimeInterval pausedTime = [self convertTime:CACurrentMediaTime() fromLayer:nil];
    self.speed = 0.0;
    self.timeOffset = pausedTime;
}

- (void)resumeAnimate {
    
    CFTimeInterval pausedTime = [self timeOffset];
    self.speed = 1.0;
    self.timeOffset = 0.0;
    self.beginTime = 0.0;
    CFTimeInterval timeSincePause = [self convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    self.beginTime = timeSincePause;
}

- (void)rebuildNormalAcrPathWithCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise {
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:clockwise];
    self.normalArcLayer.path = [path CGPath];
}

- (void)rebuildSmallAcrPathWithCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise {
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:clockwise];
    self.smallArcLayer.path = [path CGPath];
}

#pragma mark - setter && getter

- (void)setArcLineWidth:(CGFloat)arcLineWidth {
    if (_arcLineWidth != arcLineWidth) {
        _arcLineWidth = arcLineWidth;
        self.normalArcLayer.lineWidth = self.smallArcLayer.lineWidth = arcLineWidth;
    }
}

- (void)setAcrLineColor:(UIColor *)acrLineColor {
    if (_acrLineColor != acrLineColor) {
        _acrLineColor = acrLineColor;
        self.normalArcLayer.strokeColor = self.smallArcLayer.strokeColor = acrLineColor.CGColor;
    }
}

#pragma mark - lazy loading

- (CAShapeLayer *)normalArcLayer {
    if (!_normalArcLayer) {
        _normalArcLayer = [[CAShapeLayer alloc] init];
        _normalArcLayer.lineWidth = self.arcLineWidth;
        _normalArcLayer.strokeColor = self.acrLineColor.CGColor;
        _normalArcLayer.fillColor = [UIColor clearColor].CGColor;
        CGFloat radius = 80.f;
        BOOL clockWise = true;
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(0, 0) radius:radius startAngle:0.8*M_PI endAngle:1.2f*M_PI clockwise:clockWise];
        _normalArcLayer.path = [path CGPath];
        _normalArcLayer.opacity = 0;
    }
    return _normalArcLayer;
}

- (CAShapeLayer *)smallArcLayer {
    if (!_smallArcLayer) {
        _smallArcLayer = [[CAShapeLayer alloc] init];
        _smallArcLayer.lineWidth = self.arcLineWidth;
        _smallArcLayer.strokeColor = self.acrLineColor.CGColor;
        _smallArcLayer.fillColor = [UIColor clearColor].CGColor;
        CGFloat radius = 50.f;
        BOOL clockWise = true;
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(0, 0) radius:radius startAngle:0.8*M_PI endAngle:1.2*M_PI clockwise:clockWise];
        _smallArcLayer.path = [path CGPath];
        _smallArcLayer.opacity = 0;
    }
    return _smallArcLayer;
}

@end
