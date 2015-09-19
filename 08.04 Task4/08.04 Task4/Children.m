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
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
        self.happyValue=100;
    }
    return self;
}

-(void)timerAction:(NSTimer *)timer{
    _happyValue--;
    NSLog(@"%d",_happyValue);
    if (_happyValue<80 ) {
        //发送一个通知，通知名为:happyValueNotification
        [[NSNotificationCenter defaultCenter]postNotificationName:@"happyValueNotification" object:self];
        
    }
}

@end
