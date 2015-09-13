//
//  main.m
//  05.03 Task3
//
//  Created by wangx on 15/9/13.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

int main(int argc, const char * argv[]) {
    
    User *user=[[User alloc]init];
//    user.userName=@"admin";
    [user setUserName:@"admin"];
    [user showInfo];
    NSString *username=user.userName;
    
    
    return 0;
}
