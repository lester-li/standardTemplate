//
//  DDTabBarViewController.m
//  DouDaWanJu
//
//  Created by klgz1 on 15/12/21.
//  Copyright © 2015年 klgz. All rights reserved.
//

#import "HKTabBarViewController.h"
#import "HKtabBar.h"
#import "HKNavigationController.h"
#import "HomeViewController.h"
#import "CircleViewController.h"
#import "ReferrerViewController.h"
#import "ActivityViewController.h"
#import "MineViewController.h"
#import <UserNotifications/UserNotifications.h>
static const CGFloat kDefaultPlaySoundInterval = 3.0;
static NSString *kMessageType = @"MessageType";
static NSString *kConversationChatter = @"ConversationChatter";
static NSString *kGroupName = @"GroupName";

@interface HKTabBarViewController ()<HKtabBarDelegate>
@property (weak,nonatomic) HKtabBar* customTabBar;
@property (strong, nonatomic) NSDate *lastPlaySoundDate;

@end
@implementation HKTabBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupTabBar];
    [self setupVC];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    for (UIView* child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [child removeFromSuperview];
        }
    }
}
-(void)setupTabBar
{
    HKtabBar* newTabBar = [[HKtabBar alloc]init];
    newTabBar.frame  = self.tabBar.bounds;
    newTabBar.height = 49;
    newTabBar.y = self.tabBar.height - newTabBar.height;
    newTabBar.delegate = self;
    [self.tabBar addSubview:newTabBar];
    NSLog(@" %@    |||||||||||||||||||   %@ ",NSStringFromCGRect(newTabBar.frame),NSStringFromCGRect(self.tabBar.bounds));
    self.customTabBar = newTabBar;
}
-(void)tabbar:(HKtabBar *)tabBar didselectedButtonFrom:(int)from To:(int)to
{
    self.selectedIndex = to - 100;
}
-(void)setupVC
{
    // 首页
    HomeViewController* home = [[HomeViewController alloc]init];
    [self setupChildViewController:home title:@"首页" imageName:@"botoom_icon_home_unselected" selectImageName:@"botoom_icon_home"];
    //盛华圈
    CircleViewController* circle = [[CircleViewController alloc]init];
    [self setupChildViewController:circle title:@"盛华圈" imageName:@"botoom_icon_quanzi_unselected" selectImageName:@"earth"];
    // 推荐人
    ReferrerViewController* referrer = [[ReferrerViewController alloc]init];
    [self setupChildViewController:referrer title:@"推荐人" imageName:@"botoom_icon_Recommend_unselected" selectImageName:@"botoom_icon_Recommend"];
    // 最新活动
    ActivityViewController* activity = [[ActivityViewController alloc]init];
    [self setupChildViewController:activity title:@"最新活动" imageName:@"botoom_icon_Newest_unselected" selectImageName:@"botoom_icon_Newest"];
    // 我的
    MineViewController *mine = [[MineViewController alloc] init];
    [self setupChildViewController:mine title:@"我的" imageName:@"botoom_icon_unselected" selectImageName:@"botoom_icon_"];
}

-(void)setupChildViewController:(UIViewController*)childVC title:(NSString*)title imageName:(NSString*)imageName selectImageName:(NSString*)selectImageName
{
    childVC.title = title;
    childVC.tabBarItem.image =[UIImage imageNamed:imageName];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    HKNavigationController*nav = [[HKNavigationController alloc]initWithRootViewController:childVC];
    [self addChildViewController:nav];
    //添加tabbar内部按钮
    [self.customTabBar addTabBarButtonWithItem:childVC.tabBarItem];
}

- (void)tabBarDidClickedPlusButton:(HKtabBar *)tabBar {
    NSLog(@"=====");
}

@end
