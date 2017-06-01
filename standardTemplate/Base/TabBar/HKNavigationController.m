//
//  DDNavigationController.m
//  DouDaWanJu
//
//  Created by klgz1 on 15/12/21.
//  Copyright © 2015年 klgz. All rights reserved.
//

#import "HKNavigationController.h"
#import "HKTabBarViewController.h"
@interface HKNavigationController ()

@end

@implementation HKNavigationController

+(void)initialize
{
    [self setupNavBarTheme];
    
    [self setupBarButtonItemTheme];
}
+(void)setupNavBarTheme
{
    UINavigationBar* nvBar = [UINavigationBar appearance];
    //设置标题属性
    NSMutableDictionary * textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName]= [UIColor blackColor];
    NSShadow* shadow = [[NSShadow alloc]init];
    shadow.shadowOffset = CGSizeMake(0, 0);
    textAttrs[NSShadowAttributeName] = shadow;
    textAttrs[NSFontAttributeName]= [UIFont boldSystemFontOfSize:19];
    [nvBar setTitleTextAttributes:textAttrs];
}
+(void)setupBarButtonItemTheme
{
    //取出item
    UIBarButtonItem *item = [UIBarButtonItem appearance];
//    [item setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//    [item setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background_pushed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
//    [item setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_send_background_disabled"] forState:UIControlStateDisabled barMetrics:UIBarMetricsDefault];

    //设置文字属性
    NSMutableDictionary *textAttris = [NSMutableDictionary dictionary];
    textAttris[NSForegroundColorAttributeName] = [UIColor orangeColor];
    NSShadow* shadow = [[NSShadow alloc]init];
    shadow.shadowOffset = CGSizeMake(0, 0);
    textAttris[NSShadowAttributeName] = shadow;
    textAttris[NSFontAttributeName]=[UIFont systemFontOfSize:14];
    [item setTitleTextAttributes:textAttris forState:UIControlStateNormal];
    [item setTitleTextAttributes:textAttris forState:UIControlStateHighlighted];

    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
    disableTextAttrs[NSForegroundColorAttributeName] =  [UIColor lightGrayColor];
    [item setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
//    self.navigationBarHidden = YES;
//
    if (self.viewControllers.count>0) {
        viewController.hidesBottomBarWhenPushed= YES;
    }
    /*
    if ([viewController isKindOfClass:[HKTabBarViewController class]]) {
        viewController.hidesBottomBarWhenPushed= NO;
    }else
    {
        viewController.hidesBottomBarWhenPushed= YES;
    }
     */
    [super pushViewController:viewController animated:animated];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
