//
//  UserDB.m
//  19.2 UserDemo
//
//  Created by wangx on 15/7/7.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "UserDB.h"

static UserDB *instnce;

@implementation UserDB

+ (id)shareInstance {
    if (instnce == nil) {
        instnce = [[[self class] alloc] init];
    }
    return instnce;
}

-(void)createTable{
    NSString *sql=@"create table if not exists User(username text primary key,password text,age text)";
    [self createTable:sql];
}

-(BOOL)addUser:(UserModel *)userModel{
//    NSString *sql=@"insert or replace into User(username,password,age)values(?,?,?)";
    NSString *sql=@"insert into User(username,password,age) values (?,?,?)";
    NSArray *params=[NSArray arrayWithObjects:userModel.username,userModel.password,
                     userModel.age, nil];
   return [self dealData:sql paramsarray:params];
}

-(NSArray *)findUsers{
    NSString *sql=@"select username,password,age from User";
    NSArray *data=[self selectData:sql columns:3];
    NSMutableArray *users=[NSMutableArray array];
    for ( NSArray *row in data) {
        NSString *username=[row objectAtIndex:0];
        NSString *password=[row objectAtIndex:1];
        NSString *age=[row objectAtIndex:2];
        UserModel *user=[[UserModel alloc]init];
        user.username=username;
        user.password=password;
        user.age=age;
        [users addObject:user];
    }
    return users;
}


@end
