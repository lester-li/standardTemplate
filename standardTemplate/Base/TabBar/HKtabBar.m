//
//  DDtabBar.m
//  DouDaWanJu
//
//  Created by klgz1 on 15/12/21.
//  Copyright © 2015年 klgz. All rights reserved.
//

#import "HKtabBar.h"
#import "HKtabBarButton.h"

@interface HKtabBar()<HKtabBarDelegate>
@property (weak,nonatomic)HKtabBarButton *selectedButton;
@property (strong,nonatomic)UIButton* plusButton;

@end
@implementation HKtabBar

-(NSMutableArray*)tabBarButtons
{
    if (_tabBarButtons == nil) {
        _tabBarButtons = [NSMutableArray array];
    }
    return _tabBarButtons;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        UIView *cutLine = [QuickControl createViewWithFrame:(CGRectMake(0, 0, ScreenWidth, 1)) backgroundColor:BackColorOfController];
//        [self addSubview:cutLine];
        // Initialization code
        // tabbar背景
//        UIImageView *backImg = [QuickControl createImageViewWithFrame:(CGRectMake(0, -20*WidthScale, ScreenWidth, 120*WidthScale)) image:@""];
//        [self addSubview:backImg];
//        //添加加号按钮
//        UIButton* plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        [plusButton setBackgroundImage:[UIImage imageNamed:@"icon_live_image"] forState:UIControlStateNormal];
//        [plusButton setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
//        [plusButton setImage:[UIImage imageWithName:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
//        [plusButton setImage:[UIImage imageWithName:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
//        plusButton.bounds = CGRectMake(0, 0, 100*WidthScale, 100*WidthScale);
//        plusButton.alpha = 1;
////
//        [plusButton addTarget:self action:@selector(plusButtonClick) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:plusButton];
//        self.plusButton = plusButton;
        self.backgroundColor = colorOf_White;
    }
    return self;
}

- (void)plusButtonClick
{
    if ([self.delegate respondsToSelector:@selector(tabBarDidClickedPlusButton:)]) {
        [self.delegate tabBarDidClickedPlusButton:self];
    }
}

-(void)addTabBarButtonWithItem:(UITabBarItem*)tabBarItem
{
    //1.创建按钮
    HKtabBarButton* button = [[HKtabBarButton alloc]init];
    [self addSubview:button];
    //添加按钮到数组中
    [self.tabBarButtons addObject:button];
    
    //2.设置数据
    button.item = tabBarItem;

    //3.给button添加点击事件
    [button addTarget:self action:@selector(buttonClict:) forControlEvents:UIControlEventTouchDown];
    //4.默认选中第0个tabbarButton
    if (self.tabBarButtons.count == 1) {
        [self buttonClict:button];
    }
}
-(void)buttonClict:(HKtabBarButton*)button
{
    if ([self.delegate respondsToSelector:@selector(tabbar:didselectedButtonFrom:To:)]) {
        [self.delegate tabbar:self didselectedButtonFrom:(int)self.selectedButton.tag To:(int)button.tag];
    }
    self.selectedButton.selected = NO;
    [button setSelected:YES];
    self.selectedButton = button;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    //调整加号的frame
    CGFloat h = self.frame.size.height;
    CGFloat w = self.frame.size.width;
//    self.plusButton.center= CGPointMake(w*0.5, h*0.5-5);
    CGFloat buttonY = 0;
    CGFloat buttonH = h;
    CGFloat buttonW = w/self.subviews.count;
    
    for (int i=0; i<self.tabBarButtons.count; i++) {
        //1.取出按钮
        HKtabBarButton* button = self.tabBarButtons[i];
        //2.设置按钮的Frame
        CGFloat buttonX = i * buttonW;
//        if (i>1) {
//            buttonX += buttonW;
//        }
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        //2.设置当前页面的tag
        button.tag = i + 100;
    }
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
