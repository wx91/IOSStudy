//
//  User.m
//  05.03 Task3
//
//  Created by wangx on 15/9/13.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "User.h"

@implementation User
//生成的属性名叫userName，而不是_userName;
@synthesize userName=$userName;

//-(void)setUserName:(NSString *)userName{
    //第一种形式，普通赋值 assign
//    _userName=userName;
    //第二种形式 retain
//    if (_userName!=userName) {
//        [_userName release];
//        _userName=[userName retain];
//    }
    //第三种形式 copy
//    if (_userName!=userName) {
//        [_userName release];
//        _userName=[userName copy];
//    }
//}

-(void)showInfo{
    NSLog(@"用户名:%@",[self userName]);
    NSLog(@"用户名:%@",$userName);
}

@end
