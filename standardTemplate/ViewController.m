//
//  ViewController.m
//  standardTemplate
//
//  Created by 李小帅 on 2017/6/1.
//  Copyright © 2017年 美好午后. All rights reserved.
//

#import "ViewController.h"
#import "UIView+LS_frame.h"
#import "FadeViewController.h"
#import "ScaleTitleViewController.h"
#import "ScaleCenterTitleViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    self.navigationBar.backB.hidden=YES;
    self.title=@"主程序";
    self.navigationBar.customNavigationBarType = LS_customNavigationBarTypeFade;
    
    UIButton *btn1=[[UIButton alloc] initWithFrame:CGRectMake(0, self.navigationBar.bottom, ScreenWidth, 60)];
    [btn1 setTitle:@"放大缩小模式" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn1.tag=1111;
    [btn1 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2=[[UIButton alloc] initWithFrame:CGRectMake(0, btn1.bottom, ScreenWidth, 60)];
    [btn2 setTitle:@"放大缩小居中模式" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn2.tag=2222;
    [btn2 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    UIButton *btn3=[[UIButton alloc] initWithFrame:CGRectMake(0, btn2.bottom, ScreenWidth, 60)];
    [btn3 setTitle:@"淡入淡出模式" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn3.tag=3333;
    [btn3 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
}

- (void)btnClick:(UIButton*)button{
    switch (button.tag) {
        case 1111:
        {
            ScaleTitleViewController *pushVC = [[ScaleTitleViewController alloc] init];
            [self.navigationController pushViewController:pushVC animated:YES];
            break;
        }
        case 2222:
        {
            ScaleCenterTitleViewController *pushVC = [[ScaleCenterTitleViewController alloc] init];
            [self.navigationController pushViewController:pushVC animated:YES];
            break;
        }
        case 3333:
        {
            FadeViewController *pushVC = [[FadeViewController alloc] init];
            [self.navigationController pushViewController:pushVC animated:YES];
            break;
        }
        default:
            break;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
