//
//  RootViewController.m
//  RepairService_Mechanic
//
//  Created by macbook on 16/9/12.
//  Copyright © 2016年 macbook. All rights reserved.
//

#import "RootViewController.h"
#import "LRButton.h"
//#import "SearchResultViewController.h"
#import "HKtabBar.h"
#import "HKtabBarButton.h"
#import "HKNavigationController.h"
#import <UMSocialCore/UMSocialCore.h>
#import "SHShareView.h"

#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define textColorBlack [UIColor colorWithRed:51./255 green:51./255 blue:51./255 alpha:1.0];
@interface RootViewController () <UISearchBarDelegate, UISearchDisplayDelegate,UITextFieldDelegate,UIAlertViewDelegate>

@end

@implementation RootViewController
{
    CustomNavigationBar *mnb;
    UIButton *leftButton;
    NSString *rightString;
    LRButton *seleButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = BackColorOfController;
    self.userDefaults = [NSUserDefaults standardUserDefaults];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.navigationController setNavigationBarHidden:YES];
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    self.navigationController.interactivePopGestureRecognizer.delegate = nil;

    // 初始刷新状态
    self.isFreash = NO;
    self.pageNumber = 1;
}
//-(BOOL)prefersStatusBarHidden
//{
//    return YES;
//}
// UIAlert 提示框
- (void)alertAction:(NSString *)alertInfo{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:alertInfo delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alertView show];
}
/**
 *  创建Navbar
 */
- (void)createMyNavigationBarWithTitle:(NSString *)titleImageName andLeftBtn:(NSArray *)leftBtnArray andRightBtn:(NSArray *)rightBtnArray
{
    if (mnb) {
        [mnb removeFromSuperview];
        mnb = nil;
    }
    mnb = [[CustomNavigationBar alloc] init];
    mnb.frame = CGRectMake(0, 0, ScreenWidth, 64);
    [mnb createMyNavigationBarWithTitleImageName:titleImageName andLeftBtnImageNames:leftBtnArray andRightBtnImageNames:rightBtnArray andClass:self andSEL:@selector(navigationBarClick:)];
    [self.view addSubview:mnb];
    if (rightBtnArray.count>0) {
        self.right_tabbarBtn = [mnb viewWithTag:11];
    }
    if (rightBtnArray.count>1) {
        self.right_tabbarBtn1 = [mnb viewWithTag:12];
    }
    if (rightBtnArray.count>2) {
        self.right_tabbarBtn2 = [mnb viewWithTag:13];
    }
    if (leftBtnArray.count>0) {
        self.left_tabbarBtn = [mnb viewWithTag:1];
    }
}

#pragma mark --串校代码

/**
 *  创建Navbar 自定义校友圈title视图
 */
- (void)createAlumnusMyNavBarWithLeftBtn:(NSArray *)leftBtnArray andRightBtn:(NSArray *)rightBtnArray andDelegate:(id<AlumnusNavBarViewDelegate>)delegate
{
    if (mnb) {
        [mnb removeFromSuperview];
        mnb = nil;
    }
    mnb = [[CustomNavigationBar alloc] init];
    mnb.frame = CGRectMake(0, 0, ScreenWidth, 64);
    [mnb createAlumnusNavBarWithLeftBtnImageNames:leftBtnArray andRightBtnImageNames:rightBtnArray andClass:self andSEL:@selector(navigationBarClick:)];
    mnb.delegate = delegate;
    [self.view addSubview:mnb];
    if (rightBtnArray.count>0) {
        self.right_tabbarBtn = [mnb viewWithTag:11];
    }
    if (rightBtnArray.count>1) {
        self.right_tabbarBtn1 = [mnb viewWithTag:12];
    }
    if (leftBtnArray.count>0) {
        self.left_tabbarBtn = [mnb viewWithTag:1];
    }
}


// 状态栏按钮点击
- (void)navigationBarClick:(UIButton *)btn
{
    // 返回
    if (btn.tag == 1) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}
