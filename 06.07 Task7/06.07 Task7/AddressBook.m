//
//  AddressBook.m
//  06.07 Task7
//
//  Created by wangx on 15/9/16.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "AddressBook.h"

static AddressBook *instance=nil;

@implementation AddressBook
//获取单例对象的类方法
+(AddressBook *)shareInstance{
    if (instance==nil) {
        instance=[[AddressBook alloc]init];
    }
    return instance;
}
//限制这个类只能创建一个对象allocWithZone 对应的关键字子是alloc
+ (id)allocWithZone:(NSZone *)zone{
    if (instance==nil) {
        instance=[super allocWithZone:zone];
    }
    return instance;
}
//完成NSCopying的复制方法是的为1
- (id)copyWithZone:(NSZone *)zone{
    return instance;
}
@end
