//
//  CustomScrollView.m
//  FamlMedical_Doctor
//
//  Created by MacBook on 2017/1/21.
//  Copyright © 2017年 macbook. All rights reserved.
//

#import "CustomScrollView.h"

@interface CustomScrollView ()<UIGestureRecognizerDelegate>

@end
@implementation CustomScrollView
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    // 首先判断otherGestureRecognizer是不是系统pop手势
    if ([otherGestureRecognizer.view isKindOfClass:NSClassFromString(@"UILayoutContainerView")]) {
        // 再判断系统手势的state是began还是fail，同时判断scrollView的位置是不是正好在最左边
        if (otherGestureRecognizer.state == UIGestureRecognizerStateBegan && self.contentOffset.x <= 100) {
            return YES;
        }
    }
    
    return NO;
}
@end
