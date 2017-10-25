# CzJWaterMark

新增：
     textFont 水印字体大小
     textColor 水印颜色

使用说明

```object-c
#import "AddWaterMark.h"
```
1.图片全屏水印 Image full screen watermark


```object-c
<<<<<<< HEAD
AddWaterMark *makr = [[AddWaterMark alloc] init];
makr.textFont = [UIFont systemFontOfSize:14];
makr.textColor = [UIColor redColor];
UIImage *logo = [mark addWaterMark:bgImg watemarkText:@"exe-3035"];
=======
AddWaterMark *mark = [[AddWaterMark alloc] init];
UIImage *logo = [mark addWaterMark:bgImg watemarkText:@"WaterMark-我是水印"];
>>>>>>> 4690c48a60cd67dc5671a27a55709645226b7a7f
UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, logo.size.width, logo.size.height)];
imageview.image = logo;
[self.view addSubview:imageview];
```

2.全屏水印  full screen watermark

```object-c
AddWaterMark *mark = [[AddWaterMark alloc] init];
<<<<<<< HEAD
makr.textFont = [UIFont systemFontOfSize:14];
makr.textColor = [UIColor redColor];
UIImage *logo = [mark watemarkText:@"exe-3035"];
=======
UIImage *logo = [mark watemarkText:@"WaterMark-我是水印"];
[self.view setContentMode:UIViewContentModeBottomRight];
>>>>>>> 4690c48a60cd67dc5671a27a55709645226b7a7f
self.view.layer.contents = (__bridge id _Nullable)(logo.CGImage);
```
