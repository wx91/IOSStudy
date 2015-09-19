//
//  Nure.m
//  08.03 Task3
//
//  Created by wangx on 15/9/19.
//  Copyright © 2015年 wangx. All rights reserved.
//

#import "Nure.h"
#import "Children.h"
@implementation Nure

-(instancetype)initWithChildren:(Children *)children{
    self=[super init];
    if (self) {
        _children=children;
        //监听一个通知，通知名为happyValueNotification，当收到通知时调用notificationAction方法
        [[NSNotificationCenter defaultCenter]addObserver:self
                                                selector:@selector(notificationAction:)
                                                    name:@"happyValueNotification"
                                                  object:nil];
    }
    return self;
}
-(void)notificationAction:(NSNotification *)notification{
    Children *child=notification.object;
    [self play:child];
}

-(void)play:(Children *)child{
    NSLog(@"保姆逗小孩玩了");
//    _children.happyValue=100;
    child.happyValue=100;
    //移除指定通知，通知名为happyValueNotification；
//    [[NSNotificationCenter  defaultCenter]removeObserver:self name:@"happyValueNotification" object:nil];
    //移除当前对象上的所有通知
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
}

@end
