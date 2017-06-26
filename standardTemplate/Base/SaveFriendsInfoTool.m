//
//  SaveFriendsInfoTool.m
//  JX
//
//  Created by pro on 2017/4/21.
//  Copyright © 2017年 fzzl. All rights reserved.
//

#import "SaveFriendsInfoTool.h"

#define KFriendModelFile @"hhhhhh"

@implementation SaveFriendsInfoTool

//FriendModel *friendModel = [FriendModel mj_objectWithKeyValues:data[@"data"]];
//friendModel.avatar = [NSString stringWithFormat:@"%@%@",ServerAPI_IMAGE,friendModel.avatar];
//[SaveFriendsInfoTool saveFriendModel:friendModel];


//将好友的信息本地化 便于在获取会话列表时 能够获取用户信息
//+ (void)saveFriendModel:(FriendModel *)frinendModel{
//    
//    NSLog(@" 11 11   ");
//    dispatch_async(dispatch_queue_create("writeToLocal", DISPATCH_QUEUE_CONCURRENT), ^{
//        
//        //将好友信息存在本地
//        NSMutableArray *friendArray = [NSMutableArray array];
//        NSFileManager *fileManger = [NSFileManager defaultManager];
//        if ([fileManger fileExistsAtPath:KFriendModelFile]) {
//            friendArray = [NSKeyedUnarchiver unarchiveObjectWithFile:KFriendModelFile];
//        }
//        if (!friendArray) {
//            friendArray = [NSMutableArray array];
//        }
//        //如果本地没有保存的信息
//        if (friendArray.count == 0) {
//            [friendArray addObject:frinendModel];
//        }else{
//            NSMutableArray *tempArray = [NSMutableArray arrayWithArray:friendArray];
//            //            //如果未存则存   如果存了,头像和NickName变化了 则重新存
//            for (NSInteger i = 0; i < tempArray.count; i++) {
//                FriendModel *Examplemodel = tempArray[i];
//                if (Examplemodel.user_id == frinendModel.user_id && (![Examplemodel.avatar isEqualToString:frinendModel.avatar] || ![Examplemodel.nickname isEqualToString:frinendModel.nickname] || ![Examplemodel.lastMessage isEqualToString:frinendModel.lastMessage] || ![Examplemodel.time isEqualToString:frinendModel.time])) {
//                    
//                    [friendArray replaceObjectAtIndex:i withObject:frinendModel];
//                    break;
//                    
//                }
//                
//                if (i == tempArray.count - 1) {
//                    [friendArray addObject:frinendModel];
//                }
//            }
//        }
//        [NSKeyedArchiver archiveRootObject:friendArray toFile:KFriendModelFile];
//    });
//    
//    NSLog(@" 22   22    ");
//
//}

+ (NSMutableArray*)getFriendModelArray{
    NSMutableArray *friendArray = [NSMutableArray array];
    
    NSFileManager *fileManger = [NSFileManager defaultManager];
    if ([fileManger fileExistsAtPath:KFriendModelFile]) {
        friendArray = [NSKeyedUnarchiver unarchiveObjectWithFile:KFriendModelFile];
    }
    if (!friendArray) {
        friendArray = [NSMutableArray array];
    }

    
    return friendArray;
}

+ (void)removeAllFriendModel{
    NSFileManager *fileManger = [NSFileManager defaultManager];
    if ([fileManger fileExistsAtPath:KFriendModelFile]) {
        [fileManger removeItemAtPath:KFriendModelFile error:nil];
    }
}


@end
