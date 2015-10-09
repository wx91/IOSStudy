//
//  UserDB.h
//  19.2 UserDemo
//
//  Created by wangx on 15/7/7.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseDB.h"
#import "UserModel.h"

@interface UserDB :BaseDB
+ (id)shareInstance;
//创建用户表
-(void)createTable;
//添加用户
-(BOOL)addUser:(UserModel *)userModel;
//查询用户
-(NSArray *)findUsers;

@end
