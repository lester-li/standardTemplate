//
//  CustmNavigationBar.m
//  RepairService_Mechanic
//
//  Created by macbook on 16/9/12.
//  Copyright © 2016年 macbook. All rights reserved.
//

#import "CustomNavigationBar.h"
@implementation CustomNavigationBar
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
//        UILabel *line = [QuickControl createLabelWithFrame:CGRectMake(0, 64-.8, ScreenWidth, .8) backgroundColor:WXColor(249, 249, 249) text:nil textColor:nil font:0];
//        line.alpha = .3;
//        [self addSubview:line];
    }
    return self;
}
- (void)createMyNavigationBarWithTitleImageName:(NSString *)titleImageName andLeftBtnImageNames:(NSArray *)leftBtnImageNamesArray andRightBtnImageNames:(NSArray *)rightBtnImageNamesArray andClass:(id)classObject andSEL:(SEL)sel
{
    // 1.背景色
    self.backgroundColor = ColorOfTheme_Main;
    // 2.title视图
    if(titleImageName)
        [self createTitleImageViewWithTitleImageName:titleImageName withClass:classObject andSEL:(SEL)sel];
    
    CGFloat btnX = 0.f;

    if(leftBtnImageNamesArray)
    {
        for(int i=0;i<leftBtnImageNamesArray.count;i++)
        {
            UIButton *btn = [self createBtnWithBtnImageName:[leftBtnImageNamesArray objectAtIndex:i] andBtnX:btnX andTag:i+1 andIsLeft:YES andClass:classObject andSEL:sel andTitle:leftBtnImageNamesArray[i]];
            btnX = btnX + btn.bounds.size.width;
        }
    }
    btnX = self.bounds.size.width - 20*WidthScale;
    if(rightBtnImageNamesArray)
    {
        for(int i=0;i<rightBtnImageNamesArray.count;i++)
        {
            UIButton *btn = [self createBtnWithBtnImageName:[rightBtnImageNamesArray objectAtIndex:i] andBtnX:btnX andTag:i+1+10 andIsLeft:NO andClass:classObject andSEL:sel andTitle:rightBtnImageNamesArray[i]];
            btnX = btnX - CGRectGetWidth(btn.frame);
        }
    }
    UIView *line = [QuickControl createCutLineWithFrame:(CGRectMake(0, self.height-1*WidthScale, ScreenWidth, 1*WidthScale)) backgroundColor:BackColorOfController];
    [self addSubview:line];
}

- (void)didClicksegmentedControlAction:(UISegmentedControl *)seg{
    if (self.delegate && [self.delegate respondsToSelector:@selector(didClicksegmentedControlAction:)]) {
        [self.delegate didClicksegmentedControlAction:seg];
    }
}
- (void)createTitleImageViewWithTitleImageName:(NSString *)titleImageName withClass:(id)class andSEL:(SEL)sel
{
//    if ([titleImageName isEqualToString:@"搜索"]||[titleImageName isEqualToString:@"搜索_1"]) {
//        DDSearchBar* searchBar = [DDSearchBar searchBar];
//        //尺寸
//        searchBar.frame = CGRectMake(128*WidthScale, 56*WidthScale, 540*WidthScale, 65*WidthScale);
//        //代理
//        searchBar.delegate = class;
//        UIButton *searchBarBtn = [[UIButton alloc]initWithFrame:searchBar.bounds];
//        [searchBarBtn setBackgroundColor:colorOf_Clean];
//        if ([titleImageName isEqualToString:@"搜索"]) {
//            searchBarBtn.hidden = NO;
//        }else
//        {
//            searchBarBtn.hidden = YES;
//        }
//        searchBarBtn.tag = 5;
//        [searchBarBtn addTarget:class action:sel forControlEvents:UIControlEventTouchUpInside];
//        [searchBar addSubview:searchBarBtn];
//        //设置中间的主题
//        [self addSubview:searchBar];
//    }else{
        UILabel *title = [QuickControl createLabelWithFrame:CGRectMake(120 * WidthScale, 20, ScreenWidth - 120 * WidthScale * 2, 44) backgroundColor:[UIColor clearColor] text:titleImageName textColor:colorOf_White font:36*WidthScale];
//        title.font = [UIFont boldSystemFontOfSize:18];
        title.textAlignment = NSTextAlignmentCenter;
        [self addSubview:title];
//    }
}
- (void)createBtnWithLeftBtn:(NSString *)btnImageName withTitle:(NSString *)title andClass:(id)class andSEL:(SEL)sel{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(38 * WidthScale, 65 * WidthScale, 102 * WidthScale, 39 * WidthScale);
    [leftButton addTarget:class action:sel forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 35 * WidthScale, 38 * WidthScale)];
    imageView.image = [UIImage imageNamed:btnImageName];
    [leftButton addSubview:imageView];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(37 * WidthScale, 0, 72 * WidthScale, 38 * WidthScale)];
    titleLabel.text = title;
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.textColor = [UIColor colorWithRed:0.40f green:0.82f blue:0.06f alpha:1.00f];
    titleLabel.font = [UIFont systemFontOfSize:14];
    [leftButton addSubview:titleLabel];
    
    [self addSubview:leftButton];
}

- (UIButton *)createBtnWithBtnImageName:(NSString *)btnImageName andBtnX:(CGFloat)btnX andTag:(int)btnTag andIsLeft:(BOOL)isLeft andClass:(id)classObject andSEL:(SEL)sel andTitle:(NSString *)title
{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.adjustsImageWhenHighlighted = NO;
    btn.frame = isLeft?CGRectMake(10 * WidthScale, 20, 70 * WidthScale, 44):CGRectMake(btnX -  90 * WidthScale,20,  90 * WidthScale, 44);
    btn.tag = btnTag;
    [btn setTitleColor:colorOf_66 forState:UIControlStateNormal];
    UIFont *font_new = [UIFont fontWithName:@"PingFangSC-Regular" size:32*WidthScale];//这个是9.0以后自带的平方字体
    if(font_new == nil){
        //这个是我手动导入的第三方平方字体
        font_new = [UIFont fontWithName:@"PingFang-SC-Regular" size:32*WidthScale];
    }
    btn.titleLabel.font = font_new;
    [btn addTarget:classObject action:sel forControlEvents:UIControlEventTouchUpInside];
    
    if (([btnImageName rangeOfString:@"_image"].location != NSNotFound) || [btnImageName isEqualToString:@"nav_news_image"]) {
//        UIImageView *imageView  = [[UIImageView alloc]initWithFrame:CGRectMake(11, 13, 22, 20)];
//        imageView.image = [UIImage imageNamed:btnImageName];
////        imageView.contentMode = UIViewContentModeCenter;
//        [btn addSubview:imageView];
        [btn setImage:[UIImage imageNamed:btnImageName] forState:UIControlStateNormal];
        btn.contentHorizontalAlignment = isLeft?UIControlContentHorizontalAlignmentCenter:UIControlContentHorizontalAlignmentRight;
        btn.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;

    }else{
        [btn setTitle:title forState:UIControlStateNormal];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        
    }

//    if (![btnImageName isEqualToString:@"ICON-设置"] && ![btnImageName isEqualToString:@"[对号]按钮"]) {
//        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(30 * WidthScale, 10, 102 * WidthScale, 24)];
//        titleLabel.text = title;
//        titleLabel.textAlignment = NSTextAlignmentLeft;
//        titleLabel.textColor = [UIColor whiteColor];
//        titleLabel.font = [UIFont systemFontOfSize:14];
//        [btn addSubview:titleLabel];
//    }

    [self addSubview:btn];
    
    return btn;
}
@end
