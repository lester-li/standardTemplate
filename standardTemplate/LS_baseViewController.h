//
//  LS_baseViewController.h
//  standardTemplate
//
//  Created by 李小帅 on 2017/6/24.
//  Copyright © 2017年 美好午后. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+ScrollBackgroud.h"
#import "LS_customNavigationBar.h"

@interface LS_baseViewController : UIViewController

@property (nonatomic,assign) CGRect baseViewBounds;

@property (nonatomic,strong) LS_customNavigationBar * navigationBar;

@property (nonatomic,assign) BOOL enableNavigtionPan;//仅控制多层嵌套UIScroll时是否响应

-(void)sl_optimzeScroll:(UIScrollView*)scrollView;

@end
