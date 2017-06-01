//
//  XBNetAcess.h
//  DouDaWanJu
//
//  Created by klgz1 on 16/1/5.
//  Copyright © 2016年 klgz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "MBProgressHUD.h"

/**
 *  网络请求说明
 *
 *  构造器
 *
 *  1， 引用头文件 + 构造器
 *
 *  2， 参数
 *      url ： 转接 NetAcessInterface.h 中宏定义网址
 *
 *      POST： data -- 类型字典 -- (可变字典)
 *             FinshBlock -- 成功回调 -- 模块语法
 *
 *      GET ： FinshBlock -- 成功回调 -- 模块语法
 *
 *  3， 请求成功 ： 可以实现提示更换 (可有可无)
 *
 *  4， 请求失败 ： 统一提示 网络延迟，请重新加载~
 *
 *  5， 请求成功 ： 数据解析在对应类中实现 此类只提供 参数+请求
 */

@interface XBNetAcess : NSObject
+ (NSString *)parameterStringTransformedByString:(NSString *)oldString;

+ (NSString *)parameterStringsTransformedByString:(NSString *)oldString;


// 判断状态
+ (BOOL)isStateAction:(NSMutableDictionary *)dicState;

// 数据加载中
+ (void)messageInfo:(NSString *)strInfo strBool:(BOOL)state;

// 提示框 请求返回
+ (void)messageInfo:(NSString *)strInfo;

+ (void)messageInfoHide;

@end
