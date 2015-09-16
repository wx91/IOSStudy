//
//  Person.h
//  01.05InitMethod
//
//  Created by wangx on 15/9/4.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject{
    NSString *_name;    //姓名
    NSInteger _age;     //年龄
}
//自定义初始化方法，将姓名name传入
-(instancetype)initWithName:(NSString *)name;
//多个参数的初始化方法
-(instancetype)initWithName:(NSString *)name withAge:(NSInteger)age;

-(void)setName:(NSString *)name;

//打印此对象的属性信息
-(void)showInfo;
@end
