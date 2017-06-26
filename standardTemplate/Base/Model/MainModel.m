//
//  MainModel.m
//  FamlMedical_Doctor
//
//  Created by MacBook on 2016/12/25.
//  Copyright © 2016年 macbook. All rights reserved.
//

#import "MainModel.h"

@implementation MainModel
//驼峰属性 转 json下划线
//+(NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName{
//    return [propertyName mj_underlineFromCamel];
//}
////转换id,description
//+(NSDictionary *)mj_replacedKeyFromPropertyName{
//    return @{
//             @"idField":@"id",
//             @"descriptionField":@"description"
//             };
//}
//- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property
//{
//    if ([oldValue isKindOfClass:[NSString class]] && [oldValue isEqualToString:@"<null>"]){
//        return @"";
//    };
//    if (oldValue == NULL){
//        return nil;
//    }
//    return oldValue;
//}
@end
