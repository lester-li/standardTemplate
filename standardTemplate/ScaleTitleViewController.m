//
//  ScaleTitleViewController.m
//  standardTemplate
//
//  Created by 李小帅 on 2017/6/24.
//  Copyright © 2017年 美好午后. All rights reserved.
//

#import "ScaleTitleViewController.h"

@interface ScaleTitleViewController ()

@end

@implementation ScaleTitleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"放大缩小";
    self.navigationBar.customNavigationBarType = LS_customNavigationBarTypeScale;
    self.navigationBar.titleMargin = LS_BACKB_WIDTH;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
