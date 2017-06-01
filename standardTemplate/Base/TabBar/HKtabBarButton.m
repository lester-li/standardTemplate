//
//  DDtabBarButton.m
//  DouDaWanJu
//
//  Created by klgz1 on 15/12/21.
//  Copyright © 2015年 klgz. All rights reserved.
//

#import "HKtabBarButton.h"
//#import "HKBadgeButton.h"
#define HKtabBarButtonImageRatio 0.6

#define HKtabBarButtonTitleColor [UIColor lightGrayColor]
#define HKtabBarButtonTitleSelectedColor ColorOfTheme_Main

@interface HKtabBarButton ()
//@property (strong,nonatomic)DDBadgeButton *badgeButton;


@end
@implementation HKtabBarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        UIFont *font_new = [UIFont fontWithName:@"PingFangSC-Regular" size:20*WidthScale];//这个是9.0以后自带的平方字体
        if(font_new == nil){
            //这个是我手动导入的第三方平方字体
            font_new = [UIFont fontWithName:@"PingFang-SC-Regular" size:20*WidthScale];
        }
        self.titleLabel.font = font_new;
        [self setTitleColor:HKtabBarButtonTitleColor forState:UIControlStateNormal]
        ;
        
        [self setTitleColor:HKtabBarButtonTitleSelectedColor forState:UIControlStateSelected];
        //        [self setBackgroundImage:[UIImage imageWithName:@"tabbar_slider"] forState:UIControlStateSelected];
        
//        //添加一个提醒数字按钮
//        DDBadgeButton* badgeButton = [[DDBadgeButton alloc]init];
//        badgeButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleBottomMargin;
//        [self addSubview:badgeButton];
//        self.badgeButton = badgeButton;
    }
    return self;
}
-(void)setHighlighted:(BOOL)highlighted
{
    
}
-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height* HKtabBarButtonImageRatio;
    return CGRectMake(0, 5 , imageW, imageH - 5);
}
//内部文字的frame
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = contentRect.size.height* HKtabBarButtonImageRatio;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height- titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}

//设置item
-(void)setItem:(UITabBarItem *)item
{
    _item = item;
    //KVO监听属性的改变
    [item addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [item addObserver:self forKeyPath:@"title" options:0 context:nil];
    [item addObserver:self forKeyPath:@"image" options:0 context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];

    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];

}
-(void)dealloc
{
    //KVO监听属性的改变
    [self.item removeObserver:self forKeyPath:@"badgeValue"];
    [self.item removeObserver:self forKeyPath:@"title"];
    [self.item removeObserver:self forKeyPath:@"image"];
    [self.item removeObserver:self forKeyPath:@"selectedImage"];

}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    //设置文字
    [self setTitle:self.item.title forState:UIControlStateNormal];
    [self setTitle:self.item.title forState:UIControlStateSelected];

    //设置图片
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
//    //设置提醒数字
//    self.badgeButton.badgeValue = self.item.badgeValue;
//    
//    //设置提醒数字的位置
//    CGFloat badgeX = self.frame.size.width - self.badgeButton.frame.size.width-10;
//    CGFloat badgeY = 0;
//    CGRect badgeF = self.badgeButton.frame;
//    badgeF.origin.x = badgeX;
//    badgeF.origin.y = badgeY;
//    self.badgeButton.frame = badgeF;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
