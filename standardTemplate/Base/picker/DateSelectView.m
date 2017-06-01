//
//  DateSelectView.m
//  FamlMedical_ Patient
//
//  Created by 静 on 16/12/18.
//  Copyright © 2016年 macbook. All rights reserved.
//

#import "DateSelectView.h"

@interface DateSelectView()

@property (weak, nonatomic) IBOutlet UIView *backView;

@property (strong, nonatomic) NSDateFormatter *df;

@end

@implementation DateSelectView

-(void)awakeFromNib
{
    [super awakeFromNib];
    self.df = [[NSDateFormatter alloc]init];//格式化
    [self.df setDateFormat:@"yyyy-MM-dd"];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(RemoveSelf)];
    [self.backView addGestureRecognizer:tap];
}

-(void)RemoveSelf
{
    [self removeFromSuperview];
}

- (IBAction)cancelClick:(id)sender {
    [self removeFromSuperview];
}

- (IBAction)complateClick:(id)sender {
    NSString *date = [self.df stringFromDate:[_datePicker date]];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"datePickerDate" object:self userInfo:@{@"date":date}];
    [self removeFromSuperview];
}

@end
