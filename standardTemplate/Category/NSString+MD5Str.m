//
//  NSString+MD5Str.m
//  签名
//
//  Created by pro on 2016/11/25.
//  Copyright © 2016年 Fyy. All rights reserved.
//

#import "NSString+MD5Str.h"
#import<CommonCrypto/CommonDigest.h>

@implementation NSString (MD5Str)
+ (NSString *) md5:(NSString *) input {
    const char *cStr = [input UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
}
@end
