//
//  NSString+Frame.h
//  YunGou
//
//  Created by macbook on 16/5/16.
//  Copyright © 2016年 macbook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (Frame)
- (float) heightWithFont: (UIFont *) font withinWidth: (float) width;
- (float) widthWithFont: (UIFont *) font;

- (NSString *)emoji;

- (CGSize)sizeWithMaxWidth:(CGFloat)width andFont:(UIFont *)font;

- (NSString *)originName;

+ (NSString *)currentName;

- (NSString *)firstStringSeparatedByString:(NSString *)separeted;


@end
