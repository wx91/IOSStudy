//
//  Person.h
//  08.05 Task5
//
//  Created by wangx on 15/9/19.
//  Copyright © 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(nonatomic,copy)NSString *name;

@property(nonatomic,assign)NSUInteger age;

+(instancetype)initWithName:(NSString *)name withAge:(NSUInteger )age;

@end
