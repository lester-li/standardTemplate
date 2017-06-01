//
//  SystemNewModel.h
//  FamlMedical_Doctor
//
//  Created by MacBook on 2017/1/21.
//  Copyright © 2017年 macbook. All rights reserved.
//

#import "MainModel.h"
@class SystemNewParam;
@interface SystemNewModel : MainModel
@property (nonatomic, copy) NSString * content;
@property (nonatomic, copy) NSString * createTime;
@property (nonatomic, copy) NSString * doctorId;
@property (nonatomic, copy) NSString * idField;
@property (nonatomic, copy) NSString * isRead;
@property (nonatomic, strong) SystemNewParam * params;
@property (nonatomic, copy) NSString * patientId;
@property (nonatomic, copy) NSString * type;
@end
@interface SystemNewParam : MainModel
@property (nonatomic, assign) NSInteger appointmentId;
@end
