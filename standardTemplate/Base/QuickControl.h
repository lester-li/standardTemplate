//
//  QuickControl.h
//  YiLaiFu-AYiDuan
//
//  Created by work on 15/11/20.
//  Copyright © 2015年 work. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface QuickControl : NSObject

+ (UIImage *)getImageWithImageName:(NSString *)imageName;

+ (UIImageView *)createImageViewWithFrame:(CGRect)frame image:(NSString *)image;

+ (UILabel *)createLabelWithFrame:(CGRect)frame backgroundColor:(UIColor *)backColor text:(NSString *)text textColor:(UIColor *)textColor font:(int)font;

+ (UILabel *)createCutLineWithFrame:(CGRect)frame backgroundColor:(UIColor *)color;

+ (UIView *)createViewWithFrame:( CGRect)frame backgroundColor:(UIColor *)color; 

+ (UIButton *)createButtonWithFrame:(CGRect)frame backgroundColor:(UIColor *)backColor title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font target:(id)target action:(SEL)action;

+ (UIButton *)createButtonWithFrame:(CGRect)frame backgroundColor:(UIColor *)backColor title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font image:(NSString *)image target:(id)target action:(SEL)action;

+ (UIButton *)createButtonWithFrame:(CGRect)frame backgroundImage:(NSString *)backImage target:(id)target action:(SEL)action;

+ (UIButton *)createButtonImageWithFrame:(CGRect)frame backgroundImage:(NSString *)backImage target:(id)target action:(SEL)action;

+ (UIButton *)createButtonWithFrame:(CGRect)frame backgroundImage:(NSString *)backImage title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font target:(id)target action:(SEL)action;

+ (UITextField *)createTextFieldWithFrame:(CGRect)frame font:(UIFont *)font textColor:(UIColor *)textColor borderStyle:(UITextBorderStyle)borderStyle returnKeyType:(UIReturnKeyType)returnKeyType placeholder:(NSString *)placeholder;

+ (UITextField *)createTextFieldWithFrame1:(CGRect)frame font:(int)font textColor:(UIColor *)textColor borderStyle:(UITextBorderStyle)borderStyle returnKeyType:(UIReturnKeyType)returnKeyType placeholder:(NSString *)placeholder disabledBackground:(NSString *)backImageStr clearButtonMode:(UITextFieldViewMode)clearButtonMode keyboardType:(UIKeyboardType)keyType delegate:(id)Class;

+(void)getLable:(UILabel *)comboAbstract andSpace:(float)space;

+(void)getViewShadow:(UIView *)view;

//本文框
+ (UITextView *)createAdviceTextView:(NSString *)placeholderStr;

/**
 *  贴边lable的尺寸
 */
+(CGSize)getSizeLable:(UILabel*)lable andFont:(CGFloat)lableFont and_X:(CGFloat)lableX;
/**
 *  正常的尺寸
 */
+(CGSize)get_SizeLable:(NSString*)text andFont:(CGFloat)lableFont and_W:(CGFloat)textW;

//+ (NSString *)transformationOfTime:(int)time;
//+ (NSString *)percentumOfFloat:(CGFloat)index;
//+ (NSString *)numberConversionFloat:(NSNumber *)number;
//+ (NSString *)transformationOfTime1:(int)time;
/**
 *  获取一个页面上例如"提交订单"这样的按钮
 */
+(UIButton *)getButton_Y:(CGFloat)y title:(NSString *)title;
/**
 *  获取不同颜色
 */
+(UILabel *)getLabel:(UILabel *)labelStr rangStr:(NSString *)rangStr;


@end
