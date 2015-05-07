//
//  ViewController.m
//  SQLiteDemo1
//
//  Created by wangx on 15/5/6.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "ViewController.h"
#define DBNAME      @"personinfo.sqlite"
#define NAME        @"name"
#define AGE         @"age"
#define ADDRESS     @"address"
#define TABLENAME   @"pserson"
static sqlite3 *db;


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void) execSql:(NSString *)sql{
    char *err;
    if (sqlite3_exec(db, [sql UTF8String], NULL, NULL, &err)!=SQLITE_OK ){
        sqlite3_close(db);
        NSLog(@"数据库操作失败！");
    }
}
-(NSString *)filePath{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *documents=[paths firstObject];
    NSString *database_path=[documents stringByAppendingPathComponent:DBNAME];
    return database_path;
}

- (IBAction)openDB:(id)sender{
    int result=sqlite3_open([[self filePath]UTF8String], &db);
    if (result==SQLITE_OK) {
        NSLog(@"数据库打开成功！");
    }else{
        NSLog(@"数据库打开失败！");
        sqlite3_close(db);
    }
}

- (IBAction)createTable:(id)sender{
    NSString *sqlCreateTable = @"CREATE TABLE IF NOT EXISTS PERSONINFO (ID INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER, address TEXT)";
    NSLog(@"%@",sqlCreateTable);
    [self execSql:sqlCreateTable];
}

- (IBAction)insertPerson:(id)sender{
    NSString *sql1 = [NSString stringWithFormat:
                      @"INSERT INTO '%@' ('%@', '%@', '%@') VALUES ('%@', '%@', '%@')",
                      TABLENAME, NAME, AGE, ADDRESS, @"张三", @"23", @"西城区"];
    
    NSString *sql2 = [NSString stringWithFormat:
                      @"INSERT INTO '%@' ('%@', '%@', '%@') VALUES ('%@', '%@', '%@')",
                      TABLENAME, NAME, AGE, ADDRESS, @"老六", @"20", @"东城区"];
    NSLog(@"%@",sql1);
    NSLog(@"%@",sql2);
    [self execSql:sql1];
    [self execSql:sql2];
}
- (IBAction)queryPerson:(id)sender{
    NSString *sqlQry=@"select * from person";
    sqlite3_stmt *stmt;
    
    if (sqlite3_prepare_v2(db,[sqlQry UTF8String],-1,&stmt,nil)==SQLITE_OK ){
        while (sqlite3_step(stmt)==SQLITE_ROW) {
            char *name=(char *)sqlite3_column_text(stmt, 1);
            NSString *nsName=[[NSString alloc]initWithUTF8String:name];
            int age=sqlite3_column_int(stmt, 2);            char *address=(char *)sqlite3_column_text(stmt, 3);
            NSString *nsAddress=[[NSString alloc]initWithUTF8String:address];
            NSLog(@"name:%@ age:%d address:%@",nsName,age,nsAddress);
        }
    }
}
- (IBAction)updatePerson:(id)sender{
    NSString *sql1 = [NSString stringWithFormat:@"update person set '%@' = '%@' ",AGE,@"45"];
    NSLog(@"%@",sql1);
    [self execSql:sql1];
    
}
- (IBAction)deletePerson:(id)sender{
    NSString *sql1 = [NSString stringWithFormat:@"delete from %@ where %@=%@",TABLENAME,AGE,@45];
    NSLog(@"%@",sql1);
    [self execSql:sql1];
}

@end
