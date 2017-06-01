//
//  NSString+UUID.m
//  JX
//
//  Created by pro on 2017/4/5.
//  Copyright © 2017年 fzzl. All rights reserved.
//

#import "NSString+UUID.h"
#import "PDKeyChain.h"

@implementation NSString (UUID)

+(NSString *)getUUID
{
    NSString * strUUID = (NSString *)[PDKeyChain keyChainLoad];
    
    //首次执行该方法时，uuid为空
    if ([strUUID isEqualToString:@""] || !strUUID)
    {
        //生成一个uuid的方法
        CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
        
        strUUID = (NSString *)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault,uuidRef));
        
        //将该uuid保存到keychain
//        [PDKeyChain save:KEY_USERNAME_PASSWORD data:strUUID];
        [PDKeyChain keyChainSave:strUUID];
    }
    return strUUID;
}


@end
