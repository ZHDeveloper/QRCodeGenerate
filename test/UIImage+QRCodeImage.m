//
//  UIImage+QRCodeImage.m
//  test
//
//  Created by AdminZhiHua on 15/12/11.
//  Copyright © 2015年 AdminZhiHua. All rights reserved.
//

#import "UIImage+QRCodeImage.h"

@implementation UIImage (QRCodeImage)

+ (instancetype)QRCodeImageWith:(NSString *)content imageScale:(CGFloat)scale {
    
    return [self QRCodeImageWith:content imageScale:scale withRed:0 andGreen:0 andBlue:0];
    
}

+ (instancetype)QRCodeImageWith:(NSString *)content imageScale:(CGFloat)scale withRed:(CGFloat)red andGreen:(CGFloat)green andBlue:(CGFloat)blue {
    
    //创建滤镜
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    //重置滤镜的初始值
    [filter setDefaults];
    
    //通过kvc设置滤镜的内容
    NSData *data = [content dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    
    [filter setValue:data forKeyPath:@"inputMessage"];
    
    //输出图像,图形的默认大小23*23
    CIImage *ciImage = filter.outputImage;
    
    //过滤图像彩色以及形变的滤镜
    CIFilter *colorFilter = [CIFilter filterWithName:@"CIFalseColor"];
    
    //重置彩色滤镜
    [colorFilter setDefaults];
    
    //设置彩色滤镜的内容
    [colorFilter setValue:ciImage forKeyPath:@"inputImage"];
    
    //设置前景色
    [colorFilter setValue:[CIColor colorWithRed:red green:green blue:blue] forKeyPath:@"inputColor0"];
    
    //设置背景色
    [colorFilter setValue:[CIColor colorWithRed:1 green:1 blue:1] forKeyPath:@"inputColor1"];
    
    //设置形变
    CGAffineTransform transform = CGAffineTransformMakeScale(scale, scale);

    CIImage *transformImage = [colorFilter.outputImage imageByApplyingTransform:transform];
    
    UIImage *image = [UIImage imageWithCIImage:transformImage];
    
    return image;
    
}

+ (instancetype)QRCodeImageWith:(NSString *)content insertAvartImage:(UIImage *)avartImage imageScale:(CGFloat)scale {
    
    return [self QRCodeImageWith:content insertAvartImage:avartImage imageScale:scale withRed:0 andGreen:0 andBlue:0];
    
}

+ (instancetype)QRCodeImageWith:(NSString *)content insertAvartImage:(UIImage *)avartImage imageScale:(CGFloat)scale withRed:(CGFloat)red andGreen:(CGFloat)green andBlue:(CGFloat)blue {
    
    UIImage *codeImage = [self QRCodeImageWith:content imageScale:scale withRed:red andGreen:green andBlue:blue];
    
    CGSize codeSize = codeImage.size;
    
    //开启位图上下文
    UIGraphicsBeginImageContext(codeSize);
    
    //将图片画在图形上下文中
    [codeImage drawInRect:CGRectMake(0, 0, codeSize.width, codeSize.height)];
    
    //计算头像的大小
    CGFloat w = codeSize.width * 0.25;
    CGFloat h = codeSize.height * 0.25;
    CGFloat x = (codeSize.width - w) * 0.5;
    CGFloat y = (codeSize.height - h) * 0.5;
    
    [avartImage drawInRect:CGRectMake(x, y, w, h)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    return newImage;
    
}



@end