// 自定义收索
- (void)crrateSeachAction:(NSString *)str andEdit:(BOOL)edit andIsFirst:(BOOL)isFirst andLeftBtn:(NSString *)leftBtnStr andRightBtn:(NSString *)rightBtnStr{
    // 背景
    self.images = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 64)];
    self.images.userInteractionEnabled = YES;
    self.images.backgroundColor = ColorOfTheme_Main;
    self.imagess = [[UIImageView alloc]initWithFrame:self.images.bounds];
    self.imagess.backgroundColor = ColorOfTheme_Main;
    [self.images addSubview:self.imagess];
    //    self.images.image = [UIImage imageNamed:@"images"];
    [self.view addSubview:self.images];
    if (leftBtnStr) {
        UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, 100*WidthScale, 44)];
        leftBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [leftBtn addTarget:self action:@selector(leftBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.images addSubview:leftBtn];
        if ([leftBtnStr rangeOfString:@"_image"].location != NSNotFound) {
            // 图标
            UIImageView *imageSeach = [[UIImageView alloc] initWithFrame:CGRectMake(15, 0, 22*WidthScale, 44)];
            imageSeach.image = [UIImage imageNamed:leftBtnStr];
            imageSeach.contentMode = UIViewContentModeCenter;
            [leftBtn addSubview:imageSeach];
        }else{
            [leftBtn setTitle:rightBtnStr forState:UIControlStateNormal];
    
        }
    }
    // 输入框
    HKSearchBar* searchBar = [HKSearchBar searchBar];
    //尺寸
    searchBar.frame = CGRectMake(107*WidthScale, 32, 536*WidthScale, 24);
    //代理
    searchBar.delegate = self;
    searchBar.enablesReturnKeyAutomatically = NO;
    //提示文字
    if (!str) {
        //        searchBar.placeholder = @"搜索店内的商品";
        // 设置提醒文字
        NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
        attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
        searchBar.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"搜索你想要的商品" attributes:attrs];
        
    } else {
        searchBar.placeholder = str;
    }
    UIButton *searchBarBtn = [[UIButton alloc]initWithFrame:searchBar.bounds];
    [searchBarBtn setBackgroundColor:colorOf_Clean];
    if(edit == NO) {
        searchBarBtn.hidden = NO;
        if (isFirst == YES) {
            self.imagess.alpha = 0;
            searchBar.alpha = 1;
        }
    }else
    {
        self.imagess.alpha = 1;
        searchBarBtn.hidden = YES;
//        [searchBar becomeFirstResponder];
    }
    searchBarBtn.tag = 5;
    [searchBarBtn addTarget:self action:@selector(seachBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [searchBar addSubview:searchBarBtn];
    //设置中间的主题
    [self.images addSubview:searchBar];
    self.searchBar = searchBar;
    // 右侧
    if (rightBtnStr) {
        leftButton = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth - 90*WidthScale, 28,  90*WidthScale, 30)];
        leftButton.titleLabel.font = [UIFont systemFontOfSize:isGTPhone5?15:14];
        [leftButton setTitleColor:colorOf_White forState:UIControlStateNormal];
        [leftButton addTarget:self action:@selector(rightBtn:) forControlEvents:UIControlEventTouchUpInside];
        //        rightBtn.backgroundColor = [UIColor yellowColor];
        [self.images addSubview:leftButton];
        
        rightString = rightBtnStr;
        if ([rightBtnStr isEqualToString:@"消息切图"]) {//如果是首页跟选玩具页,显示消息图标
            UIImageView *imageView  = [[UIImageView alloc]initWithFrame:CGRectMake(11, 6, 22, 20)];
            imageView.image = [UIImage imageNamed:rightBtnStr];
            
            [leftButton addSubview:imageView];
            
        }else{
            if ([rightBtnStr rangeOfString:@"_image"].location != NSNotFound) {
                // 图标
                UIImageView *imageSeach = [[UIImageView alloc] initWithFrame:CGRectMake(11, 6, 22, 20)];
                imageSeach.image = [UIImage imageNamed:rightBtnStr];
                [leftButton addSubview:imageSeach];
            }else{
                [leftButton setTitle:rightBtnStr forState:UIControlStateNormal];
                leftButton.titleLabel.textAlignment = NSTextAlignmentCenter;
            }
            
        }
    }
}
-(void)setLeft_tabbarStr:(NSString *)left_tabbarStr
{
    CGSize tetleSize = [left_tabbarStr sizeWithAttributes:@{NSFontAttributeName:seleButton.titleLabel.font}];
    seleButton.frame = CGRectMake(10 * WidthScale, 20, tetleSize.width+15, 44);
    [seleButton setTitle:left_tabbarStr forState:UIControlStateNormal];
}
// 创建跟搜索 左侧按钮相同位置的 左侧按钮
-(void)createSearchLeftBtn:(NSString *)leftBtnStr andImage:(NSString*)imageStr{
    if (!mnb) {
        mnb = [[CustomNavigationBar alloc] init];
        mnb.frame = CGRectMake(0, 0, ScreenWidth, 64);
        [self.view addSubview:mnb];
    }
    seleButton = [LRButton buttonWithType:UIButtonTypeCustom];
    seleButton.frame = CGRectMake(10 * WidthScale, 20, 70 * WidthScale, 44);
    [seleButton setTitleColor:colorOf_White forState:UIControlStateNormal];
    UIFont *font_new = [UIFont fontWithName:@"PingFangSC-Regular" size:selfont2];//这个是9.0以后自带的平方字体
    if(font_new == nil){
        //这个是我手动导入的第三方平方字体
        font_new = [UIFont fontWithName:@"PingFang-SC-Regular" size:selfont2];
    }
    seleButton.titleLabel.font = font_new;
    self.left_tabbarStr = leftBtnStr;
    [seleButton addTarget:self action:@selector(leftBtn:) forControlEvents:UIControlEventTouchUpInside];
    //        rightBtn.backgroundColor = [UIColor yellowColor];
    [mnb addSubview:seleButton];
    
    if ([imageStr isEqualToString:@"消息切图"]) {//如果是首页跟选玩具页,显示消息图标
        UIImageView *imageView  = [[UIImageView alloc]initWithFrame:CGRectMake(11, 6, 22, 20)];
        imageView.image = [UIImage imageNamed:leftBtnStr];
        
        [seleButton addSubview:imageView];
        
    }else{
        if ([imageStr rangeOfString:@"_image"].location != NSNotFound) {
            // 图标
//            UIImageView *imageSeach = [[UIImageView alloc] initWithFrame:CGRectMake(11, 6, 22, 20)];
//            imageSeach.image = [UIImage imageNamed:imageStr];
//            [leftButton addSubview:imageSeach];
            [seleButton setTitle:leftBtnStr forState:UIControlStateNormal];
            seleButton.titleLabel.textAlignment = NSTextAlignmentLeft;
            [seleButton setImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
        }else{
            [seleButton setTitle:leftBtnStr forState:UIControlStateNormal];
            seleButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        }
        
    }

}
// 创建跟搜索 右侧按钮相同位置的 右侧按钮
-(void)createSearchRightBtn:(NSString *)rightBtnStr
{
    if (!mnb) {
        mnb = [[CustomNavigationBar alloc] init];
        mnb.frame = CGRectMake(0, 0, ScreenWidth, 64);
        [self.view addSubview:mnb];
    }
    _right_tabbarBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth - 90*WidthScale, 28, 90*WidthScale, 30)];
    _right_tabbarBtn.titleLabel.font = [UIFont systemFontOfSize:isGTPhone5?15:14];
    [_right_tabbarBtn setTitleColor:colorOf_White forState:UIControlStateNormal];
    [_right_tabbarBtn addTarget:self action:@selector(rightBtn:) forControlEvents:UIControlEventTouchUpInside];
    //        rightBtn.backgroundColor = [UIColor yellowColor];
    [mnb addSubview:_right_tabbarBtn];
    
    rightString = rightBtnStr;
    if ([rightBtnStr isEqualToString:@"消息切图"]) {//如果是首页跟选玩具页,显示消息图标
        UIImageView *imageView  = [[UIImageView alloc]initWithFrame:CGRectMake(11, 6, 22, 20)];
        imageView.image = [UIImage imageNamed:rightBtnStr];
        
        [_right_tabbarBtn addSubview:imageView];
        
    }else{
        if ([rightBtnStr rangeOfString:@"_image"].location != NSNotFound) {
            // 图标
            UIImageView *imageSeach = [[UIImageView alloc] initWithFrame:CGRectMake(11, 6, 20, 20)];
            imageSeach.image = [UIImage imageNamed:rightBtnStr];
            imageSeach.contentMode = UIViewContentModeCenter;
            [_right_tabbarBtn addSubview:imageSeach];
        }else{
            [_right_tabbarBtn setTitle:rightBtnStr forState:UIControlStateNormal];
            _right_tabbarBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        }
    }
}
-(void)createSearchLeftBtn:(NSString *)leftBtnStr
{
    if (!mnb) {
        mnb = [[CustomNavigationBar alloc] init];
        mnb.frame = CGRectMake(0, 0, ScreenWidth, 64);
        [self.view addSubview:mnb];
    }
    _left_tabbarBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 28, 90*WidthScale, 30)];
    _left_tabbarBtn.titleLabel.font = [UIFont systemFontOfSize:isGTPhone5?15:14];
    [_left_tabbarBtn setTitleColor:colorOf_White forState:UIControlStateNormal];
    [_left_tabbarBtn addTarget:self action:@selector(leftBtn:) forControlEvents:UIControlEventTouchUpInside];
    //        rightBtn.backgroundColor = [UIColor yellowColor];
    [mnb addSubview:_left_tabbarBtn];
