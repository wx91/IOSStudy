//
//  Person.h
//  01.07 Dog_Person
//
//  Created by wangx on 15/9/5.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"

@interface Person : NSObject{
    NSString *_name;
    Dog *_dog;
}

-(void)setName:(NSString *)name;

-(void)setDog:(Dog *)dog;

//遛狗
-(void)playDog:(NSInteger )time;
@end
