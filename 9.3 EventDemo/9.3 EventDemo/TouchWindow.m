//
//  TouchWindow.m
//  9.3 EventDemo
//
//  Created by wangx on 15/6/27.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "TouchWindow.h"

@implementation TouchWindow

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
//分发事件
-(void)sendEvent:(UIEvent *)event{
    [super sendEvent:event];
}
//事件响应
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"TouchWindow touchesBegan");
    [self.nextResponder touchesBegan:touches withEvent:event];
}
@end
