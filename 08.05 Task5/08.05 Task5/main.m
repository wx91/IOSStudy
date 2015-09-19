//
//  main.m
//  08.05 Task5
//
//  Created by wangx on 15/9/19.
//  Copyright © 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"


void filterPerson( NSArray *array ,NSPredicate *predicate){
    NSArray *filterArray=[array filteredArrayUsingPredicate:predicate];
    NSLog(@"filterArray=%@",filterArray);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *persons=[NSArray arrayWithObjects:
                          [Person initWithName:@"mac" withAge:20],
                          [Person initWithName:@"hate" withAge:25],
                          [Person initWithName:@"999ere" withAge:30],
                          [Person initWithName:@"aruse" withAge:28],
                          [Person initWithName:@"Erse" withAge:30],
                          [Person initWithName:@"Ahon" withAge:29],
                          [Person initWithName:@"ate" withAge:20],
                          [Person initWithName:@"Iog" withAge:30],
                          [Person initWithName:@"小白" withAge:50],
                          [Person initWithName:@"小黑" withAge:30],
                          nil];
        /*
        //年龄小于30
        //定义谓词对象，谓词对象中包含了过滤条件
        NSPredicate *predictate=[NSPredicate predicateWithFormat:@"self.age<%d",30];
        //使用谓词条件过滤数组中的元素，过滤之后返回查询的结果
        NSArray *filterArray1=[persons filteredArrayUsingPredicate:predictate];
        NSLog(@"filterArray1=%@",filterArray1);
        */
        //2.使用&&符号
//        NSPredicate *predictate=[NSPredicate predicateWithFormat:@"self.name='小白' && age>40"];
//        filterPerson(persons,predictate);
        //3, IN(包含)
//        NSString *s=@"self.name in {'小黑','ate'} || self.age in {30,50}";
//        NSPredicate *predictate=[NSPredicate predicateWithFormat:s];
//        filterPerson(persons, predictate);
        //4. 以...开头
//        NSPredicate *predicate=[NSPredicate predicateWithFormat:@"name BEGINSWITH 'a' "];
//        filterPerson(persons, predicate);
        //5. 以...结尾
//        NSPredicate *predicate=[NSPredicate predicateWithFormat:@"name ENDSWITH 'se' "];
//        filterPerson(persons, predicate);
        //6.包含...字符
//        NSPredicate *predicate=[NSPredicate predicateWithFormat:@"name CONTAINS 'a' "];
//        filterPerson(persons, predicate);
        //7.like *匹配任意多个字符 ?:表示一个字符
        /*
         * *a:以a结尾的 *a*:字符中包含a字符的
         *
         */
        NSPredicate *predicate=[NSPredicate predicateWithFormat:@"name like '*a*' "];
        filterPerson(persons, predicate);
        
    }
    return 0;
}
