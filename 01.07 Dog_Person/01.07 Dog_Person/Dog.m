//
//  Dog.m
//  01.07 Dog_Person
//
//  Created by wangx on 15/9/5.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "Dog.h"

@implementation Dog

-(instancetype)initWithName:(NSString *)name withColor:(NSString *)color{
    self=[super init];//nil=0
    if (self) {
        _name=name;
        _color=color;
    }
    return self;
}

//跑步
-(void)run{
    NSLog(@"颜色为：%@的狗%@在跑动",_color,_name);
}
//接球
-(void)playBall{
    NSLog(@"颜色为：%@的狗%@在捡球",_color,_name);
}
//叫
-(void)call{
    NSLog(@"颜色为：%@的狗%@在汪汪叫",_color,_name);
}

@end
