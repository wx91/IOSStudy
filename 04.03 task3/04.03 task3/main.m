//
//  main.m
//  04.03 task3
//
//  Created by wangx on 15/9/12.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+Extension.h"
#import "Student.h"

int main(int argc, const char * argv[]) {
    
    //1.使用类目为NSString扩展的方式，该方法可以返回一个倒置的字符串
    NSString *s=@"abcdef";
    NSString *newString=[s sortString];
    NSLog(@"%@",newString);
    
    Student *stu=[[Student alloc]init];
    [stu finishTask];
    [stu dontLate];
    
//    [stu wearNeat];
    //判断wearNeat方法是否在Student类中定义，如果定义了，才调用
    if ([stu respondsToSelector:@selector(wearNeat)]) {
        [stu wearNeat];
    }
    
    
    return 0;
}
