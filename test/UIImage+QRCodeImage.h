//
//  UIImage+QRCodeImage.h
//  test
//
//  Created by AdminZhiHua on 15/12/11.
//  Copyright © 2015年 AdminZhiHua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (QRCodeImage)

/*!
 *  @author zhihua, 15-12-11 11:12:59
 *
 *  生成黑白二维码图片
 *
 *  @param content 二维码内容
 *  @param scale   缩放比例：(23*23)*scale
 *
 *  @return 大小为(23*23)*scale的二维码图片
 */
+ (instancetype)QRCodeImageWith:(NSString *)content imageScale:(CGFloat)scale;

/*!
 *  @author zhihua, 15-12-11 11:12:13
 *
 *  生成带图片的二维码图片
 *
 *  @param content    二维码内容
 *  @param avartImage 插入的图像
 *  @param scale      缩放比例：(23*23)*scale
 *
 *  @return 大小为(23*23)*scale带图片的二维码图片
 */
+ (instancetype)QRCodeImageWith:(NSString *)content insertAvartImage:(UIImage *)avartImage imageScale:(CGFloat)scale;

/**< 生成带颜色的二维码图片 */
+ (instancetype)QRCodeImageWith:(NSString *)content imageScale:(CGFloat)scale withRed:(CGFloat)red andGreen:(CGFloat)green andBlue:(CGFloat)blue;

/**< 生成带颜色和图片的二维码图片 */
+ (instancetype)QRCodeImageWith:(NSString *)content insertAvartImage:(UIImage *)avartImage imageScale:(CGFloat)scale withRed:(CGFloat)red andGreen:(CGFloat)green andBlue:(CGFloat)blue;


@end
