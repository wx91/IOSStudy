//
//  Person.h
//  01.02Person
//
//  Created by wangx on 15/9/3.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject{
    //在{}中定义类的属性
    //属性，成员变量，实例变量，全局变量
    NSString *_name;    //姓名
    
    NSInteger _age;     //年龄
    
    //注意：在OC中不能定义属性时，对属性赋值
    //    float height=1.70f;//错误
}
//函数的定义
//int func(int a,int b);
//方法的定义
//-（void）shoping;//不带参数的方法
/** - 代表的是方法类型是一个实例方法
 *  方法名：shopping
 *  返回值：void
 *  @param price float类型，price是参数的变量名
 */
-(void)shoping:(float)price;//带一个参数的方法

//----------------设置起方法（set 方法）
/**
 *  方法描述：设置属性:_name
 *
 *  @param name 个人姓名
 */
-(void)setName:(NSString *)name;

-(void)setAge:(NSInteger)age;

//----------------获取器方法（get 方法）
/*
 *方法描述：获取属性的值:_name
 */
-(NSString *)name;

-(NSInteger) age;

//int func(int a,int b);
//多个参数的方法
-(void)setName:(NSString *)name
        setAge:(NSInteger)age;
//不建议这样定义
//-(void)setName:(NSString *)name :(NSInteger)age;

/**
 *  类方法是以+好开头，使用类名调用此方法
 */
+(Person *)newPerson;
+(void)testClass;

@end
