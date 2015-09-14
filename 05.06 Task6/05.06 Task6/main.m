//
//  main.m
//  05.06 Task6
//
//  Created by wangx on 15/9/14.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    //使用类方法创建的对象，都已经加入到自动释放池了
    @autoreleasepool {
        Person *person=[Person PersonWithName:@"jack"];
        NSString *string1=[NSString stringWithFormat:@"ss"];
//        [string1 release];//错误；string1已经加入到自动释放池
        //加入到自动释放池了
        NSArray *array=[NSArray array];
        [array autorelease];//错误，array已经加入到自动释放池了
        //使用新语法创建的对象，已经加入到自动释放池
        NSArray *array2=@[@"xx"];
        NSNumber *number=@100;
        NSString *s=@"xxx";
    }
    return 0;
}
