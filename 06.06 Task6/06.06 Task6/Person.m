//
//  Person.m
//  06.06 Task6
//
//  Created by wangx on 15/9/15.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "Person.h"

@implementation Person
//解归档时调用，解归档数据之后，会创建此对象，调用此初始化方法
- (id)initWithCoder:(NSCoder *)aDecoder{
    self=[super init];
    if (self) {
        self.name=[aDecoder decodeObjectForKey:@"name"];
        self.apples=[aDecoder decodeObjectForKey:@"apples"];
        self.age=[aDecoder decodeIntegerForKey:@"age"];
  
    }
    return self;
}
//归档时调用此方法
- (void)encodeWithCoder:(NSCoder *)aCoder{
    //将此对象的信息数据编码
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInteger:self.age forKey:@"age"];
    [aCoder encodeObject:self.apples forKey:@"apples"];
}

@end
