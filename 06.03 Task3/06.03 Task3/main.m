//
//  main.m
//  06.03 Task3
//
//  Created by wangx on 15/9/15.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        User *user1=[[User alloc]init];
        user1.apples=[NSMutableArray arrayWithObjects:@"iPhone",@"iPad", nil];
        user1.age=20;
        
        //复制出来一个新的user对象
        User *user2=[user1 copy];
        if (user1!=user2) {
            NSLog(@"user1!=user2");
            NSLog(@"user2.age=%d",user2.age);
            NSLog(@"user2.apples=%@",user2.apples);
        }
//        NSLog(@"user1.apples:%p",user1.apples);
//        NSLog(@"user2.apples:%p",user2.apples);
        [user2.apples addObject:@"iPod"];
        
        
        NSLog(@"user1.apples:%@",user1.apples);
        NSLog(@"user2.apples:%@",user2.apples);
        }
    return 0;
}