//    rightString = leftBtnStr;
    if ([leftBtnStr isEqualToString:@"消息切图"]) {//如果是首页跟选玩具页,显示消息图标
        UIImageView *imageView  = [[UIImageView alloc]initWithFrame:CGRectMake(11, 6, 22, 20)];
        imageView.image = [UIImage imageNamed:leftBtnStr];
        [_left_tabbarBtn addSubview:imageView];
    }else{
        if ([leftBtnStr rangeOfString:@"_image"].location != NSNotFound) {
            // 图标
            UIImageView *imageSeach = [[UIImageView alloc] initWithFrame:CGRectMake(11, 6, 20, 20)];
            imageSeach.image = [UIImage imageNamed:leftBtnStr];
            imageSeach.contentMode = UIViewContentModeCenter;
            [_left_tabbarBtn addSubview:imageSeach];
        }else{
            [_left_tabbarBtn setTitle:leftBtnStr forState:UIControlStateNormal];
            _left_tabbarBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        }
    }
}

//左按钮
-(void)leftBtn:(UIButton *)leftBtn{NSLog(@"左按钮");
    [self.navigationController popViewControllerAnimated:YES];
}
//右按钮
-(void)rightBtn:(UIButton *)rightBtn{NSLog(@"右按钮");
    if ([rightBtn.titleLabel.text isEqualToString:@"取消"]) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
//        MyMessageViewController *mvc = [[MyMessageViewController alloc]init];
//        [self.navigationController pushViewController:mvc animated:YES];
    }
}
//搜索
-(void)seachBtnAction{NSLog(@"搜索");
//    [self.searchBar resignFirstResponder];
//    BOOL isHavePushVC = NO;
//    SearchResultViewController *pushVC = [[SearchResultViewController alloc]init];
//    pushVC.keyWord = self.searchBar.text;
//    for (id obj in self.navigationController.viewControllers) {
//        if ([obj isKindOfClass:[SearchResultViewController class]]) {
//            isHavePushVC = YES;
//            [self.navigationController popToViewController:obj animated:YES];
//        }
//    }
//    if (isHavePushVC == NO) {
//        [self.navigationController pushViewController:pushVC animated:YES];
//    }
//    self.searchBar.text = nil;
}
//跳转到tabbar自己的item上,若不存在,新建一个tabbar
-(void)jumpToTabbar
{
    if (self.tabBarController) {
        [self.navigationController popToRootViewControllerAnimated:YES];
        return;
    }
    HKTabBarViewController *tabbar = [[HKTabBarViewController alloc]init];
    [self.navigationController pushViewController:tabbar animated:YES];
}
//跳转到tabbar上其他两个item
-(void)tabbarJumpTo:(NSInteger)index
{
    HKtabBar *customTabBar = [[HKtabBar alloc]init];
    for (id obj in self.tabBarController.tabBar.subviews) {
        if ([obj isKindOfClass:[HKtabBar class]]) {
            customTabBar = obj;
        }
    }
    HKtabBarButton *tabbarBtn = [customTabBar viewWithTag: index +100];
    [customTabBar buttonClict:tabbarBtn];
}

