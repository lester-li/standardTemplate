//
//  DDtabBar.h
//  DouDaWanJu
//
//  Created by klgz1 on 15/12/21.
//  Copyright © 2015年 klgz. All rights reserved.
//
#import <UIKit/UIKit.h>
@class HKtabBar;
@class HKtabBarButton;
@protocol HKtabBarDelegate <NSObject>

-(void)tabbar:(HKtabBar*)tabBar didselectedButtonFrom:(int)from To:(int)to;
- (void)tabBarDidClickedPlusButton:(HKtabBar *)tabBar;

@end
@interface HKtabBar : UIView
@property (strong,nonatomic)NSMutableArray *tabBarButtons;

-(void)addTabBarButtonWithItem:(UITabBarItem*)tabBarItem ;
-(void)buttonClict:(HKtabBarButton*)button;

@property (weak,nonatomic)id<HKtabBarDelegate> delegate;

@end
