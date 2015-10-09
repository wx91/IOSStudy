//
//  UserDB.h
//  19.1 SQLiteDemo
//
//  Created by wangx on 15/7/6.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDB : NSObject

-(void)createTable;

//插入数据
-(void)insertTable;
//查询数据
-(void)selectTable;

@end
