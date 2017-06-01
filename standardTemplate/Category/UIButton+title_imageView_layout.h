//
//  UIButton+title_imageView_layout.h
//  LZButtonCategory
//
//  Created by 李小帅 on 2016/11/30.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (title_imageView_layout)

typedef NS_ENUM(NSInteger,LZCategoryType) {
    
    LZCategoryTypeTitleLeft = 0,
    LZCategoryTypeTitleBottom,
    LZCategoryTypeNone,
    LZCategoryTypeTitleTop,
};

- (void)title_imageView_layout_setButtonType:(LZCategoryType)lzType interval:(CGFloat)gap;

@end
