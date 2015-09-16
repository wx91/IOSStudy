//
//  User.h
//  06.03 Task3
//
//  Created by wangx on 15/9/15.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject<NSCopying>
//拥有苹果设备
@property(nonatomic,retain)NSMutableArray *apples;

@property(nonatomic,assign)int age;
@end

