//
//  DDSearchBar.m
//  RepairService_Mechanic
//
//  Created by macbook on 16/9/12.
//  Copyright © 2016年 macbook. All rights reserved.
//

#import "HKSearchBar.h"

@interface HKSearchBar()
@end

@implementation HKSearchBar
+ (instancetype)searchBar
{
    return [[self alloc] init];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 背景
        self.backgroundColor = [UIColor whiteColor];
        self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        // 左边的放大镜图标
        UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ty_soso"]];
        iconView.contentMode = UIViewContentModeCenter;
        self.leftView = iconView;
        self.leftViewMode = UITextFieldViewModeAlways;
        
        // 字体
        self.font = [UIFont systemFontOfSize:selfont2];
        
        // 右边的清除按钮
        self.clearButtonMode = UITextFieldViewModeAlways;
        
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        
        //再次编辑就清空
        self.clearsOnBeginEditing = YES;
        
        // 设置键盘右下角按钮的样式
        self.returnKeyType = UIReturnKeySearch;
        self.enablesReturnKeyAutomatically = YES;
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    // 设置左边图标的frame
    self.leftView.frame = CGRectMake(0, 0, 30, self.frame.size.height);
}
-(CGRect)textRectForBounds:(CGRect)bounds
{
    return CGRectInset(bounds, 30, 0);
}
-(CGRect)editingRectForBounds:(CGRect)bounds
{
    return CGRectInset(bounds, 30, 0);
}
//-(CGRect)clearButtonRectForBounds:(CGRect)bounds
//{
//    return CGRectInset(bounds, 0, 0);
//}
@end
