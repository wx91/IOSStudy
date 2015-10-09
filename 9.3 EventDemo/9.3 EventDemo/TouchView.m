//
//  TouchView.m
//  9.3 EventDemo
//
//  Created by wangx on 15/6/27.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "TouchView.h"

@implementation TouchView

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"TouchView toucheBegan");
    //如果不进行处理，则事件传递给下一个响应者
    [self.nextResponder touchesBegan:touches withEvent:event];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
