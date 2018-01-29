//
//  MSUntil.h
//  HI
//
//  Created by FengLing on 16/1/13.
//  Copyright © 2016年 lk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MBProgressHUD.h>
/**
 *  工具类 把公用的方法 写在这里 全局使用
 */
@interface MSUntil : NSObject
/**
 *  计算字符串大小
 *
 *  @param str        字符串
 *  @param width      限制宽度
 *  @param font       字体
 *
 *  @return 返回字符串所需要的显示尺寸
 */
+(CGSize)CalSizeByString:(NSString *) str  ForWidth : (CGFloat) width ForFont : (UIFont *) font;

/**
 *  使用指定颜色创建指定大小的IMAGE图像
 *
 *  @param color 指定的颜色
 *  @param size  指定的大小
 *
 *  @return 返回创建后的 UIImage 对象
 */

+ (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size;
/**
 *  设置imageview 为圆形图片
 *
 *  @param roundedView 需要设置的 imageview
 */
+(void)setRoundedView:(UIImageView *)roundedView;
/**
 *  计算指定字符串的md5值
 *
 *  @param srcString 需要计算的字符串
 *
 *  @return 返回md5
 */
+ (NSString*) MD5:(NSString *) srcString;

/**
 *  做等比缩放
 *
 *  @param image   需要缩放的图片
 *  @param maxSize 最大大小
 *
 *  @return 返回处理过的图片
 */
+ (UIImage *)Reduce:(UIImage *)image WithMaxSize:(CGSize) maxSize;
/**
 *  创建一个临时的图片文件
 *
 *  @param origin_upload_image 需要创建的图片
 *
 *  @return 返回临时的图片文件url
 */
+(NSURL *) createTempImageUploadFile:(UIImage *) origin_upload_image;
/**
 *  创建一个临时的图片文件
 *
 *  @param origin_upload_image 需要创建的图片
 *
 *  @param max_size 图片最大尺寸
 *
 *  @return 返回临时的图片文件url
 */
+(NSURL *) createTempImageUploadFile:(UIImage *) origin_upload_image WithMaxSize:(CGSize) max_size;
/**
 *  数组排序
 *
 *  @param key   模型的Key
 *  @param asc   YES 升序  NO 降序
 *  @param array 需要排序的数组
 */
+ (void)sortWithProperty:(NSString *)key ascending:(BOOL)asc with:(NSMutableArray *)array;
+(UIView *) showErrorAlertViewWithMessage:(NSString *) msg Delegate:(id) delegate;
+(UIView *) showAlertViewTitle:(NSString *) title Message:(NSString *) msg Delegate:(id) delegate;
+(UIView *) showHttprequestErrorAlertViewWithDelegate:(id) delegate;

+(MBProgressHUD *) showHttprequestErrorHUDViewAtView:(UIView *) view;

+(MBProgressHUD *) showErrorHUDViewAtView:(UIView *) view WithTitle:(NSString *) title;
/**
 *  显示loading
 *
 */
+ (void)showHUDAddedTo:(UIView *)view;
/**
 *  隐藏loading
 *
 */
+ (void)hideAllHUDsForView:(UIView *)view;

+ (BOOL)checkPhoneNumInput:(NSString *)phone;
//网络图片地址
+ (NSString *)LCImageUrlWithImage:(NSString *)name;

@end
