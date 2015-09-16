//
//  main.m
//  06.06 Task6
//
//  Created by wangx on 15/9/15.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*
        Person *p=[[Person alloc]init];
        p.name=@"张三";
        p.age=20;
        p.apples=@[@"iPhone",@"iPad"];
        NSString *filePath=[NSHomeDirectory() stringByAppendingPathComponent:@"person.archiver"];
        BOOL success=[NSKeyedArchiver archiveRootObject:p toFile:filePath];
        if (success) {
            NSLog(@"person 归档成功");
        }
         */
        //2.解归档，还原person
        NSString *filePath=[NSHomeDirectory() stringByAppendingPathComponent:@"person.archiver"];
        Person *person=[NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
        NSLog(@"%@",person);
        
        Person *person1=[[Person alloc]init];
        person1.name=@"张三";
        person1.age=20;
        person1.apples=@[@"iPhone",@"iPad"];
        
        Person *person2=[[Person alloc]init];
        person2.name=@"张三";
        person2.age=20;
        person2.apples=@[@"iPhone",@"iPod"];
        NSArray array=@[person1,person2];
        
        
    }
    return 0;
}
