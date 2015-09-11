//
//  main.m
//  03.05 NSdictinaryDemo
//
//  Created by wangx on 15/9/10.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    //不可变字典(NSDictionary)
    //1.字典的创建
    NSArray *array1=[NSArray arrayWithObjects:@"zhangsan",@"zhangfei", nil];
    NSArray *array2=[NSArray arrayWithObjects:@"lisi",@"liping",nil];
    //第一个元素:key:@"zhang" value:array1;
    //第二个元素:key:@"li" value:array2
    NSDictionary *dic1=[[NSDictionary alloc]initWithObjectsAndKeys:array1,@"zhang",array2,@"li",nil];
    NSUInteger count=[dic1 count];
    NSLog(@"%ld",count);
    //创建字典时，初始化一个元素
    NSDictionary *dic2=[NSDictionary dictionaryWithObject:array1 forKey:@"zhang"];
    
    //2.获取字典中所有的key
    NSArray *allKeys=[dic1 allKeys];//[dic1.allKeys];
    NSLog(@"%@",allKeys);
    
    //3.获取字典中所有的value
    NSArray *allValues=[dic1 allValues];//[dic1.allValues]
    NSLog(@"%@",allValues);
    
    //4.通过key获取value
    NSArray *array3=[dic1 objectForKey:@"zhang"];
    NSLog(@"array3=%@",array3);
    
    //字典中优化语法
    NSDictionary *dic3=@{@"zhang":array1,@"li":array2};
    NSLog(@"dic3=%@",dic3);
    //去value的语法：字典["key"]
    NSArray *array4=dic3[@"zhang"];
    NSLog(@"%@",array4);
    
    //可变字典(NSMutableNSDictionary)
    //1.创建一个可变字典
    NSMutableDictionary *md1=[[NSMutableDictionary alloc]initWithCapacity:3];
    //2.添加元素
//    [md1 setObject:array1 forKey:@"zhang"];//向数组添加一个元素
//    [md1 setObject:array2 forKey:@"li"];
    //将字典中所有的元素添加到md1字典中
    [md1 addEntriesFromDictionary:dic1];
    //注意项目的key在字典中是不能重复添加，如果添加项目key，会把原来的value覆盖掉
    NSLog(@"md1=%@",md1);
    //3.删除
    //根据key删除元素
//    [md1 removeObjectForKey:@"zhang"];
    
    //删除所有元素
//    [md1 removeAllObjects];
    //根据多个key删除对应的多个元素
//    [md1 removeObjectsForKeys:@[@"zhang"]];
    
    //遍历字典
    //1.快速遍历
    for (NSString *key in md1) {
        NSArray *names=[md1 objectForKey:key];
        NSLog(@"key=%@,value=%@",key,names);
    }
    //普通遍历
    NSArray *allKeys2=[md1 allKeys];
    for (int i=0; i<allKeys2.count; i++) {
        NSString *key=allKeys2[i];
        NSArray *names=md1[key];
        NSLog(@"key=%@,value=%@",key,names);
    }
    //字典中的元素是无序的
    return 0;
}
