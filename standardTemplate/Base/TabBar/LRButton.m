//
//  LRButton.m
//  RepairService_Mechanic
//
//  Created by macbook on 16/11/2.
//  Copyright © 2016年 macbook. All rights reserved.
//

#import "LRButton.h"
#define ImageW  10

@implementation LRButton

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        //设置图片显示的样式
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat titleW = contentRect.size.width-ImageW;
    CGFloat titleH = contentRect.size.height;
    return CGRectMake(0, 0, titleW, titleH);
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat imageW = ImageW;
    CGFloat imageH = contentRect.size.height;
    CGFloat imageX = contentRect.size.width-ImageW;
    //self.imageView.contentMode = UIViewContentModeCenter;
    return CGRectMake(imageX,0, imageW, imageH);
}

-(void)setHighlighted:(BOOL)highlighted{
}

@end
