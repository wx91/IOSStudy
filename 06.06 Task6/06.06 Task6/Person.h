//
//  Person.h
//  06.06 Task6
//
//  Created by wangx on 15/9/15.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>

@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign)NSInteger age;
@property(nonatomic,retain)NSArray *apples;

@end
