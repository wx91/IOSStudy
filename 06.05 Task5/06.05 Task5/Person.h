//
//  Person.h
//  06.05 Task5
//
//  Created by wangx on 15/9/15.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
//类只有实现NSCoding协议，才具备归档功能
@interface Person : NSObject<NSCoding>

@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign)NSInteger age;
@property(nonatomic,retain)NSArray *apples;

@end
