//
//  OtherInterface.h
//  RepairService_Mechanic
//
//  Created by macbook on 16/9/12.
//  Copyright © 2016年 macbook. All rights reserved.
//

#ifndef OtherInterface_h
#define OtherInterface_h

//退出登录的通知
#define FOCE_QUIT_NOTIFICATION @"quitLoginWithOtherDevice"

#define Image_Headholder @"img"
#define CustomTabbar_height 120*WidthScale
// 其他所用到的数据宏定义 集合
#define IsIOS8         ([[[[UIDevice currentDevice] systemVersion] substringToIndex:1] intValue]>=8)
//判断是否为5代以上尺寸
#define isGTPhone5     ScreenWidth > 320.0
// 获取当前window
#define APPWINDOW      [UIApplication sharedApplication].delegate.window
// 获取当前window代理
#define aDelegate      (AppDelegate *)[UIApplication sharedApplication].delegate
// 获取屏幕高度，兼容性测试
#define ScreenHeight   [[UIScreen mainScreen] bounds].size.height
#define SelfViewHeight self.view.frame.size.height

// 获取屏幕宽度，兼容性测试
#define ScreenWidth    [[UIScreen mainScreen] bounds].size.width
#define SelfViewWidth  self.view.frame.size.width

// 宽度系数
#define WidthScale     (ScreenWidth/720.0)

// 字体大小
#define fontSize(size) [UIFont systemFontOfSize:size]
#define selfont0 isGTPhone5?20:18
#define selfont1 isGTPhone5?18:17  // 1级字体大小     导航栏标题字体
#define selfont1_2 isGTPhone5?17:16
#define selfont2 isGTPhone5?16:15  // 2级字体大小     内容文字
#define selfont3_5 isGTPhone5?15:14// 3.5级字体大小   列表内容文字
#define selfont3 isGTPhone5?13:12  // 3级字体大小
//#define selfont4_5 26*WidthScale  // 4.5级字体大小
#define selfont4 isGTPhone5?12:11  // 4级字体大小

// 获取RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)
//团队帖子  doctorName字体颜色
#define colorOf_CommentsDoctorName [UIColor colorWithHexString:@"#a80000"]
// 字体背景颜色
#define colorOf_Clean  [UIColor clearColor] //透明字体背景
#define colorOf_White  [UIColor whiteColor] //白色字体背景
#define colorOf_Black  [UIColor blackColor] //通用字体背景
#define colorOf_random [UIColor randomColor]
#define colorOf_Oriange [UIColor colorWithHexString:@"#ff8d4e"]


#define CP_ORANGE_COLOR RGB(253, 148, 90)

// 登陆提示文字颜色
#define ColorOf_placeHolder     [UIColor colorWithHexString:@"#c1c1c1"]
// 主调-蓝色
#define ColorOfTheme_Main     [UIColor colorWithHexString:@"#46b9ce"]
// 积分颜色
#define ColorOfMoney     [UIColor colorWithHexString:@"#fe5a00"]
// 主调-黄色
#define ColorOf_yellow     [UIColor colorWithRed:255./255 green:209./255 blue:0/255 alpha:1.0]
// 辅助色-红色
#define ColorOfTheme_Red      [UIColor colorWithRed:255./255 green:51./255 blue:102./255 alpha:1.0]
// 辅助色-浅蓝色
#define ColorOfTheme_Blue      [UIColor colorWithRed:12./255 green:187./255 blue:245./255 alpha:1.0]
// 辅助色-紫色
#define ColorOfTheme_Purple   [UIColor colorWithRed:185./255 green:143./255 blue:228./255 alpha:1.0]
// 深深深灰色  ---菜单栏，标题文字，重点突出文字
#define colorOf_GrayA         [UIColor colorWithRed:50./255 green:50./255 blue:50./255 alpha:1.0]
// 深深灰色    ---文字，内容文字
#define colorOf_GrayB         [UIColor colorWithRed:102./255 green:102./255 blue:102./255 alpha:1.0]
// 浅灰色      ---提示文字、时间文字
#define colorOf_GrayC         [UIColor colorWithRed:153./255 green:153./255 blue:153./255 alpha:1.0]
// 浅浅灰色    ---分割线颜色
#define colorOf_GrayD         [UIColor colorWithRed:221./255 green:221./255 blue:221./255 alpha:1.0]
// 浅浅浅灰色  ---背景色、输入框背景色
#define colorOf_GrayE         [UIColor colorWithRed:245./255 green:245./255 blue:245./255 alpha:1.0]
// 视图背景色
#define BackColorOfController [UIColor colorWithRed:239./255 green:239./255 blue:239./255 alpha:1.0]

#define buttonBackgroundColor [UIColor colorWithRed:153./255 green:153./255 blue:153./255 alpha:0.6]

#define viewBackgroundColor [UIColor colorWithRed:0./255 green:0./255 blue:0./255 alpha:0.5]

