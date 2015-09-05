//
//  Person.m
//  01.07 Dog_Person
//
//  Created by wangx on 15/9/5.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)setName:(NSString *)name{
    _name=name;
}
-(void)setDog:(Dog *)dog{
    _dog=dog;
}

//遛狗
-(void)playDog:(NSInteger )time{
    if (time==9) {
        //9点带狗出去跑动
        [_dog run];
    }else if (time==10){
        //10点和狗玩捡球的游戏
        [_dog playBall];
    }else if(time==11){
        //11点逗狗叫
        [_dog call];
    }else{
        NSLog(@"休息中...");
    }
}
@end
