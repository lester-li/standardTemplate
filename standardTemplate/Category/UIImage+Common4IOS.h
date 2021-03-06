//
//  UIImage+Common4IOS.h

//
//  Created by FZZL on 12-11-30.
//  Copyright (c) 2012年 CuiYiLong. All rights reserved.
//

#define MAX_IMAGEPIX 200.0          // max pix 200.0px
#define MAX_IMAGEDATA_LEN 50000.0   // max data length 5K

#import <UIKit/UIKit.h>

@interface UIImage (Common4IOS)

/**
 *  获得毛玻璃效果的图片
 *
 *  @param image 图片
 *  @param blur   模糊度
 *
 */
+ (UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur;
//
- (UIImage *)compressedImage;

//获得UIImage的compressionQuality
- (CGFloat) compressionQuality;

//获得UIImage的NSData数据
- (NSData *)compressedData;

//获得UIImage的NSData数据,根据compressionQuality
- (NSData *)compressedDataWithCompressionQuality:(CGFloat)compressionQuality;

//获得JPEG类型的图片的NSData类型对象
+(NSData *) getJPEGDataFromImage:(UIImage*) image;

//获得JPEG类型的图片的NSData类型对象，传入compressionQuality
+(NSData *) getJPEGDataFromImage:(UIImage*) image withCompressionQuality:(CGFloat) compressionQuality;

//获得PNG类型的图片的NSData类型对象
+(NSData *) getPNGDataFromImage:(UIImage*) image;

//根据CGSize获得相应大小的图片
+(UIImage *) getResizeImage:(UIImage *)image toSize:(CGSize) size;

//根据pixcels获得相应大小圆角的图片
+(UIImage *) getRoundCornerImage: (UIImage*) image withPixels: (int) pixels;

//添加图片水印
+(UIImage *)addToOldImage:(UIImage *)oldImage newImage:(UIImage *)newImage point:(CGPoint)point;

//根据文字获得图片
+(UIImage *)getImageFromText:(NSString *)text withFont:(UIFont *)font;

+(UIImage *)getImageFromText:(NSString *)text withFont:(UIFont *)font withColor:(UIColor *)color;

//根据文字获得图片-自动折行
+(UIImage *)getImageFromText:(NSString *)text inRect:(CGRect)rect withFont:(UIFont *)font;

+(UIImage *)getImageFromText:(NSString *)text inRect:(CGRect)rect withFont:(UIFont *)font withColor:(UIColor *)color;

/**返回一张可任意拉伸的图片*/
+ (UIImage *)resizedImageWithName:(NSString *)name;

/**
 *  返回一张可拉伸的图片
 *
 *  @param left 左侧保留区域
 *  @param top 上方保留区域
 *
 */
+ (UIImage *)resizedImageWithName:(NSString *)name left:(float)left top:(float)top;

/**得到一个纯色的图片*/
+ (UIImage *)getImageFromColor:(UIColor *)color;
/**根据图片数据 得到类型*/
+ (NSString *)typeForImageData:(NSData *)data;

/*裁切*/
- (UIImage *)cropImageWithX:(CGFloat)x y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height;

/*重绘*/
-(UIImage*)scaleToSize:(CGSize)size;

@end
