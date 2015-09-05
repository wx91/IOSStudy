//
//  Person.m
//  01.06 Set_GetMethod
//
//  Created by wangx on 15/9/5.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "Person.h"

@implementation Person


-(void)setName:(NSString *)name{
    _name=name;
    NSLog(@"setName 设置器方法");
}

-(NSString *)name{
    NSLog(@"Name 访问器方法");
    return _name;
}
-(NSString *)showInfo{
    NSLog(@"这个个人的基本信息%@",_name);
    return @"这个个人的基本信息";
}

-(void)setAge:(NSInteger)myAge{
    age=myAge;
    NSLog(@"age=%ld",age);
    //错误
    //age=age;
    //会导致递归调用，产生死循环
    //self.age=age;//[self setAge:age];
    
}
@end
