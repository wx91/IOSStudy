//
//  main.m
//  JSONTest4
//
//  Created by wangx on 15/5/15.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "User.h"
#import "Status.h"
#import "MJExtension.h"
#import <Foundation/Foundation.h>

void execute(void (*fn)(), NSString *comment)
{
    NSLog(@"[******************%@******************开始]", comment);
    fn();
    NSLog(@"[******************%@******************结尾]\n ", comment);
}
/**
 *  @author wangx, 15-05-15 21:05:39
 *
 *  简单字典->模型
 */
void KeyValue2Object(){
    //1.定义一个字典
    NSDictionary *dict=@{
                         @"name":@"Jack",
                         @"icon":@"lufy.png",
                         @"age":@"20",
                         @"height":@1.55,
                         @"money":@"100.9",
                         @"sex":@(SexFemale),
                         @"gay":@"true"
                         };
    //2.将字典转为User模型
    User *user=[User objectWithKeyValues:dict];
    //3.打印出User模型的属性
    NSLog(@"name=%@, icon=%@, age=%zd ,height=%@ ,money=%@, sex=%d ,gay=%d",
          user.name,user.icon,user.age,user.height,user.money,user.sex,user.gay);
}

void KeyValue2Object1(){
    //1.定义一个JSON字符串
    NSString *jsonString=@"{\"name\":\"Jack\",\"icon\":\"lufy.png\",\"age\":20}";
    //2.将JSON字符串转为User模型
    User *user=[User objectWithKeyValues:jsonString];
    //3.打印User模型的属性
    NSLog(@"name=%@, icon=%@, age=%zd",user.name,user.icon,user.age);
}
/**
 *  @author wangx, 15-05-15 23:05:08
 *
 *  复杂的字典->模型
 */
void KeyValues2Object2(){
    //1.定义一个字典
    NSDictionary *dict=@{
                         @"text":@"是啊，今天天气确实不错!",
                         @"user":@{
                                 @"name":@"Jack",
                                 @"icon":@"lufy.png"
                                 },
                         @"retweetedStatus":@{
                                 @"text":@"今天天气不错!",
                                 @"user":@{
                                         @"name":@"Rose",
                                         @"icon":@"nami.png"
                                         }
                                }

                         };
    //2.将字典转为Status模型
    Status *status=[Status objectWithKeyValues:dict];
    //3.打印status的属性
    NSString *text=status.text;
    NSString *name=status.user.name;
    NSString *icon=status.user.icon;
    NSLog(@"text=%@, name=%@, icon=%@ ",text,name,icon);
    
    //4.打印status.retweetedStatus的属性
    NSString *text2=status.retweetedStatus.text;
    NSString *name2=status.retweetedStatus.user.name;
    NSString *icon2=status.retweetedStatus.user.icon;
    NSLog(@"text2=%@, name2=%@, icon2=%@",text2,name2,icon2);
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //execute(KeyValue2Object, @"简单的字典->模型");
        //execute(KeyValue2Object1, @"JSON字符串->模型");
        execute(KeyValues2Object2, @"复杂的字典 -> 模型 (模型里面包含了模型)");
    }
    return 0;
}






