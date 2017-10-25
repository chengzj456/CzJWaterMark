# CzJWaterMark

新增：

     textFont  水印字体大小
     textColor 水印颜色

使用说明

```object-c
#import "AddWaterMark.h"
```
1.图片全屏水印 Image full screen watermark


```object-c
AddWaterMark *makr = [[AddWaterMark alloc] init];
makr.textFont = [UIFont systemFontOfSize:14];
makr.textColor = [UIColor redColor];
UIImage *logo = [mark addWaterMark:bgImg watemarkText:@"WaterMark-我是水印"];
UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, logo.size.width, logo.size.height)];
imageview.image = logo;
[self.view addSubview:imageview];
```

2.全屏水印  full screen watermark

```object-c
AddWaterMark *mark = [[AddWaterMark alloc] init];
makr.textFont = [UIFont systemFontOfSize:14];
makr.textColor = [UIColor redColor];
UIImage *logo = [mark watemarkText:@"WaterMark-我是水印"];
self.view.layer.contents = (__bridge id _Nullable)(logo.CGImage);
```
