//
//  SaveFriendsInfoTool.h
//  JX
//
//  Created by pro on 2017/4/21.
//  Copyright © 2017年 fzzl. All rights reserved.
//

#import <Foundation/Foundation.h>

//将好友的基本信息保存在本地
@interface SaveFriendsInfoTool : NSObject



+ (NSMutableArray*)getFriendModelArray;

+ (void)removeAllFriendModel;

@end
