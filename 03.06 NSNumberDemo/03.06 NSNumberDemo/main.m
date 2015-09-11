//
//  main.m
//  03.06 NSNumberDemo
//
//  Created by wangx on 15/9/11.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    //NSNumber的使用
    //1.创建NSNumber(包装基本数据类型)
    NSNumber *intNumber=[NSNumber numberWithInt:100];
    NSNumber *floatNumber=[NSNumber numberWithFloat:9.8f];
    NSNumber *longNumber=[NSNumber numberWithLong:1234534543];
    NSNumber *boolNumber=[NSNumber numberWithBool:YES];
    
    NSArray *array=@[intNumber,floatNumber,longNumber,boolNumber];
    NSLog(@"array=%@",[array description]);
    
    //2.解包
    int intValue=[intNumber intValue];
    float floatValue=[floatNumber floatValue];
    long longValue=[longNumber longValue];
    BOOL boolValue=[boolNumber boolValue];
    
    //优化语法
    NSNumber *intNumber2=@12;//等价于[NSNumber numberWithInt:100]
    NSNumber *floatNuber2=@3.14f;
    NSNumber *longNumber2=@1234233454;
    NSNumber *boolNumber2=@YES;
    NSNumber *charNumber=@'a';
    
    //NSValue的使用
    //NSValue可以对结构体进行包装，NSValue是NSNumber的父类
    NSRange rang={10,20};
    //封包
    NSValue *rangeValue1=[NSValue valueWithRange:rang];
    NSRange range2=[rangeValue1 rangeValue];
    NSLog(@"(%ld,%ld)",range2.location,range2.length);
    
    //2.对自定义的结构体封包
    struct WXPoint {
        float x;
        float y;
    };
    struct WXPoint p={50,10};
    NSValue *pointValue=[NSValue value:&p withObjCType:@encode(struct WXPoint)];
    //自定义结构体的解包
    struct WXPoint p2;
    [pointValue getValue:&p2];
    NSLog(@"p2.x=%f,p2.y=%f",p2.x,p2.y);
    
    //NSNull使用
//    NSArray *nilArray=@[nil,nil,nil];//错误,nil不能存放到数组或字典中
    NSNull *n1=[NSNull null];
    NSNull *n2=[NSNull null];
    NSArray *nullArray=@[n1,n2];
    NSLog(@"nullArray=%@",nullArray);
    for(id item in nullArray){
        if (item==[NSNull null]) {
            NSLog(@"此位置是为空的元素");
        }
    }
    
    return 0;
}
