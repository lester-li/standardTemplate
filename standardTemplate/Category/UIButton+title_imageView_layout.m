//
//  UIButton+title_imageView_layout.m
//  LZButtonCategory
//
//  Created by 李小帅 on 2016/11/30.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "UIButton+title_imageView_layout.h"

@implementation UIButton (title_imageView_layout)

- (void)title_imageView_layout_setButtonType:(LZCategoryType)lzType interval:(CGFloat)gap {
    
    //需要在外部修改标题背景色的时候将此代码注释
    self.titleLabel.backgroundColor = self.backgroundColor;
    self.imageView.backgroundColor = self.backgroundColor;
    
    CGSize titleSize = self.titleLabel.bounds.size;
    CGSize imageSize = self.imageView.bounds.size;
    
    CGFloat interval = 1.0;
    if (gap) {
        interval = gap;
    }
    
    if (lzType == LZCategoryTypeTitleLeft) {
        [self setImageEdgeInsets:UIEdgeInsetsMake(0,titleSize.width + interval, 0, -(titleSize.width + interval))];
        [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -(imageSize.width + interval), 0, imageSize.width + interval)];
    } else if(lzType == LZCategoryTypeTitleBottom) {
        
        [self setImageEdgeInsets:UIEdgeInsetsMake(0,0, titleSize.height + interval, -(titleSize.width))];
        [self setTitleEdgeInsets:UIEdgeInsetsMake(imageSize.height + interval, -(imageSize.width), 0, 0)];
        
    }else if (lzType == LZCategoryTypeTitleTop){
        
        [self setImageEdgeInsets:UIEdgeInsetsMake((titleSize.height + interval),0, 0, -(titleSize.width))];
        [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -(imageSize.width), (imageSize.width + interval), 0)];
    }
}

@end
