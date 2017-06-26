//
//  Main_TabelView.m
//  FamlMedical_ Patient
//
//  Created by macbook on 16/11/22.
//  Copyright © 2016年 macbook. All rights reserved.
//

#import "Main_TabelView.h"

@implementation Main_TabelView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style andDelegate:(id)del
{
    if (self = [super initWithFrame:frame style:style]) {
        self.frame = frame ;
        self.dataSource =del;
        self.delegate = del;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
//        self.backgroundColor = colorOf_Clean;
        self.showsVerticalScrollIndicator = NO;
        //    // 下拉刷新
        //    self.tableView.mj_header= [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRereshing)];
        //    // 上拉刷新
        //    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRereshing)];
    }
    return self;
}

//扯淡的构图!!!!!!!!!!!!!!!!!!!!!!!!!!!
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TextFieldresignFirstResponder" object:nil];
}
@end
