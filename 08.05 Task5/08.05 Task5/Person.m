//
//  Person.m
//  08.05 Task5
//
//  Created by wangx on 15/9/19.
//  Copyright © 2015年 wangx. All rights reserved.
//

#import "Person.h"

@implementation Person

+(instancetype)initWithName:(NSString *)name withAge:(NSUInteger )age{
    Person *person=[[Person alloc]init];
    person.name=name;
    person.age=age;
    return person;
}
-(NSString *)description{
    NSString *s=[NSString stringWithFormat:@"name=%@,age=%lu",_name,_age];
    return s;
}

@end
