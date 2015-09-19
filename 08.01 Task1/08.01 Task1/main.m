//
//  main.m
//  08.01 Task1
//
//  Created by wangx on 15/9/19.
//  Copyright © 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person=[[Person alloc]init];
        //通过KVC对属性进行设值
        [person setValue:@"zhangsan" forKey:@"_name"];//先找name，如果没有，找_name
        //基本数据类型设值，转成NSNumber
        [person setValue:@22 forKey:@"age"];
        NSLog(@"%@",person);
        //通过KVC获取属性值
        NSString *name=[person valueForKey:@"name"];
        NSLog(@"name=%@",name);
        
        /*
         * KVC设值时，如果此属性有set方法，则优先调用set方法，如果没有则直接设置。
         * get方法也是一样的。
         */
        Dog *dog1=[[Dog alloc]init];
        NSLog(@"dog1计数:%ld",dog1.retainCount);
        //通过KVC设置对象，此对象会被retain
        [person setValue:dog1 forKey:@"dog"];
         NSLog(@"dog1计数:%ld",dog1.retainCount);

        
    }
    return 0;
}
