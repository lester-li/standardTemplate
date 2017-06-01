//
//  CustmNavigationBar.h
//  RepairService_Mechanic
//
//  Created by macbook on 16/9/12.
//  Copyright © 2016年 macbook. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AlumnusNavBarViewDelegate <NSObject>
- (void)didClicksegmentedControlAction:(UISegmentedControl *)Seg;
@end
@interface CustomNavigationBar : UIView
- (void)createMyNavigationBarWithTitleImageName:(NSString *)titleImageName andLeftBtnImageNames:(NSArray *)leftBtnImageNamesArray andRightBtnImageNames:(NSArray *)rightBtnImageNamesArray andClass:(id)classObject andSEL:(SEL)sel;
#pragma mark --串校 校友圈自定义视图
- (void)createAlumnusNavBarWithLeftBtnImageNames:(NSArray *)leftBtnImageNamesArray andRightBtnImageNames:(NSArray *)rightBtnImageNamesArray andClass:(id)classObject andSEL:(SEL)sel;
@property (nonatomic, weak) id<AlumnusNavBarViewDelegate> delegate;
@end
