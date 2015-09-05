//
//  Person.h
//  01.06 Set_GetMethod
//
//  Created by wangx on 15/9/5.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject{
    NSString *_name;
    NSInteger age;
    
}

-(void)setName:(NSString *)name;

-(NSString *)name;

-(NSString *)showInfo;

-(void)setAge:(NSInteger)myAge;

-(void)test;

@end