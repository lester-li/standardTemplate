//
//  ScaleCenterTitleViewController.m
//  standardTemplate
//
//  Created by 李小帅 on 2017/6/24.
//  Copyright © 2017年 美好午后. All rights reserved.
//

#import "ScaleCenterTitleViewController.h"
#import "UIViewController+ScrollBackgroud.h"

@interface ScaleCenterTitleViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ScaleCenterTitleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"放大缩小居中";
    self.navigationBar.customNavigationBarType = LS_customNavigationBarTypeScaleToCenter;
    
    UITableView *table=[[UITableView alloc] initWithFrame:self.baseViewBounds style:UITableViewStylePlain];
    table.delegate=self;
    table.dataSource=self;
    [self.view addSubview:table];
    
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    view.backgroundColor=[UIColor yellowColor];
    view.center=self.view.center;
    view.isSuspension=YES;
    [self.view addSubview:view];
    
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"sssss"];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"sssss"];
    }
    cell.textLabel.text=[NSString stringWithFormat:@"%zi",indexPath.row];
    return cell;
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self sl_optimzeScroll:scrollView];
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
