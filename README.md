# CzJWaterMark
CzJWaterMark

使用说明

#import "AddWaterMark.h"

1.图片全屏水印
AddWaterMark *mark = [[AddWaterMark alloc] init];
UIImage *logo = [mark addWaterMark:bgImg watemarkText:@"exe-3035"];
 UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, logo.size.width, logo.size.height)];
imageview.image = logo;
[self.view addSubview:imageview];

2.全屏水印
AddWaterMark *mark = [[AddWaterMark alloc] init];
UIImage *logo = [mark watemarkText:@"exe-3035"];
[self.view setContentMode:UIViewContentModeBottomRight];
self.view.layer.contents = (__bridge id _Nullable)(logo.CGImage);
