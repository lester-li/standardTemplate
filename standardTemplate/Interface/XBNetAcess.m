//
//  XBNetAcess.m
//  DouDaWanJu
//
//  Created by klgz1 on 16/1/5.
//  Copyright © 2016年 klgz. All rights reserved.
//

// 网络请求封装类

#import "XBNetAcess.h"
#import "AppDelegate.h"
#import "NSData+Encryption.h"
@implementation XBNetAcess


//加密
+ (NSString *)parameterStringTransformedByString:(NSString *)oldString{
    
    NSString *plainText = oldString;//明文
//    plainText = [plainText substringToIndex:[plainText length] - 1];
//    plainText = [plainText substringFromIndex:1];
    //明文nsstring通过utf8格式转nsdata
    NSData *plainTextData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    //将key  转成type类型
    NSString *str = @"4590aMf39567hilm2390noqYst371uyz";
    NSData *testData = [str dataUsingEncoding: NSUTF8StringEncoding];
    Byte *testByte = (Byte *)[testData bytes];
    //byte转换为NSData类型，以便下边加密方法的调用
    //密钥nsstring转nsdata
    NSData *keyData = [[NSData alloc] initWithBytes:testByte length:32];
    //明文nsdata与密钥nsdata整合为加密后的nsdata
    NSData *cipherTextData = [plainTextData AES256EncryptWithKey:keyData];
    //加密后的nsdata转base64字符串
    NSString* encodeResult = [cipherTextData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    return encodeResult;
}

//jie密
+ (NSString *)parameterStringsTransformedByString:(NSString *)oldString{
    
    NSString *plainText = oldString;//base64密文
    //    plainText = [plainText substringToIndex:[plainText length] - 1];
    //    plainText = [plainText substringFromIndex:1];
//    NSData *plainTextData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    //base64字符串转nsdata
    NSData *plainTextData = [[NSData alloc] initWithBase64EncodedString:plainText options:NSDataBase64DecodingIgnoreUnknownCharacters];
    //将key  转成type类型
    NSString *str = @"4590aMf39567hilm2390noqYst371uyz";
    NSData *testData = [str dataUsingEncoding: NSUTF8StringEncoding];
    Byte *testByte = (Byte *)[testData bytes];
    //byte转换为NSData类型，以便下边加密方法的调用
    //密钥的nsdata
    NSData *keyData = [[NSData alloc] initWithBytes:testByte length:32];
    //通过密钥的nsdata从加密后的nsdata中获取原明文的nsdata
    NSData *cipherTextData = [plainTextData AES256DecryptWithKey:keyData];
    //明文的nsdata通过utf8格式转明文字符串
    NSString* encodeResult = [[NSString alloc] initWithData:cipherTextData encoding:NSUTF8StringEncoding];
    return encodeResult;
}


// 加密数据处理
+ (NSString *)dictWithJsonAndStr:(NSDictionary *)dict;
{
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    NSString *dataSt=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSString *dataStr = [XBNetAcess parameterStringTransformedByString:dataSt];
    return dataStr;
}


// 判断状态
+ (BOOL)isStateAction:(NSMutableDictionary *)dicState{
    
 //   NSDictionary *statusDic = [dicState objectForKey:@"status"];
    NSString *code_str = [NSString stringWithFormat:@"%@",[dicState objectForKey:@"code"]];
    
    if ([code_str isEqualToString:@"1"]) {
        return YES;
    }else{
        return NO;
    }
}

//// 数据加载中
//+ (void)messageInfo:(NSString *)strInfo strBool:(BOOL)state{
//    AppDelegate *appADelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    appADelegate.hud.labelText = strInfo;
//    [appADelegate.window addSubview:appADelegate.hud];
//    [appADelegate.hud show:YES];
//    if (state == YES) {
//        return;
//    }
////    [appADelegate.hud hide:YES afterDelay:1];
//}
//
//+ (void)messageInfoHide {
//    AppDelegate *appADelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    [appADelegate.hud hide:YES];
//}

// 提示框  返回
+ (void)messageInfo:(NSString *)strInfo{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [MBProgressHUD showError:strInfo];
        
    });
}



@end
