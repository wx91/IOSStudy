//
//  BaseDB.m
//  19.2 UserDemo
//
//  Created by wangx on 15/7/7.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "BaseDB.h"
#import <sqlite3.h>
#define kFilename  @"data.sqlite"

@implementation BaseDB

-(NSString *)filePath{
    NSString *filePath=[NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@",kFilename];
    return  filePath;
}

-(void)createTable:(NSString *)sql{
    sqlite3 *sqlite=nil;
    //打开数据库
    int result=sqlite3_open([[self filePath] UTF8String], &sqlite);
    if (result!=SQLITE_OK) {
        NSLog(@"打开数据库失败！");
        sqlite3_close(sqlite);
        return ;
    }
    //执行创建表sql语句
    char *errormsg=nil;
    result=sqlite3_exec(sqlite, [sql UTF8String], NULL, NULL, &errormsg);
    if (result!=SQLITE_OK) {
        NSLog(@"创建表表失败%s",errormsg);
        sqlite3_close(sqlite);
    }
    //关闭数据库
    sqlite3_close(sqlite);
}

-(BOOL)dealData:(NSString *)sql paramsarray:(NSArray *)params{
    sqlite3 *sqlite=nil;
    sqlite3_stmt *stmt=nil;
    //打开数据库
    int result=sqlite3_open([[self filePath] UTF8String], &sqlite);
    if (result!=SQLITE_OK) {
        NSLog(@"打开数据库失败！");
        sqlite3_close(sqlite);
        return NO;
    }
    //编译sql语句
    result=sqlite3_prepare_v2(sqlite, [sql UTF8String], -1, &stmt, NULL);
    if (result!=SQLITE_OK) {
        NSLog(@"sql语句编译失败！");
        sqlite3_close(sqlite);
        return NO;
    }
    //绑定数据
    for (int i=0; i<params.count; i++) {
        NSString *value=[params objectAtIndex:i];
        sqlite3_bind_text(stmt, i+1, [value UTF8String], -1, NULL);
    }
    result=sqlite3_step(stmt);
    if (result==SQLITE_ERROR) {
        NSLog(@"sql语句执行失败");
        sqlite3_close(sqlite);
        return  NO;
    }
    sqlite3_finalize(stmt);
    sqlite3_close(sqlite);
    return  YES;
}
/**
 * 接口描述:查询数据
 *参数：   sql：SQL语句
 *返回值[
 *          ["字段1",字段2,字段3]
 *          ["字段1",字段2,字段3]
 *          ["字段1",字段2,字段3]
 *         ]
 */
//select username,password,email from User
-(NSMutableArray *)selectData:(NSString *)sql columns:(int )number{
    sqlite3 *sqlite=nil;
    sqlite3_stmt *stmt;
    //打开数据库
    int result=sqlite3_open([[self filePath] UTF8String], &sqlite);
    if (result!=SQLITE_OK) {
        NSLog(@"打开数据库失败！");
        sqlite3_close(sqlite);
        return nil;
    }
    //编译sql语句
    result=sqlite3_prepare_v2(sqlite, [sql UTF8String], -1, &stmt, NULL);
    if (result!=SQLITE_OK) {
        NSLog(@"sql语句编译失败！");
        sqlite3_close(sqlite);
        return nil;
    }
    result=sqlite3_step(stmt);
    NSMutableArray *data=[NSMutableArray array];
    while (result==SQLITE_ROW) {
        NSMutableArray *row=[NSMutableArray arrayWithCapacity:number];
        for (int i=0; i<number; i++) {
            char *columnText=(char *)sqlite3_column_text(stmt, i);
            NSString *string=[NSString stringWithUTF8String:columnText];
            [row addObject:string];
        }
        [data addObject:row];
        result=sqlite3_step(stmt);
    }
    sqlite3_finalize(stmt);
    sqlite3_close(sqlite);
    return  data;
    
}

@end
