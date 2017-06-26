//
//  LS_customNavigationBar.h
//  standardTemplate
//
//  Created by 李小帅 on 2017/6/23.
//  Copyright © 2017年 美好午后. All rights reserved.
//

#import <UIKit/UIKit.h>

#define LS_BACKB_WIDTH 44

#define ScreenHeigth [UIScreen mainScreen].bounds.size.height

#define ScreenStatusBottom  ([UIApplication sharedApplication].statusBarFrame.origin.y + [UIApplication sharedApplication].statusBarFrame.size.height)

#define NavigationBarNormalHeight (100.0+ScreenStatusBottom)


typedef NS_ENUM (NSInteger,LS_customNavigationBarType){
    LS_customNavigationBarTypeFade = 0,//淡入淡出
    LS_customNavigationBarTypeScale,//放大缩小
    LS_customNavigationBarTypeScaleToCenter//放大缩小并居中
};

@interface LS_customNavigationBar : UIView

@property (nonatomic,strong) UILabel *smallTitleL;
@property (nonatomic,strong) UILabel *bigTitleL;
@property (nonatomic,strong) UIButton *backB;
@property (nonatomic,strong) UIView *lineView;

@property (nonatomic,assign)CGFloat smallTitleLFontSize;
@property (nonatomic,assign)CGFloat bigTitleLFontSize;

@property (nonatomic,assign)CGFloat lineMargin;

@property (nonatomic,assign)CGFloat titleMargin;

@property (nonatomic,strong)NSString *title;

@property (nonatomic,assign)LS_customNavigationBarType customNavigationBarType;

-(void)navigationBarAnimationScales:(CGFloat)scales;


@end
