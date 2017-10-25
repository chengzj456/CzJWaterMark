//
//  AddWaterMark.m
//
//  Created by exe on 2017/10/10.
//  Copyright © 2017年 CzJ. All rights reserved.
//

#import "AddWaterMark.h"
#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height
@implementation AddWaterMark

#pragma mark --actions
- (UIImage *) watemarkText:(NSString *) watemarkText {
    UIImage *backImage = [AddWaterMark imageWithColor:[UIColor whiteColor]];
    UIImage *drawImg = [self addWatemarkImage:backImage watemarkText:watemarkText];
    UIImage *logoImg = [self rotationImage:drawImg AndbackImage:backImage];
    return logoImg;
}
- (UIImage *) addWaterMark:(UIImage*) backImage watemarkText:(NSString *) watemarkText {
    UIImage *drawImg = [self addWatemarkImage:backImage watemarkText:watemarkText];
    UIImage *logoImg = [self rotationImage:drawImg AndbackImage:backImage];
    UIImage *resultImg = [self compose:logoImg AndBackImage:backImage];
    return resultImg;
}
//文字水印
- (UIImage *)addWatemarkImage:(UIImage *)logoImage watemarkText:(NSString *)watemarkText {
    int w = SCREEN_WIDTH*3;
    int h = SCREEN_HEIGHT;
    UIGraphicsBeginImageContext(CGSizeMake(w, h));
    [[UIColor whiteColor] set];
    [logoImage drawInRect:CGRectMake(-SCREEN_WIDTH, -SCREEN_HEIGHT, w, h)];
    
    NSInteger line = SCREEN_HEIGHT*3/ 80; //多少行
    NSInteger row = 20;
    for (int i = 0; i < line; i ++) {
        for (int j = 0; j < row; j ++) {
            [watemarkText drawInRect:CGRectMake(j * (SCREEN_WIDTH/3.5), i*100, 90, 25) withAttributes:@{NSFontAttributeName:_textFont,NSForegroundColorAttributeName:_textColor}];
        }
    }
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

//image旋转
- (UIImage *)rotationImage:(UIImage *)image AndbackImage:(UIImage *)backImage{
    long double rotate = 0.0;
    CGRect rect;
    float translateX = 0;
    float translateY = 0;
    float scaleX = 1.0;
    float scaleY = 1.0;
    rotate = M_PI_4;
    if (backImage.size.height == 1) {
         rect = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    } else {
        rect = CGRectMake(0, 0, backImage.size.width, backImage.size.height);
    }
    translateX = 0;
    translateY = -rect.size.width;
    //铺满屏幕的关键↓↓↓
    scaleY = rect.size.width/rect.size.height *2;
    scaleX = rect.size.height/rect.size.width *2;
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    //做CTM变换
    CGContextTranslateCTM(context, 0.0, rect.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextRotateCTM(context, rotate);
    CGContextTranslateCTM(context, translateX, translateY);
    
    CGContextScaleCTM(context, scaleX, scaleY);
    //绘制图片
    CGContextDrawImage(context, CGRectMake(0, 0, rect.size.width, rect.size.height), image.CGImage);
    
    UIImage *newPic = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();//关闭上下文
    
    return newPic;
}
- (UIImage* )compose:(UIImage*) img AndBackImage:(UIImage*) backImage{
    
    //以1.png的图大小为底图
    CGFloat w = backImage.size.width;
    CGFloat h = backImage.size.height;
    
    //以1.png的图大小为画布创建上下文
    UIGraphicsBeginImageContext(CGSizeMake(w, h));
    [backImage drawInRect:CGRectMake(0, 0, w, h)];//先把1.png 画到上下文中
    [img drawInRect:CGRectMake(0, 0, w, h)];//再把小图放在上下文中
    UIImage *resultImg = UIGraphicsGetImageFromCurrentImageContext();//从当前上下文中获得最终图片
    UIGraphicsEndImageContext();//关闭上下文
    
    return resultImg;
}
+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
@end
