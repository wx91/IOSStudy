//
//  User.m
//  06.03 Task3
//
//  Created by wangx on 15/9/15.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "User.h"

@implementation User

- (id)copyWithZone:(NSZone *)zone{
//    //创建副本对象
//    User *copyuser=[[self class]allocWithZone:zone];
//    copyuser.age=self.age;
//    //将源对象持有的对象retain之后给副本对象
//    copyuser.apples=self.apples;
    //-----------------浅复制--------
    User *copyuser=[[self class]allocWithZone:zone];
    copyuser.age=self.age;
    //将源对象持有的推向
    NSMutableArray *copyApples=[_apples mutableCopy];//计数为1
    copyuser.apples=copyApples;//+1
//    [copyApples release];
    
    return copyuser;
}
@end
