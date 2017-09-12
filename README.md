# ZHEnhancementAnimation
基于CAReplicatorLayer,通过CAKeyframeAnimation实现第一个ArcLayer出现后出现第二个ArcLayer,然再一起消失的动画,类似声呐扩散效果,效果图如下:

![效果图](https://i.loli.net/2017/09/12/59b74ab21b99f.gif)

How to use
--
###Improt

```
#import "ZHEnhancementLayer.h"
```
###Initialization

```
@property (nonatomic, strong) ZHEnhancementLayer *enhancementLayer;
```

```
self.enhancementLayer = [[ZHEnhancementLayer alloc] init];
self.enhancementLayer.position = self.view.center;    
[[[self view] layer] insertSublayer:[self enhancementLayer] above:[[self view] layer]];
    
//重新构造大小弧的路径
[[self enhancementLayer] rebuildNormalAcrPathWithCenter:CGPointMake(0, 0) radius:100 startAngle:0.8*M_PI endAngle:1.2*M_PI clockwise:YES];
[[self enhancementLayer] rebuildSmallAcrPathWithCenter:CGPointMake(0, 0) radius:80 startAngle:0.8*M_PI endAngle:1.2*M_PI clockwise:YES];
//设置弧宽度
self.enhancementLayer.arcLineWidth = 3.f;
//设置弧颜色
self.enhancementLayer.acrLineColor = [UIColor redColor];
//设置动画时间
self.enhancementLayer.animationDuration = 3.f;
//开启动画
[[self enhancementLayer] startAnimation];
```
##Thank you for reviewing


