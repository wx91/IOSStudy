//
//  Person.h
//  05.02 Task2
//
//  Created by wangx on 15/9/12.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"

@interface Person : NSObject{
    NSString *_name;
    Dog *_dog;
}

-(instancetype)initwithDog:(Dog *)dog;

-(void)setName:(NSString *)name;

-(void)setDog:(Dog *)dog;

-(Dog *)dog;

-(void)playDog;

@end
