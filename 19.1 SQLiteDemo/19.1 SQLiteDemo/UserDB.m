//
//  UserDB.m
//  19.1 SQLiteDemo
//
//  Created by wangx on 15/7/6.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "UserDB.h"
#import <sqlite3.h>

@implementation UserDB

-(void)createTable{
    sqlite3 *sqlite=nil;
    NSString *filePath=[NSHomeDirectory() stringByAppendingFormat:@"/Documents/data.sqlite"];
    //打开数据库
    int result=sqlite3_open([filePath UTF8String], &sqlite);
    if (result!=SQLITE_OK) {
        NSLog(@"打开数据库失败");
        return ;
    }
    //创建表的sql语句
    NSString *sql=@"create table if not exists User(username text primary key,password text,email text)";
    char *error;
    //执行sql语句
    result= sqlite3_exec(sqlite, [sql UTF8String ],NULL,NULL,&error);
    if (result!=SQLITE_OK) {
        NSLog(@"创建表失败：%s",error);
        return;
    }
    //关闭数据库
    sqlite3_close(sqlite);
    NSLog(@"创建表成功");
}


//插入数据
-(void)insertTable{
    sqlite3 *sqlite=nil;
    sqlite3_stmt *stmt=nil;
    //数据库路径
    NSString *filePath=[NSHomeDirectory() stringByAppendingFormat:@"/Documents/data.sqlite"];
    //打开数据库
    int result=sqlite3_open([filePath UTF8String], &sqlite);
    if (result!=SQLITE_OK) {
        NSLog(@"打开数据库失败");
        return ;
    }
    //创建sql语句
    NSString *sql=@"insert or replace into User(username,password,email)values(?,?,?)";
    //编译sql语句
    sqlite3_prepare_v2(sqlite, [sql UTF8String], -1, &stmt, NULL);
    NSString *username=@"jack";
    NSString *password=@"6666";
    NSString *email=@"wxhl@qq.com";
    
    //向sql语句中绑定数据，
    sqlite3_bind_text(stmt, 1, [username UTF8String], -1, NULL);
    sqlite3_bind_text(stmt, 2, [password UTF8String], -1, NULL);
    sqlite3_bind_text(stmt, 3, [email UTF8String], -1, NULL);
    //执行sql语句
    result =sqlite3_step(stmt);
    if(result==SQLITE_ERROR||result==SQLITE_MISUSE){
        NSLog(@"执行sql语句失败！");
        return ;
    }
    //关闭数据库句柄
    sqlite3_finalize(stmt);
    //关闭数据库
    sqlite3_close(sqlite);
    NSLog(@"数据插入成功!");
    
}

-(void)selectTable{
    sqlite3 *sqlite=nil;
    sqlite3_stmt *stmt=nil;
    //数据库路径
    NSString *filePath=[NSHomeDirectory() stringByAppendingFormat:@"/Documents/data.sqlite"];
    //打开数据库
    int result=sqlite3_open([filePath UTF8String], &sqlite);
    if (result!=SQLITE_OK) {
        NSLog(@"打开数据库失败");
        return ;
    }
    NSString *sql=@"select username,password,email from User where username=?";
    //向占位符中绑定数据
    NSString *username=@"jack";
    sqlite3_bind_text(stmt, 1, [username UTF8String], -1, NULL);
    
    //编译sql语句
    sqlite3_prepare_v2(sqlite, [sql UTF8String], -1, &stmt, NULL);
    //查询数据
    result=sqlite3_step(stmt);
    while (result==SQLITE_ROW) {
        char *username =(char *)sqlite3_column_text(stmt, 0);
        char *password =(char *)sqlite3_column_text(stmt, 1);
        char *email =(char *)sqlite3_column_text(stmt, 2);
        NSString *usernameString=[NSString stringWithUTF8String:username];
        NSString *passwordString=[NSString stringWithCString:password encoding:NSUTF8StringEncoding];
        NSString *emailString=[NSString stringWithUTF8String:email];
        NSLog(@"用户名:%@ 密码：%@ 邮箱:%@",usernameString,passwordString,emailString);
        result=sqlite3_step(stmt);
        
    }
    //关闭数据库句柄
    sqlite3_finalize(stmt);
    //关闭数据库
    sqlite3_close(sqlite);
    
}


@end
