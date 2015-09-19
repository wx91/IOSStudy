//
//  Children.m
//  08.03 Task3
//
//  Created by wangx on 15/9/19.
//  Copyright © 2015年 wangx. All rights reserved.
//

#import "Children.h"

@implementation Children

-(instancetype)init{
    self=[super init];
    if (self) {
        
        //启动定时器
//        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
        _happyValue=100;
        _hungryValue=100;
    }
    return self;
}

-(void)timerAction:(NSTimer *)timer{
//    //使用set方法修改属性值，才能触发KVO
    NSInteger *value=_happyValue;
//    [self setHappyValue:--value];
    //使用KVC修改属性值，也能触发KVO
    NSNumber *valueNumber=[NSNumber numberWithInteger:--value];
    [self setValue:valueNumber forKey:@"happyValue"];
    
    //    NSLog(@"_happyValue=%d",self.happyValue);
    
    
    NSInteger *value2=_hungryValue;
    self.happyValue=--value2;

}

@end
