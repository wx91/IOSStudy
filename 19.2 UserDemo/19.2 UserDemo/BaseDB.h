//
//  BaseDB.h
//  19.2 UserDemo
//
//  Created by wangx on 15/7/7.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseDB : NSObject

-(void)createTable:(NSString *)sql;

/** 接口描述：插入数据，删除数据，修改数据
 *  参数：   sql：SQL语句
 *  返回值： 是否执行成功
 *
 */

-(BOOL)dealData:(NSString *)sql paramsarray:(NSArray *)params;

/**
 * 接口描述:查询数据
 *参数：   sql：SQL语句
 *返回值[
 *          ["字段1",字段2,字段3]
 *          ["字段1",字段2,字段3]
 *          ["字段1",字段2,字段3]
 *         ]
 */
-(NSMutableArray *)selectData:(NSString *)sql columns:(int )number;

@end
