//
//  Student.m
//  04.03 task3
//
//  Created by wangx on 15/9/12.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "Student.h"

@implementation Student
//学习的方法
-(void)study{
    NSLog(@"爱学习");
}
#pragma mark-WxhlProtocol协议方法
//完成作业的协议方法
-(void)finishTask{
    NSLog(@"每天我都高质量的完成作业！");
}
//不能迟到
-(void)dontLate{
#warning 代码过几天再来补充
    NSLog(@"早上6点起床，7点到达教师，8点开始复习");
}
//着装整洁
-(void)wearNeat{
    NSLog(@"每天穿新衣服");
}

@end
