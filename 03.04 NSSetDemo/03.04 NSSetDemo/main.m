//
//  main.m
//  03.03 NSSetDemo
//
//  Created by wangx on 15/9/11.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    //1.NSSet集合
    NSString *s1=@"zhangsan";
    NSString *s2=@"lisi";
    //1.创建NSSet对象
    NSSet *set1=[[NSSet alloc]initWithObjects:s1,s2, nil];
    NSSet *set2=[NSSet setWithObjects:s1,s2,nil];
    //把数组中的元素全都取出来放到set中
//    NSSet *set3=[NSSet setWithArray:array1];
    
    //2.NSSet转为数组
    NSArray *array1=[set1 allObjects];
    //3.返回元素的个数
    NSUInteger count=[set1 count];// set1.count;
    //4.从容器中随机取某个元素
    NSString *s3= [set1 anyObject];
    
    //5.NSSet不能存重复的对象
    NSString *str=@"jack";
    NSArray *array2=[NSArray arrayWithObjects:str,str,nil];
    NSLog(@"%@",array2);
    
    NSSet *set4=[NSSet setWithObjects:str,str, nil];
    NSLog(@"set4=%@",set4);
    
    /**
     *  NSSet与NSArray的区别 
     * 1.数组是有下标的，NSSet是没有下标的。
     * 2.数组是有序的，NSSet是无序的
     * 3.数组是可以重复存储同一个对象的，NSSet反之，不能存储同一个对象
     */
    
    
    
    return 0;
}