// 下划线／分割线的颜色
#define colorOf_LineGray colorOf_GrayD
#define colorOf_99 [UIColor colorWithHexString:@"#999999"]
#define colorOf_33 [UIColor colorWithHexString:@"#333333"]
#define colorOf_32 [UIColor colorWithHexString:@"#323232"]
#define colorOf_66 [UIColor colorWithHexString:@"#666666"]
#define colorOf_23 [UIColor colorWithHexString:@"#232323"]
#define colorOf_28 [UIColor colorWithHexString:@"#282828"]
#define colorOf_55 [UIColor colorWithHexString:@"#555555"]
#define colorOf_88 [UIColor colorWithHexString:@"#888888"]
#define WXColor(r,g,b)        [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define LLColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define colorOf_hexStr(str) [UIColor colorWithHexString:str]
//判断屏幕尺寸
#define is4Inch ([UIScreen mainScreen].bounds.size.height >= 568)
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

//文本冒号后面的间距
#define colonSpace     5*WSCALE1
//tableview边距
#define tableCellMargins 34*WidthScale

// 网络异常,请检查网络!!!
#define webNotion      @"网络异常,请检查网络!!!"
// 默认网络图片背景_方的
#define DEFAULTBACK    [UIImage imageNamed:@"img_xinwen01"]
// 默认网络图片背景_轮播图
#define DEFAULTBANNER  [UIImage imageNamed:@"banner"]

// 默认头像背景图片
#define DEFAULTAVATAR  [UIImage imageNamed:@"pic_tx"]


#define KFile  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"UserModel.data"]

// 友盟appKey
#define UMENAppKey @"58ad5de2aed17933"
// 微信appId
#define WeChatAppId @"wx5cc3d2bf3190b861"
// 微信secrate
#define WeChatSecrate @"3e1638910ef46f7afc5968b588f9b708"

// 高德appkey
#define GAODE_MAP_KEY @"4bb73211f54e1c143cc438f52262ab0e"


//101378107
// qq 的id
#define QQId @"101378107"




/**
 *  本地存储
 */
#define UserDefaults [NSUserDefaults standardUserDefaults]
//标识是否登录
#define ISLOGIN  @"isLogin"
#define PAYING   @"payMent"                     //预付金
#define PASSWORD @"password"                    //用户密码
#define USER_DIC @"userDic"                     //用户信息_字典

#define IsLogin [[NSUserDefaults standardUserDefaults] boolForKey:@"is_login"]


#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif





#define APP_Frame_Height   [[UIScreen mainScreen] bounds].size.height

#define App_Frame_Width    [[UIScreen mainScreen] bounds].size.width

#define ALERT(msg)  [[[UIAlertView alloc]initWithTitle:@"提示" message:msg delegate:nil \
cancelButtonTitle:@"确定" otherButtonTitles:nil,nil] show]

#define App_Delegate ((AppDelegate*)[[UIApplication sharedApplication]delegate])

#define App_RootCtr  [UIApplication sharedApplication].keyWindow.rootViewController

#define WEAKSELF __weak typeof(self) weakSelf = self;

#define XZColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define IColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define XZRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]

#define ICRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]

#define BACKGROUNDCOLOR   XZRGB(0xf4f1f1)
#define SEARCHBACKGROUNDCOLOR  [UIColor colorWithRed:(110.0)/255.0 green:(110.0)/255.0 blue:(110.0)/255.0 alpha:0.4]


#define EMOJI_CODE_TO_SYMBOL(x) ((((0x808080F0 | (x & 0x3F000) >> 4) | (x & 0xFC0) << 10) | (x & 0x1C0000) << 18) | (x & 0x3F) << 24);


#define ICFont(FONTSIZE)  [UIFont systemFontOfSize:(FONTSIZE)]
#define ICBOLDFont(FONTSIZE)  [UIFont boldSystemFontOfSize:(FONTSIZE)]
#define ICSEARCHCANCELCOLOR    [UIColor orangeColor]
#define SEARCH_HEIGHT_COLOR   ICRGB(0x027996)

//#define NE_BACKGROUND_COLOR ICRGB(0x347b97)
#define NE_BACKGROUND_COLOR ICRGB(0x027996)

#define kDiscvoerVideoPath @"Download/Video"  // video子路径
#define kChatVideoPath @"Chat/Video"  // video子路径
#define kVideoType @".mp4"        // video类型
#define kRecoderType @".wav"


#define kChatRecoderPath @"Chat/Recoder"
#define kRecodAmrType @".amr"

#define KSignInFile  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"sign.data"]
#define KStepDonateFile  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"StepDonate.data"]
#define KFriendModelFile  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"FriendModelFile.data"]



#define kNotification_Change_Comment @"Notification_Change_Comment"
#define kNotification_Change_GiftsNumber @"Notification_Change_GiftsNumber"


#endif /* OtherInterface_h */
