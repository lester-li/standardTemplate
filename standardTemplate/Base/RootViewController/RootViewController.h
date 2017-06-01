//
//  RootViewController.h
//  RepairService_Mechanic
//
//  Created by macbook on 16/9/12.
//  Copyright © 2016年 macbook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HKSearchBar.h"
#import "CustomNavigationBar.h"
#import "SHFriendsCircleModel.h"
@interface RootViewController : UIViewController
@property (nonatomic, strong) UIImageView *images;  // 背景
@property (nonatomic, strong) UIImageView *imagess; // 背景
@property (nonatomic, strong) HKSearchBar* searchBar;//搜索
@property (nonatomic, strong) NSUserDefaults *userDefaults;
;
@property (nonatomic, strong) NSString* left_tabbarStr;   //首页左侧button
@property (nonatomic, strong) UIButton* left_tabbarBtn;   //首页左侧button
@property (nonatomic, strong) UIButton* right_tabbarBtn;  //右侧button
@property (nonatomic, strong) UIButton* right_tabbarBtn1; //右侧button1
@property (nonatomic, strong) UIButton* right_tabbarBtn2; //右侧button2
@property (nonatomic, strong) NSMutableDictionary *netDic;  // 网络外大字典
@property (nonatomic, strong) NSMutableDictionary *netData;  // 网络内小字典

@property (nonatomic, assign) BOOL isFreash;   // 刷新
@property (nonatomic, assign) NSInteger pageNumber; // 分页
// 创建Navbar
- (void)createMyNavigationBarWithTitle:(NSString *)titleImageName andLeftBtn:(NSArray *)leftBtnArray andRightBtn:(NSArray *)rightBtnArray;
#pragma mark --串校代码

/**
 *  创建Navbar 自定义校友圈title视图
 */
- (void)createAlumnusMyNavBarWithLeftBtn:(NSArray *)leftBtnArray andRightBtn:(NSArray *)rightBtnArray andDelegate:(id<AlumnusNavBarViewDelegate>)delegate;
// Navbar点击
- (void)navigationBarClick:(UIButton *)btn;
// 自定义搜索
- (void)crrateSeachAction:(NSString *)str andEdit:(BOOL)edit andIsFirst:(BOOL)isFirst andLeftBtn:(NSString *)leftBtnStr andRightBtn:(NSString *)rightBtnStr;
// 左按钮
-(void)leftBtn:(UIButton *)leftBtn;
// 右按钮
-(void)rightBtn:(UIButton *)rightBtn;
// 搜索
-(void)seachBtnAction;
// 导航跳转到首页
-(void)jumpToTabbar;
// 登录
-(void)jumpToLogIn;
//tabbar 导航
-(void)tabbarJumpTo:(NSInteger)index;
// 登录状态
-(BOOL)isLogIn;
-(void)ifLogIn;
// 三方登录状态
-(BOOL)isThirdLogin;
// 移除本地存储
-(void) removeUserDefault;
// 创建跟搜索 左侧按钮相同位置的 左侧按钮
-(void)createSearchLeftBtn:(NSString *)leftBtnStr andImage:(NSString*)imageStr;
// 创建跟搜索 右侧按钮相同位置的 右侧按钮
-(void)createSearchRightBtn:(NSString *)rightBtnStr;
// 创建跟搜索 左侧按钮相同位置的 左侧按钮
-(void)createSearchLeftBtn:(NSString *)leftBtnStr;
// 验证码
- (void)getRegisterNumber:(UIButton *)sender;
// 获取医生个人信息
- (void)getDoctorUserInfo ;
// 是否登录
-(BOOL)isLogIn;




//添加的分享的接口
- (void)shareRequest:(NSInteger)index model:(SHFriendsCircleModel*)model;


@end