//跳转到登录
-(void)jumpToLogIn
{
//    BOOL isHavePushVC = NO;
//    LoginViewController *tabbar = [[LoginViewController alloc]init];
//    for (id obj in self.navigationController.viewControllers) {
//        if ([obj isKindOfClass:[LoginViewController class]]) {
//            isHavePushVC = YES;
//            [self.navigationController popToViewController:obj animated:YES];
//        }
//    }
//    if (isHavePushVC == NO) {
//        [self.navigationController pushViewController:tabbar animated:YES];
//    }
}
//是否登录
-(BOOL)isLogIn
{
    BOOL isLogin = YES;
    UserModel * model =[UserModel sharedInstance];
    if ([model.isLogin isEqualToString:@"0"] || !model.isLogin) {
        UIAlertView *alerView = [[UIAlertView alloc]initWithTitle:@"温馨提示：" message:@"您还未登陆，请先登录～" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        alerView.tag = 6;
        [alerView show];
        isLogin = NO;
    }
    return isLogin;

//    NSString *login = [self.userDefaults objectForKey:ISLOGIN];
//    if (login == nil || [login isEqualToString:@"0"]) {
//        return NO;
//    }else{
//        return YES;
//    }
}
////是否三方登录
//-(BOOL)isThirdLogin
//{
////    NSString *login = [self.userDefaults objectForKey:ISTHIRDLOGIN];
////    if (login == nil || [login isEqualToString:@"0"]) {
////        return NO;
////    }else{
////        return YES;
////    }
//}
// 移除本地存储
-(void) removeUserDefault{
    
    [self.userDefaults removeObjectForKey:ISLOGIN];
    [self.userDefaults removeObjectForKey:USER_DIC];
}
/**
 *  是否登录
 */
-(void)ifLogIn
{
    UIAlertView *alerView = [[UIAlertView alloc]initWithTitle:@"温馨提示：" message:@"您还未登陆，请先登录～" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alerView.tag = 6;
    [alerView show];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 6) {
        if (buttonIndex == 1) {
//            [self jumpToLogIn];
            [aDelegate setLoginRootVC];
        }
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self seachBtnAction];
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 验证码计时
- (void)getRegisterNumber:(UIButton *)sender {
    __block int timeout=60; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _ttimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_ttimer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_ttimer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_ttimer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [sender setTitle:@"获取" forState:UIControlStateNormal];
                sender.userInteractionEnabled = YES;
            });
        }else{
            NSString *strTime = [NSString stringWithFormat:@"%.2d", timeout];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [sender setTitle:[NSString stringWithFormat:@"%@s",strTime] forState:UIControlStateNormal];
                sender.userInteractionEnabled = NO;
                
            });
            timeout--;
        }
    });
    dispatch_resume(_ttimer);
}

