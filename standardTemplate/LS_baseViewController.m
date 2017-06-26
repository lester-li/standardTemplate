//
//  LS_baseViewController.m
//  standardTemplate
//
//  Created by 李小帅 on 2017/6/24.
//  Copyright © 2017年 美好午后. All rights reserved.
//

#import "LS_baseViewController.h"
#import "UIView+LS_frame.h"

#define CurrenVersion [[[UIDevice currentDevice] systemVersion] floatValue]

@interface LS_baseViewController ()<LS_UIViewControllerBackGroundScrollDelegate>

@end

@implementation LS_baseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    if (self.navigationController.navigationBar.hidden==NO) {
        self.navigationController.navigationBar.hidden = YES;
    }
    if (CurrenVersion >= 7.0) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.view.clipsToBounds = YES;
    
    self.ls_enableScrollBackground = YES;
    self.ls_scrollBackgroundDelgate = self;
    self.ls_scrollBackgroundBounces = NO;
    
    self.navigationBar = [[LS_customNavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.width, NavigationBarNormalHeight)];
    [self.view addSubview:self.navigationBar];
    [self.navigationBar.backB addTarget:self action:@selector(goBackClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.ls_scrollBackgroundContentSize = CGSizeMake(self.view.width, self.view.height + self.navigationBar.height - self.navigationBar.backB.bottom);
}

-(CGRect)baseViewBounds{
    
    if (self.navigationBar.hidden||self.navigationBar.height<=0) {
        return CGRectMake(0, 0, self.view.width, (self.ls_enableScrollBackground?self.ls_scrollBackgroundContentSize.height:self.view.height)-(([self.tabBarController.viewControllers containsObject:self.navigationController]&&[self.navigationController.viewControllers.firstObject isEqual:self])?self.tabBarController.tabBar.height:0));
    }
    
    
    return CGRectMake(0, self.navigationBar.bottom, self.view.width, (self.ls_enableScrollBackground?self.ls_scrollBackgroundContentSize.height:self.view.height)-self.navigationBar.bottom-(([self.tabBarController.viewControllers containsObject:self.navigationController]&&[self.navigationController.viewControllers.firstObject isEqual:self])?self.tabBarController.tabBar.height:0));

    return CGRectZero;
    
}

-(void)setTitle:(NSString *)title{
    [self.navigationBar setTitle:title];
}


-(void)goBackClick{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - LS_UIViewControllerBackGroundScrollDelegate
-(void)ls_scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat scales = (scrollView.contentOffset.y)/(NavigationBarNormalHeight - ScreenStatusBottom - LS_BACKB_WIDTH);
    
    if ([scrollView isEqual:((LSBackGroundView*)self.view).backGroundScroll]) {
        if (scrollView.contentOffset.y >= 0 && scrollView.contentOffset.y <= (NavigationBarNormalHeight - ScreenStatusBottom - LS_BACKB_WIDTH)) {
            [self.navigationBar navigationBarAnimationScales:scales];
        }
    }
}

//处理scrollview嵌套其他tableview的逻辑
-(void)sl_optimzeScroll:(UIScrollView*)scrollView{
    
    //如果scrollview的contentsize的高度介于 self=>view=>backGroundScroll的contentSize的高度之间， 将scrollview的contentsize 设置为 self=>view=>backGroundScroll的contentSize
    if (scrollView.contentSize.height > ((LSBackGroundView*)self.view).backGroundScroll.height &&  scrollView.contentSize.height < ((LSBackGroundView*)self.view).backGroundScroll.contentSize.height) {
        scrollView.contentSize = CGSizeMake(scrollView.contentSize.width, ((LSBackGroundView*)self.view).backGroundScroll.contentSize.height);
    }
    
    ((LSBackGroundView*)self.view).backGroundScroll.scrollEnabled = NO;
    
    //获取本次的scrollview的偏移量
    CGFloat currentOffsetY = scrollView.contentOffset.y;
    
    currentOffsetY = currentOffsetY > (NavigationBarNormalHeight - self.navigationBar.backB.bottom) ? (NavigationBarNormalHeight - self.navigationBar.backB.bottom) : currentOffsetY;
    currentOffsetY = currentOffsetY < 0 ? 0 : currentOffsetY;
    
    ((LSBackGroundView*)self.view).backGroundScroll.contentOffset = CGPointMake(((LSBackGroundView*)self.view).backGroundScroll.contentOffset.x, currentOffsetY);
}















@end
