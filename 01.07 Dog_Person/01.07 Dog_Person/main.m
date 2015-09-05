//
//  main.m
//  01.07 Dog_Person
//
//  Created by wangx on 15/9/5.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
#import "Person.h"
int main(int argc, const char * argv[]) {
    Dog *dog=[[Dog alloc]initWithName:@"小黑" withColor:@"黑色"];
    
    Person *person=[[Person alloc]init];
    person.name=@"张三";
    person.dog=dog;
    int time;
    do{
        NSLog(@"请输入事件：");
        scanf("%d",&time);
        [person playDog:time];
    }while (time>=9&&time<=11);
    
    return 0;
}
