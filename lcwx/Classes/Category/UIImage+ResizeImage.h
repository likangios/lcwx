//
//  UIImage+ResizeImage.h
//  QQ聊天布局
//
//  Created by TianGe-ios on 14-8-20.
//  Copyright (c) 2014年 TianGe-ios. All rights reserved.
//

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface UIImage (ResizeImage)

- (UIImage *)scaleToSize:(CGSize)size;

+ (UIImage *)resizeImage:(NSString *)imageName;


///按比例缩放,size 是你要把图显示到 多大区域 CGSizeMake(300, 140)
+(UIImage *) imageCompressForSize:(UIImage *)sourceImage targetSize:(CGSize)size;

///指定宽度按比例缩放
+(UIImage *) imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;

///指定高度按比例缩放
+(UIImage *) imageCompressForHeight:(UIImage *)sourceImage targetHeight:(CGFloat)defineHeight;


//+(UIImage *)getThumbnailImage:(NSString *)videoURL;

+ (UIImage *)circleImage:(UIImage *)originImage borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;


+(UIImage *)coreBlurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;


+(UIImage *)bundleImage:(NSString *)imageName;
@end
