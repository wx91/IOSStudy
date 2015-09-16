//
//  Person.m
//  01.05InitMethod
//
//  Created by wangx on 15/9/4.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "Person.h"

@implementation Person
//自定义初始化方法，将姓名name传入
-(instancetype)initWithName:(NSString *)name{
    /*
    self=[super init];
    if (self) {
        _name=name;
    }
    return self;
    */
    self=[self initWithName:name withAge:0];
    return self;
}
-(instancetype)initWithName:(NSString *)name withAge:(NSInteger)age{
    //使用super可以调用父类中的方法
    self=[super init];
    if (self) {
        _name=name;
        _age=age;
    }
    return self;
}

-(void)setName:(NSString *)name{
    _name=name;
}

-(void)test{
    
}

//打印此对象的属性信息
-(void)showInfo{
    NSLog(@"姓名:%@,年龄:%ld",_name,_age);
    //[对象 方法]
//    [self test];
}
@end