// 医生信息数据

- (void)getDoctorUserInfo {
//    if (![DoctorModel sharedInstance].doctorInfo.doctorId) {
//        [MBProgressHUD messageInfo:@"未能获取基本信息,请重新登录"];
//        return;
//    }
//    NSDictionary *dic = @{@"doctor_id":[DoctorModel sharedInstance].doctorInfo.doctorId};
//    [HttpRequest DoctorUserInfoWithDic:dic Complete:^(id data) {
//        if ([data[@"code"] integerValue] == 1) {
//            NSLog(@"成功");
//        }
//    } Failure:^(NSError *error) {
//        
//    }];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


- (void)shareRequest:(NSInteger)index model:(SHFriendsCircleModel*)model{
    UMSocialPlatformType platformType;
    if (index == 0) {
        //qq
        platformType = UMSocialPlatformType_QQ;
    }else{
        //微信
        platformType = UMSocialPlatformType_WechatSession;
    }
    
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    //创建网页内容对象
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:@"盛华驾校" descr:@"" thumImage:[UIImage imageNamed:@"logo"]];
    //设置网页地址
    shareObject.webpageUrl = [SHShareView creatShareUrl:model];
//    shareObject.webpageUrl = @"https://www.baidu.com";
    //    shareObject.webpageUrl = [NSString stringWithFormat:@"%@",model.share_url];

    NSLog(@"     ------    %@   ",shareObject.webpageUrl);

    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        if (error) {
            UMSocialLogInfo(@"************Share fail with error %@*********",error);
        }else{
            if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                UMSocialShareResponse *resp = data;
                //分享结果消息
                UMSocialLogInfo(@"response message is %@",resp.message);
                //第三方原始返回的数据
                UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                
                [SHShareView hide];
                [SHShareView shareSuccess:model];
            }else{
                UMSocialLogInfo(@"response data is %@",data);
            }
        }
    }];
}



@end
