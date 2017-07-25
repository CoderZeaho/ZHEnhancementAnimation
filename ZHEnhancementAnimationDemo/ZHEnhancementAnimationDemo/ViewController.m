//
//  ViewController.m
//  ZHEnhancementAnimationDemo
//
//  Created by Zeaho on 2017/7/25.
//  Copyright © 2017年 Northeast Dianli University. All rights reserved.
//

#import "ViewController.h"
#import "ZHEnhancementLayer.h"

@interface ViewController ()

@property (nonatomic, strong) ZHEnhancementLayer *enhancementLayer;

@end

@implementation ViewController{
    BOOL _isPause;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _isPause = 0;
    
    self.enhancementLayer = [[ZHEnhancementLayer alloc] init];
    self.enhancementLayer.position = self.view.center;
    
    [[[self view] layer] insertSublayer:[self enhancementLayer] above:[[self view] layer]];
    
    //重新构造大小弧的路径
    [self.enhancementLayer rebuildNormalAcrPathWithCenter:CGPointMake(0, 0) radius:100 startAngle:0.8*M_PI endAngle:1.2*M_PI clockwise:YES];
    [self.enhancementLayer rebuildSmallAcrPathWithCenter:CGPointMake(0, 0) radius:80 startAngle:0.8*M_PI endAngle:1.2*M_PI clockwise:YES];
    //设置弧宽度
    self.enhancementLayer.arcLineWidth = 3.f;
    //设置弧颜色
    self.enhancementLayer.acrLineColor = [UIColor redColor];
    //设置动画时间
    self.enhancementLayer.animationDuration = 3.f;
    //开启动画
    [[self enhancementLayer] startAnimation];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (_isPause == 0) {
        //暂停动画
        [[self enhancementLayer] pauseAnimate];
        _isPause = 1;
    } else {
        //继续动画
        [[self enhancementLayer] resumeAnimate];
        _isPause = 0;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
